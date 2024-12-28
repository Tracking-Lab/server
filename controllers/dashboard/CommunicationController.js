const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { sendNotification } = require("../../utils/firebase/main/index");

exports.contacts = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const user = await conn.users.findOne({
        include: [
          {
            model: conn.users_types,
            as: "user_type",
          },
        ],
        where: { id: userId },
      });

      var teams = null;
      if (user.user_type.name == "ADMIN") {
        teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              include: ["user"],
            },
          ],
          where: { is_deleted: 0 },
        });
      } else {
        var ids = [];
        var teamsList = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
              include: ["user"],
            },
          ],
          where: { is_deleted: 0 },
        });
        if (teamsList) {
          ids = teamsList.map((x) => x.id);
          console.log(ids);
        }

        teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              include: ["user"],
            },
          ],
          where: { is_deleted: 0, id: { [Op.in]: ids } },
        });
      }

      if (teams) {
        for (let i = 0; i < teams.length; i++) {
          const team = teams[i];
          const conversation = await conn.conversation_participants.findOne({
            where: { participant_id: team.id, participant_type: "team" },
          });

          if (conversation) {
            teams[i].setDataValue(
              "conversation_id",
              conversation.conversation_id
            );
            teams[i].setDataValue("participant_type", "team");

            const message = await conn.conversation_messages.findOne({
              where: { conversation_id: conversation.conversation_id },
              include: ["sender"],
              order: [["id", "DESC"]],
            });

            teams[i].setDataValue("message", message);
            teams[i].messageVal = message;

            const pinMessages = await conn.conversation_messages.findAll({
              where: { conversation_id: conversation.conversation_id },
              include: [
                {
                  model: conn.conversation_messages_pin,
                  as: "conversation_messages_pin",
                  required: true,
                },
              ],
              order: [["id", "DESC"]],
            });

            teams[i].setDataValue("pin_messages", pinMessages);
          } else {
            const conversation = await conn.conversations.create({
              conversation_type: "user_to_team",
            });
            const conversation_participants =
              await conn.conversation_participants.create({
                conversation_id: conversation.id,
                participant_id: team.id,
                participant_type: "team",
              });
            teams[i].setDataValue("conversation_id", conversation.id);
            teams[i].setDataValue("participant_type", "team");
            teams[i].setDataValue("message", null);
          }
        }
      }

      var users = null;
      // if (user.user_type.name == "ADMIN") {
      users = await conn.users.findAll({
        where: { is_deleted: 0, id: { [Op.not]: userId } },
      });

      if (users) {
        for (let i = 0; i < users.length; i++) {
          const user = users[i];
          var conversations = null;
          conversations = await conn.conversation_participants.findAll({
            where: {
              participant_type: "user",
              participant_id: user.id,
            },
          });
          var hasConversation = false;
          for (let ic = 0; ic < conversations.length; ic++) {
            const conversation = conversations[ic];
            var myConversation = null;
            myConversation = await conn.conversation_participants.findOne({
              where: {
                conversation_id: conversation.conversation_id,
                participant_id: userId,
              },
            });

            if (myConversation) {
              hasConversation = true;
              users[i].setDataValue(
                "conversation_id",
                myConversation.conversation_id
              );
              users[i].setDataValue("participant_type", "user");
              const message = await conn.conversation_messages.findOne({
                where: { conversation_id: myConversation.conversation_id },
                order: [["id", "DESC"]],
              });

              users[i].setDataValue("message", message);
              users[i].messageVal = message;

              const pinMessages = await conn.conversation_messages.findAll({
                where: { conversation_id: conversation.conversation_id },
                include: [
                  {
                    model: conn.conversation_messages_pin,
                    as: "conversation_messages_pin",
                    required: true,
                  },
                ],
                order: [["id", "DESC"]],
              });

              users[i].setDataValue("pin_messages", pinMessages);
            }
          }

          if (!hasConversation) {
            console.log("conversation");
            const conversation = await conn.conversations.create({
              conversation_type: "user_to_user",
            });
            const conversation_participants =
              await conn.conversation_participants.create({
                conversation_id: conversation.id,
                participant_id: user.id,
                participant_type: "user",
              });
            const my_conversation_participants =
              await conn.conversation_participants.create({
                conversation_id: conversation.id,
                participant_id: userId,
                participant_type: "user",
              });
            users[i].setDataValue("conversation_id", conversation.id);
            users[i].setDataValue("participant_type", "user");
            users[i].setDataValue("message", null);
          }
        }
      }

      console.log(users);

      var data = {};

      teams = teams.sort((a, b) => {
        if (a.messageVal == null || b.messageVal == null) {
          return 1;
        } else if (a.messageVal.id < b.messageVal.id) {
          return 1;
        } else if (a.messageVal.id > b.messageVal.id) {
          return -1;
        }
        // a must be equal to b
        return 0;
      });
      users = users.sort((a, b) => {
        if (a.messageVal == null || b.messageVal == null) {
          return 1;
        } else if (a.messageVal.id < b.messageVal.id) {
          return 1;
        } else if (a.messageVal.id > b.messageVal.id) {
          return -1;
        }
        // a must be equal to b
        return 0;
      });
      data.teams = teams;
      data.users = users;
      res.send({
        status: true,
        data: data,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.messages = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      var page = 0; // Page number
      var limit = 50; // Number of records per page

      if (req.query.page) {
        page = req.query.page;
      }
      console.log(req.query.page);

      const offset = page * limit;

      var data = null;
      data = await conn.conversation_messages.findAll({
        where: { conversation_id: req.params.id },
        include: [
          "sender",
          {
            model: conn.conversation_messages_star,
            as: "conversation_messages_star",
            where: { user_id: userId },
            required: false,
          },
          {
            model: conn.conversation_messages_pin,
            as: "conversation_messages_pin",
            required: false,
          },
          {
            model: conn.conversation_messages_mentioned,
            as: "conversation_messages_mentioneds",
            include: ["user"],
            required: false,
          },
          "parent",
        ],
        limit,
        offset,
        order: [["id", "DESC"]],
      });
      res.send({
        status: true,
        data: data,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.createMessages = async (req, res) => {
  console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;

    var message = {
      conversation_id: req.params.id,
      parent_id: req.body.parent_id,
      sender_id: userId,
      message: req.body.message,
      media_link: req.body.media,
      type: req.body.type,
    };
    const data = await conn.conversation_messages.create(message);
    var msgC = req.body.message;
    if (req.body.type != "text") {
      msgC = req.body.type;
    }

    var sender = await conn.users.findOne({
      where: { id: userId },
    });

    if (req.body.mensioned && req.body.mensioned.length > 0) {
      var mensioned = JSON.parse(req.body.mensioned);
      console.log(mensioned);
      for (var index in mensioned) {
        var user = mensioned[index];
        await conn.conversation_messages_mentioned.create({
          message_id: data.id,
          mention_user_id: userId,
          user_id: user,
        });

        const session = await conn.sessions.findOne({
          where: { user_id: user },
        });

        var conversation = await conn.conversation_participants.findOne({
          where: {
            conversation_id: req.params.id,
          },
        });
        var team = await conn.teams.findOne({
          where: {
            id: conversation.participant_id,
          },
        });

        global.io.to(session?.socket_id).emit("newCommunication", {
          title:
            language == "en"
              ? "Mentioned from " + sender.name + " in " + team.name
              : "قام " + sender.name + " بذكرك في" + team.name,
          body: msgC,
        });

        if (session?.token) {
          // const notificationsCount = await conn.user_notifications.count({
          //   where: { user_id: reciver.id, viewed: 0 },
          // });

          var language = session?.language ?? "ar";
          sendNotification(
            session?.token,
            {
              title:
                language == "en"
                  ? "Mentioned from " + sender.name + " in " + team.name
                  : "قام " + sender.name + " بذكرك في" + team.name,
              body: msgC,
            },
            0
          );
        }
      }
    }

    if (req.body.participant_type == "user") {
      var conversation = await conn.conversation_participants.findOne({
        where: {
          conversation_id: req.params.id,
          participant_id: { [Op.not]: userId },
          participant_type: req.body.participant_type,
        },
      });

      var reciver = await conn.users.findOne({
        where: { id: conversation.participant_id },
      });

      const session = await conn.sessions.findOne({
        where: { user_id: reciver.id },
      });
      global.io.to(session?.socket_id).emit("newCommunication", {
        title: "رسالة تواصل من " + sender.name,
        body: msgC,
      });

      if (session?.token) {
        // const notificationsCount = await conn.user_notifications.count({
        //   where: { user_id: reciver.id, viewed: 0 },
        // });

        var language = session?.language ?? "ar";
        sendNotification(
          session?.token,
          {
            title:
              language == "en"
                ? "Communication message from " + sender.name
                : "رسالة تواصل من " + sender.name,
            body: msgC,
          },
          0
        );
      }
    } else {
      var conversation = await conn.conversation_participants.findOne({
        where: {
          conversation_id: req.params.id,
        },
      });
      var recivers = await conn.team_users.findAll({
        include: ["team", "user"],
        where: {
          team_id: conversation.participant_id,
          user_id: { [Op.not]: userId },
        },
      });

      for (var i = 0; i < recivers.length; i++) {
        var reciver = recivers[i];
        const session = await conn.sessions.findOne({
          where: { user_id: reciver.user.id },
        });
        global.io.to(session?.socket_id).emit("newCommunication", {
          title: "رسالة تواصل على " + reciver.team.name,
          body: sender.name + " - " + msgC,
        });

        if (session?.token) {
          // const notificationsCount = await conn.user_notifications.count({
          //   where: { user_id: user.id, viewed: 0 },
          // });

          var language = session?.language ?? "ar";
          sendNotification(
            session?.token,
            {
              title:
                language == "en"
                  ? "Communication message on " + reciver.team.name
                  : "رسالة تواصل من " + reciver.team.name,
              body: sender.name + " - " + msgC,
            },
            0
          );
        }
      }
    }

    try {
      res.send({
        status: true,
        data: data,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.deleteMessage = async (req, res) => {
  // console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const message = await conn.conversation_messages.findOne({
        where: { id: req.params.id, sender_id: userId },
      });
      if (message) {
        await conn.conversation_messages.destroy({
          where: { id: req.params.id },
        });
      }

      res.send({
        status: true,
        data: null,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.starMessage = async (req, res) => {
  // console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const message = await conn.conversation_messages_star.findOne({
        where: { message_id: req.params.id, user_id: userId },
      });
      if (message) {
        await conn.conversation_messages_star.destroy({
          where: { message_id: req.params.id, user_id: userId },
        });
      } else {
        await conn.conversation_messages_star.create({
          message_id: req.params.id,
          user_id: userId,
        });
      }

      res.send({
        status: true,
        data: null,
      });
    } catch (e) {
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.pinMessage = async (req, res) => {
  // console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const message = await conn.conversation_messages_pin.findOne({
        where: { message_id: req.body.id, conversation_id: req.params.id },
      });
      if (message) {
        await conn.conversation_messages_pin.destroy({
          where: { message_id: req.body.id, conversation_id: req.params.id },
        });
      } else {
        await conn.conversation_messages_pin.create({
          message_id: req.body.id,
          conversation_id: req.params.id,
        });
      }

      res.send({
        status: true,
        data: null,
      });
    } catch (e) {
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.searchMessage = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const messages = await conn.conversation_messages.findAll({
        include: [
          "sender",
          {
            model: conn.conversation_messages_star,
            as: "conversation_messages_star",
            where: { user_id: userId },
            required: false,
          },
          {
            model: conn.conversation_messages_pin,
            as: "conversation_messages_pin",
            required: false,
          },
          "parent",
        ],
        where: {
          message: { [Op.like]: "%" + req.body.text + "%" },
          conversation_id: req.params.id,
        },
      });

      res.send({
        status: true,
        data: messages,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.starMessages = async (req, res) => {
  // console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const messages = await conn.conversation_messages.findAll({
        include: [
          "sender",
          {
            model: conn.conversation_messages_star,
            as: "conversation_messages_star",
            where: { user_id: userId },
            required: true,
          },
          {
            model: conn.conversation_messages_pin,
            as: "conversation_messages_pin",
            required: false,
          },
          "parent",
        ],
        where: { conversation_id: req.params.id },
      });

      res.send({
        status: true,
        data: messages,
      });
    } catch (e) {
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.pinMessages = async (req, res) => {
  // console.log(req.body);
  // console.log(req.params.id);
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const messages = await conn.conversation_messages.findAll({
        include: [
          "sender",
          {
            model: conn.conversation_messages_star,
            as: "conversation_messages_star",
            where: { user_id: userId },
            required: false,
          },
          {
            model: conn.conversation_messages_pin,
            as: "conversation_messages_pin",
            required: true,
          },
          "parent",
        ],
        where: { conversation_id: req.params.id },
      });

      res.send({
        status: true,
        data: messages,
      });
    } catch (e) {
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};
