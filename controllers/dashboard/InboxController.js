const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const jwt = require("jsonwebtoken");
const { sendMessage } = require("../../utils/whatsapp/index");
const { google } = require("googleapis");
const email_configs = require("../../configs/emails/index");
const public_configs = require("../../configs/public/index");
const fs = require("fs");
const MailComposer = require("nodemailer/lib/mail-composer");
const path = require("path");
const { sendNotification } = require("../../utils/firebase/main/index");

exports.index = async (req, res) => {
  console.log(req.headers.authorization);
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

      var inboxes = 0;
      var assigneds = 0;
      if (user.user_type.name == "ADMIN") {
        inboxes = await conn.inboxes.count({
          where: { status: 0, assigned: 0, spam: 0 },
        });
        assigneds = await conn.inboxes.count({
          where: { status: 1, assigned: 1, spam: 0 },
        });
      }

      const assignedToMe = await conn.inbox_assigned_user.count({
        where: { status: 0, user_id: userId },
      });

      const favorites = await conn.favorites.count({
        where: { user_id: userId },
      });
      var teams = null;
      if (user.user_type.name == "ADMIN") {
        teams = await conn.teams.findAll();
      } else {
        teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
            },
          ],
        });
      }
      var channels = null;
      if (user.user_type.name == "ADMIN") {
        channels = await conn.channels.findAll({
          include: [
            {
              model: conn.whatsapp_channels,
              as: "whatsapp_channel",
            },
          ],
          where: { is_deleted: 0 },
        });
      } else {
        var ids = [];
        if (teams) {
          ids = teams.map((x) => x.id);
          console.log(ids);
        }

        if (ids.length > 0)
          channels = await conn.channels.findAll({
            include: [
              {
                model: conn.whatsapp_channels,
                as: "whatsapp_channel",
              },
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
            where: { is_deleted: 0 },
          });
      }

      if (channels) {
        for (let i = 0; i < channels.length; i++) {
          var channel_inboxes = await conn.inboxes.count({
            where: { channel_id: channels[i].id, status: 1 },
          });
          if (channel_inboxes && channel_inboxes > 0) {
            channels[i].setDataValue("inboxes", channel_inboxes);
          }
        }
      }
      const labels = await conn.labels.findAll();
      var users = null;
      // if (user.user_type.name == "ADMIN") {
      users = await conn.users.findAll({ where: { is_deleted: 0 } });
      if (users) {
        for (let i = 0; i < users.length; i++) {
          var user_inboxes = await conn.inbox_assigned_user.count({
            where: { status: 0, user_id: users[i].id },
          });
          if (user_inboxes && user_inboxes > 0) {
            users[i].setDataValue("inboxes", user_inboxes);
          }
        }
      }
      // } else {
      //   users = await conn.users.findAll({
      //     include: [
      //       {
      //         model: conn.team_users,
      //         as: "team_users",
      //         where: { user_id: userId },
      //       },
      //     ],
      //   });
      // }

      const templates = await conn.templates.findAll({
        where: { status: "APPROVED" },
        include: ["template_header", "template_buttons"],
      });

      const inboxResults = await conn.inbox_results.findAll();

      var data = {};
      if (inboxes && inboxes > 0) {
        data.inboxes = inboxes;
      }
      if (assigneds && assigneds > 0) {
        data.assigneds = assigneds;
      }

      if (assignedToMe && assignedToMe > 0) {
        data.assigned_to_me = assignedToMe;
      }

      if (favorites && favorites > 0) {
        data.favorites = favorites;
      }

      if (channels) {
        data.channels = channels;
      }
      if (labels) {
        data.labels = labels;
      }
      if (teams) {
        data.teams = teams;
      }
      if (users) {
        data.users = users;
      }

      if (templates) {
        data.templates = templates;
      }

      if (inboxResults) {
        data.inbox_results = inboxResults;
      }

      res.send({
        status: true,
        data: data,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.newInboxes = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      var where = { assigned: 0, status: 0, spam: 0 };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }
      if (user.user_type.name == "ADMIN") {
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
      } else {
        var teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
            },
          ],
        });

        var ids = [];
        if (teams) {
          ids = teams.map((x) => x.id);
          console.log(ids);
        }

        if (ids.length > 0) {
          var channels = await conn.channels.findAll({
            include: [
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
            where: { is_deleted: 0 },
          });

          where = {
            ...where,
            channel_id: { [Op.in]: channels.map((x) => x.id) },
          };

          inboxes = await getInboxes(
            where,
            userId,
            req.query.page,
            req.query.limit
          );
        }
      }

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.assignedInboxes = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;

      var where = { assigned: 1 };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }

      if (user.user_type.name == "ADMIN") {
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
      } else {
        var teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
            },
          ],
        });

        var ids = [];
        if (teams) {
          ids = teams.map((x) => x.id);
          console.log(ids);
        }

        if (ids.length > 0) {
          var channels = await conn.channels.findAll({
            include: [
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
            where: { is_deleted: 0 },
          });

          where = {
            ...where,
            channel_id: { [Op.in]: channels.map((x) => x.id) },
          };
          inboxes = await getInboxes(
            where,
            userId,
            req.query.page,
            req.query.limit
          );
        }
      }

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.spamInboxes = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      var where = { spam: 1 };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }

      if (user.user_type.name == "ADMIN") {
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
      } else {
        var teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
            },
          ],
        });

        var ids = [];
        if (teams) {
          ids = teams.map((x) => x.id);
          console.log(ids);
        }

        if (ids.length > 0) {
          var channels = await conn.channels.findAll({
            include: [
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
            where: { is_deleted: 0 },
          });

          where = {
            ...where,
            channel_id: { [Op.in]: channels.map((x) => x.id) },
          };

          inboxes = await getInboxes(
            where,
            userId,
            req.query.page,
            req.query.limit
          );
        }
      }

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.finishedInboxes = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      var where = { status: 2 };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }

      if (user.user_type.name == "ADMIN") {
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
      } else {
        var teams = await conn.teams.findAll({
          include: [
            {
              model: conn.team_users,
              as: "team_users",
              where: { user_id: userId },
            },
          ],
        });

        var ids = [];
        if (teams) {
          ids = teams.map((x) => x.id);
          console.log(ids);
        }

        if (ids.length > 0) {
          var channels = await conn.channels.findAll({
            include: [
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
            where: { is_deleted: 0 },
          });
          where = {
            ...where,
            channel_id: { [Op.in]: channels.map((x) => x.id) },
          };
          inboxes = await getInboxes(
            where,
            userId,
            req.query.page,
            req.query.limit
          );
        }
      }

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.assignedToMe = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      const assigneds = await conn.inbox_assigned_user.findAll({
        where: { user_id: userId, status: 0 },
      });
      if (assigneds && assigneds.length > 0) {
        var where = {
          id: { [Op.in]: assigneds.map((x) => x.inbox_id) },
        };
        if (req.query.search) {
          where = {
            ...where,
            [Op.or]: [
              {
                "$contact.name$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
              {
                "$contact.phone$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
            ],
          };
        }

        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
        // }

        if (inboxes) {
          res.send({
            status: true,
            data: inboxes,
          });
        } else {
          res.send({
            status: false,
            message: "no inboxes",
          });
        }
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.faveInboxs = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      const faves = await conn.favorites.findAll({
        where: { user_id: userId },
      });
      if (faves && faves.length > 0) {
        var where = { id: { [Op.in]: faves.map((x) => x.inbox_id) } };
        if (req.query.search) {
          where = {
            ...where,
            [Op.or]: [
              {
                "$contact.name$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
              {
                "$contact.phone$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
            ],
          };
        }

        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );

        if (inboxes) {
          // inboxes = inboxes.filter((item) => item.isFave);
          res.send({
            status: true,
            data: inboxes,
          });
        } else {
          res.send({
            status: false,
            message: "no inboxes",
          });
        }
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.menssionInboxs = async (req, res) => {
  console.log(req.headers.authorization);
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
      const mension = await conn.mentioned_inboxes.findAll({
        where: { user_id: userId },
      });

      if (mension) {
        var inboxes = null;
        var where = {
          id: { [Op.in]: mension.map((x) => x.inbox_id) },
        };
        if (req.query.search) {
          where = {
            ...where,
            [Op.or]: [
              {
                "$contact.name$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
              {
                "$contact.phone$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
            ],
          };
        }
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );

        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.teamInboxs = async (req, res) => {
  console.log("req.headers.authorization team");
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
      var inboxes = null;

      var channels = await conn.channels.findAll({
        include: [
          {
            model: conn.team_channels,
            as: "team_channels",
            where: { team_id: req.params.id },
          },
        ],
        where: { is_deleted: 0 },
      });

      var where = {
        channel_id: { [Op.in]: channels.map((x) => x.id) },
      };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }

      inboxes = await getInboxes(
        where,
        userId,
        req.query.page,
        req.query.limit
      );

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.channelInboxs = async (req, res) => {
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
      var inboxes = null;
      // if (user.user_type.name == "ADMIN") {
      var where = { channel_id: req.params.id };
      if (req.query.search) {
        where = {
          ...where,
          [Op.or]: [
            {
              "$contact.name$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
            {
              "$contact.phone$": {
                [Op.like]: `%${req.query.search}%`,
              },
            },
          ],
        };
      }

      inboxes = await getInboxes(
        where,
        userId,
        req.query.page,
        req.query.limit
      );

      if (inboxes) {
        res.send({
          status: true,
          data: inboxes,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.labelInboxs = async (req, res) => {
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
      var inboxes = null;

      const labels = await conn.inbox_labels.findAll({
        where: { label_id: req.params.id },
      });

      if (labels) {
        var where = { id: { [Op.in]: labels.map((x) => x.inbox_id) } };
        if (req.query.search) {
          where = {
            ...where,
            [Op.or]: [
              {
                "$contact.name$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
              {
                "$contact.phone$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
            ],
          };
        }

        if (user.user_type.name == "ADMIN") {
          inboxes = await getInboxes(
            where,
            userId,
            req.query.page,
            req.query.limit
          );
        } else {
          var teams = await conn.teams.findAll({
            include: [
              {
                model: conn.team_users,
                as: "team_users",
                where: { user_id: userId },
              },
            ],
          });

          var ids = [];
          if (teams) {
            ids = teams.map((x) => x.id);
            console.log(ids);
          }

          if (ids.length > 0) {
            var channels = await conn.channels.findAll({
              include: [
                {
                  model: conn.team_channels,
                  as: "team_channels",
                  where: { team_id: { [Op.in]: ids } },
                },
              ],
              where: { is_deleted: 0 },
            });

            where = {
              ...where,
              assigned: 1,
            };

            inboxes = await getInboxes(
              where,
              userId,
              req.query.page,
              req.query.limit
            );
            inboxes = inboxes.filter((item) =>
              channels.map((x) => x.id).includes(item.channel_id)
            );
          }
        }

        if (inboxes) {
          inboxes = res.send({
            status: true,
            data: inboxes,
          });
        } else {
          res.send({
            status: false,
            message: "no inboxes",
          });
        }
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.userInboxs = async (req, res) => {
  console.log(req.headers.authorization);
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
      var inboxes = null;
      const assigneds = await conn.inbox_assigned_user.findAll({
        where: { user_id: req.params.id },
      });
      if (assigneds && assigneds.length > 0) {
        var where = {
          status: { [Op.in]: [1, 2] },
          id: { [Op.in]: assigneds.map((x) => x.inbox_id) },
        };
        if (req.query.search) {
          where = {
            ...where,
            [Op.or]: [
              {
                "$contact.name$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
              {
                "$contact.phone$": {
                  [Op.like]: `%${req.query.search}%`,
                },
              },
            ],
          };
        }
        inboxes = await getInboxes(
          where,
          userId,
          req.query.page,
          req.query.limit
        );
        // }

        if (inboxes) {
          res.send({
            status: true,
            data: inboxes,
          });
        } else {
          res.send({
            status: false,
            message: "no inboxes",
          });
        }
      } else {
        res.send({
          status: false,
          message: "no inboxes",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.getInboxByID = async (req, res) => {
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
      const inbox = await getInbox(req.params.id, userId);
      if (inbox) {
        res.send({
          status: true,
          data: inbox,
        });
      } else {
        res.send({
          status: false,
          message: "no inbox",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

async function getInbox(id, userId) {
  try {
    const inbox = await conn.inboxes.findOne({
      include: [
        {
          model: conn.messages,
          as: "messages",
          limit: 1,
          include: [
            {
              model: conn.messages_template,
              as: "messages_template",
              include: ["template"],
            },
            "messages_button",
          ],
          order: [["id", "DESC"]],
          where: {
            message_id: { [Op.notIn]: ["comment_message_id", "inset_id"] },
          },
        },
        {
          model: conn.inbox_labels,
          as: "inbox_labels",
          include: ["label"],
        },
        {
          model: conn.inbox_assigned_user,
          as: "inbox_assigned_user",
          include: ["user"],
        },
        {
          model: conn.contacts,
          as: "contact",
          include: [
            {
              model: conn.contact_notes,
              as: "contact_notes",
              include: ["user"],
            },
          ],
        },
        "channel",
      ],
      where: { id: id },
    });

    if (inbox) {
      const messages = await conn.messages.count({
        where: {
          inbox_id: id,
          message_id: {
            [Op.notIn]: ["local_id", "comment_message_id", "inset_id"],
          },
        },
      });
      if (messages && messages > 0) {
        inbox.setDataValue("messages_count", messages);
      }

      const favorites = await conn.favorites.count({
        where: { inbox_id: id, user_id: userId },
      });

      if (favorites > 0) {
        inbox.setDataValue("is_fave", true);
        inbox.isFave = true;
      }

      const lastUserMessage = await conn.messages.findOne({
        where: {
          inbox_id: id,
          message_id: {
            [Op.notIn]: ["local_id", "comment_message_id", "inset_id"],
          },
        },
        order: [["id", "DESC"]],
      });

      if (lastUserMessage) {
        var timestamp = Date.now();
        var differenceInMs = timestamp - lastUserMessage.timestamp;
        var deffrentH = differenceInMs / (1000 * 60 * 60);
        console.log("deffrentH");
        console.log(deffrentH);
        if (deffrentH < 24) {
          inbox.setDataValue("send_avilabel", true);
        } else {
          inbox.setDataValue("send_avilabel", false);
        }
      } else {
        inbox.setDataValue("send_avilabel", false);
      }

      return inbox;
    } else {
      return null;
    }
  } catch (e) {
    console.log(e);
    return null;
  }
}

async function getInboxes(where, userId, page, limit) {
  try {
    var pageIn = 0;
    var limitIn = 10;

    if (page) {
      pageIn = page;
    }

    if (limit) {
      limitIn = limit;
    }

    console.log("pageIn");
    console.log(pageIn);
    console.log("limit");
    console.log(limit);

    const offset = pageIn * limitIn;
    console.log(offset);
    const inboxes = await conn.inboxes.findAll({
      include: [
        {
          model: conn.channels,
          as: "channel",
          where: { is_deleted: 0 },
        },
        "contact",
      ],
      where: where,
      offset: parseInt(offset),
      limit: parseInt(limitIn),
      order: [["updated", "DESC"]],
    });

    if (inboxes) {
      for (let i = 0; i < inboxes.length; i++) {
        var id = inboxes[i].id;
        var inbox = inboxes[i];

        // console.log(inbox);

        const messages = await conn.messages.findAll({
          limit: 1,
          order: [["id", "DESC"]],
          include: [
            {
              model: conn.messages_template,
              as: "messages_template",
              include: ["template"],
            },
            "messages_button",
            "messages_email",
          ],
          order: [["id", "DESC"]],
          where: {
            message_id: { [Op.notIn]: ["comment_message_id", "inset_id"] },
            inbox_id: id,
          },
        });
        // inboxes[i].messages = messages;
        inboxes[i].setDataValue("messages", messages);

        const inbox_labels = await conn.inbox_labels.findAll({
          include: ["label"],
          where: { inbox_id: id },
        });

        inboxes[i].setDataValue("inbox_labels", inbox_labels);

        const inbox_assigned_user = await conn.inbox_assigned_user.findOne({
          include: ["user"],
          where: { inbox_id: id },
        });

        inboxes[i].setDataValue("inbox_assigned_user", inbox_assigned_user);

        const contact = await conn.contacts.findOne({
          include: [
            {
              model: conn.contact_notes,
              as: "contact_notes",
              include: ["user"],
            },
          ],
          where: {
            id: inbox.contact_id,
          },
        });

        inboxes[i].setDataValue("contact", contact);

        const channel = await conn.channels.findOne({
          include: ["email_channel", "whatsapp_channel"],
          where: { is_deleted: 0, id: inbox.channel_id },
        });

        inboxes[i].setDataValue("channel", channel);

        const messagesCount = await conn.messages.count({
          where: {
            inbox_id: id,
            message_id: {
              [Op.notIn]: ["local_id", "comment_message_id", "inset_id"],
            },
          },
        });
        if (messagesCount && messagesCount > 0) {
          inboxes[i].setDataValue("messages_count", messagesCount);
        }

        const favorites = await conn.favorites.count({
          where: { inbox_id: id, user_id: userId },
        });

        if (favorites > 0) {
          inboxes[i].setDataValue("is_fave", true);
          inboxes[i].isFave = true;
        }

        const lastUserMessage = await conn.messages.findOne({
          where: {
            inbox_id: id,
            message_id: {
              [Op.notIn]: ["local_id", "comment_message_id", "inset_id"],
            },
          },
          order: [["id", "DESC"]],
        });

        if (lastUserMessage) {
          var timestamp = Date.now();
          var differenceInMs = timestamp - lastUserMessage.timestamp;
          var deffrentH = differenceInMs / (1000 * 60 * 60);
          console.log("deffrentH");
          console.log(deffrentH);
          if (deffrentH < 24) {
            inboxes[i].setDataValue("send_avilabel", true);
          } else {
            inboxes[i].setDataValue("send_avilabel", false);
          }
        } else {
          inboxes[i].setDataValue("send_avilabel", false);
        }
      }
      return inboxes;
    } else {
      return [];
    }
  } catch (e) {
    console.log(e);
    return [];
  }
}

exports.finishInbox = async (req, res) => {
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
    console.log(req.body);
    console.log(req.params.id);
    try {
      const inbox = await conn.inboxes.findOne({
        where: { id: req.params.id },
      });

      if (inbox) {
        await conn.inboxes.update(
          {
            status: 2,
            assigned: 0,
            result: req.body.result,
          },
          { where: { id: req.params.id } }
        );
        await conn.inbox_assigned_user.update(
          {
            status: 1,
          },
          { where: { inbox_id: req.params.id } }
        );

        const userCreater = await conn.users.findOne({
          where: { id: userId },
        });
        var messageContent = "تم الإغلاق بواسطة " + userCreater.name;
        var timestamp = Date.now();
        var message = {
          from_phone: userCreater.phone,
          inbox_id: req.params.id,
          message_id: "inset_id",
          timestamp: timestamp,
          message: messageContent,
          media_link: null,
          viewed: 1,
          type: "inset_id",
          user_id: userId,
        };

        await conn.messages.create(message);
        res.send({
          status: true,
          data: inbox,
        });
      } else {
        res.send({
          status: false,
          message: "no inboxe",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.messages = async (req, res) => {
  try {
    console.log(req.query);
    var page = 0; // Page number
    var limit = 50; // Number of records per page

    if (req.query.page) {
      page = req.query.page;
    }
    console.log(req.query.page);

    const offset = page * limit;
    console.log(offset);

    const messages = await conn.messages.findAll({
      where: { inbox_id: req.params.id },
      include: [
        "user",
        {
          model: conn.messages_template,
          as: "messages_template",
          include: [
            {
              model: conn.templates,
              as: "template",
              include: ["template_header", "template_buttons"],
            },
          ],
        },
        "messages_button",
        {
          model: conn.messages_email,
          as: "messages_email",
          include: ["messages_email_attachments"],
        },
      ],
      limit,
      offset,
      order: [["id", "DESC"]],
    });

    if (messages) {
      await conn.messages.update(
        {
          viewed: 1,
        },
        {
          where: { inbox_id: req.params.id },
        }
      );

      res.send({
        status: true,
        data: messages,
      });
    } else {
      res.send({
        status: false,
        message: "no messages",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.labelInbox = async (req, res) => {
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
    console.log(req.body);
    console.log(req.params.id);
    try {
      const inbox_labels = await conn.inbox_labels.findOne({
        where: { inbox_id: req.params.id, label_id: req.body.id },
      });

      if (inbox_labels) {
        res.send({
          status: false,
          data: inbox_labels,
        });
      } else {
        const inbox_label = await conn.inbox_labels.create({
          inbox_id: req.params.id,
          label_id: req.body.id,
        });

        const userCreater = await conn.users.findOne({
          where: { id: userId },
        });

        var messageContent =
          "صنف " + userCreater.name + " المحادثة بـ " + req.body.name;
        var timestamp = Date.now();
        var message = {
          from_phone: userCreater.phone,
          inbox_id: req.params.id,
          message_id: "inset_id",
          timestamp: timestamp,
          message: messageContent,
          media_link: null,
          viewed: 1,
          type: "inset_id",
          user_id: userId,
        };

        await conn.messages.create(message);

        res.send({
          status: true,
          data: inbox_label,
        });
      }
    } catch (e) {
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.removeLabel = async (req, res) => {
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
    console.log(req.body);
    console.log(req.params.id);
    try {
      const inbox_label = await conn.inbox_labels.findOne({
        include: ["label"],
        where: { id: req.body.id },
      });

      if (inbox_label) {
        const delete_label = await conn.inbox_labels.destroy({
          where: { id: req.body.id },
        });

        const userCreater = await conn.users.findOne({
          where: { id: userId },
        });

        var messageContent =
          "قام " + userCreater.name + " بحذف التصنيف " + inbox_label.label.name;
        var timestamp = Date.now();
        var message = {
          from_phone: userCreater.phone,
          inbox_id: req.params.id,
          message_id: "inset_id",
          timestamp: timestamp,
          message: messageContent,
          media_link: null,
          viewed: 1,
          type: "inset_id",
          user_id: userId,
        };

        await conn.messages.create(message);

        res.send({
          status: true,
          data: inbox_label,
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.assignInbox = async (req, res) => {
  console.log("createMessage");
  console.log(req.body);
  console.log();
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
    console.log(req.body);
    console.log(req.params.id);
    try {
      const inbox_assigned_user = await conn.inbox_assigned_user.findOne({
        where: { inbox_id: req.params.id },
      });

      if (inbox_assigned_user) {
        const inbox_assigned_user = await conn.inbox_assigned_user.update(
          { user_id: req.body.id, status: 0 },
          { where: { inbox_id: req.params.id } }
        );

        await conn.inboxes.update(
          {
            assigned: 1,
            status: 1,
          },
          { where: { id: req.params.id } }
        );
      } else {
        const inbox_assigned_user = await conn.inbox_assigned_user.create({
          inbox_id: req.params.id,
          user_id: req.body.id,
          status: 0,
        });

        await conn.inboxes.update(
          {
            assigned: 1,
            status: 1,
          },
          { where: { id: req.params.id } }
        );
      }

      const user1 = await conn.users.findOne({
        where: { id: req.body.id },
      });

      const userCreater = await conn.users.findOne({
        where: { id: userId },
      });
      var messageContent =
        "تم التعيين لـ " + user1.name + " بواسطة " + userCreater.name;
      var timestamp = Date.now();
      var message = {
        from_phone: userCreater.phone,
        inbox_id: req.params.id,
        message_id: "inset_id",
        timestamp: timestamp,
        message: messageContent,
        media_link: null,
        viewed: 1,
        type: "inset_id",
        user_id: userId,
      };

      await conn.messages.create(message);

      // if (userId != req.body.id) {
      const session = await conn.sessions.findOne({
        where: { user_id: req.body.id },
      });
      if (session) {
        await conn.user_notifications.create({
          user_id: req.body.id,
          inbox_id: req.params.id,
          title: "لديك محادثة جديدة",
          body: "تم تعيين المحادثة لك",
          title_en: "New conversation",
          body_en: "Conversation assigned to you",
        });
        global.io.to(session?.socket_id).emit("newInbox", {
          title: "لديك محادثة جديدة",
          body: "تم تعيين المحادثة لك",
        });

        if (session?.token) {
          const notificationsCount = await conn.user_notifications.count({
            where: { user_id: req.body.id, viewed: 0 },
          });
          var language = session?.language ?? "ar";
          sendNotification(
            session?.token,
            {
              title:
                language == "en" ? "New conversation" : "لديك محادثة جديدة",
              body:
                language == "en"
                  ? "Conversation assigned to you"
                  : "تم تعيين المحادثة لك",
            },
            notificationsCount
          );
        }
      }
      // }

      res.send({
        status: true,
        data: inbox_assigned_user,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.reopenInbox = async (req, res) => {
  console.log("createMessage");
  console.log(req.body);
  console.log();
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
    console.log(req.body);
    console.log(req.params.id);
    try {
      const inbox_assigned_user = await conn.inbox_assigned_user.update(
        { user_id: userId, status: 0 },
        { where: { inbox_id: req.params.id } }
      );

      await conn.inboxes.update(
        {
          assigned: 1,
          status: 1,
        },
        { where: { id: req.params.id } }
      );

      const userCreater = await conn.users.findOne({
        where: { id: userId },
      });
      var messageContent = "تم إعادة الفتح بواسطة " + userCreater.name;
      var timestamp = Date.now();
      var message = {
        from_phone: userCreater.phone,
        inbox_id: req.params.id,
        message_id: "inset_id",
        timestamp: timestamp,
        message: messageContent,
        media_link: null,
        viewed: 1,
        type: "inset_id",
        user_id: userId,
      };

      await conn.messages.create(message);

      res.send({
        status: true,
        data: inbox_assigned_user,
      });
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.mensionInbox = async (req, res) => {
  console.log(req.body);
  console.log(req.params.id);
  try {
    const mensionInbox = await conn.mentioned_inboxes.findOne({
      where: { inbox_id: req.params.id, user_id: req.body.id },
    });

    if (mensionInbox) {
      res.send({
        status: true,
        data: mensionInbox,
      });
    } else {
      const mensionInbox = await conn.mentioned_inboxes.create({
        inbox_id: req.params.id,
        user_id: req.body.id,
        mentioned_user_id: req.body.user_id,
      });
      res.send({
        status: true,
        data: mensionInbox,
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.spamInbox = async (req, res) => {
  console.log(req.body);
  console.log(req.params.id);
  try {
    const inbox = await conn.inboxes.findOne({
      where: { id: req.params.id },
    });
    var spam = 0;
    if (inbox.spam == 0) {
      spam = 1;
      await conn.inboxes.update(
        { spam: spam, status: 2, assigned: 0, result: "بريد مزعج" },
        {
          where: { id: req.params.id },
        }
      );

      await conn.inbox_assigned_user.update(
        {
          status: 1,
        },
        { where: { inbox_id: req.params.id } }
      );
    } else {
      spam = 0;
      await conn.inboxes.update(
        { spam: spam },
        {
          where: { id: req.params.id },
        }
      );
    }

    res.send({
      status: true,
      data: null,
    });
  } catch (e) {
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.addInboxToFave = async (req, res) => {
  console.log(req.body);
  console.log(req.params.id);
  try {
    const fave = await conn.favorites.findOne({
      where: { inbox_id: req.params.id, user_id: req.body.user_id },
    });

    if (fave) {
      await conn.favorites.destroy({
        where: { inbox_id: req.params.id, user_id: req.body.user_id },
      });
    } else {
      await conn.favorites.create({
        inbox_id: req.params.id,
        user_id: req.body.user_id,
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
};

exports.createMessage = async (req, res) => {
  console.log("createMessage");
  console.log(req.body);
  console.log();
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

      var timestamp = Date.now();
      var message = {
        from_phone: user.phone,
        inbox_id: req.params.id,
        message_id: "local_id",
        timestamp: timestamp,
        message: req.body.message,
        media_link: req.body.media,
        viewed: 1,
        type: req.body.type,
        user_id: userId,
      };

      const inbox = await conn.inboxes.findOne({
        where: { id: req.params.id },
        include: [
          {
            model: conn.channels,
            as: "channel",
            include: ["whatsapp_channel", "email_channel"],
          },
          "contact",
        ],
      });
      if (inbox) {
        const result = await conn.messages.create(message);
        if (result) {
          await conn.inboxes.update(
            { updated: Date.now() },
            { where: { id: inbox.id } }
          );
          // const sending = true;
          if (inbox.channel.whatsapp_channel != null) {
            if (req.body.type == "template") {
              await conn.messages_template.create({
                message_id: result.id,
                template_id: req.body.template.id,
              });
            }
            const sended = await sendWhatsappMessage(
              req.body.type,
              req.body,
              inbox.channel.whatsapp_channel,
              inbox.contact
            );
            if (sended) {
              res.send({
                status: true,
                data: inbox,
              });
            } else {
              res.send({
                status: false,
                data: inbox,
              });
            }
          } else if (inbox.channel.email_channel != null) {
            const message_email = await conn.messages_email.create({
              message_id: result.id,
              subject: req.body.subject,
              sender: inbox.channel.email_channel.email,
              body: req.body.message,
            });

            if (req.body.attachments?.length > 0) {
              for (var k = 0; k < req.body.attachments?.length; k++) {
                await conn.messages_email_attachments.create({
                  messages_email_id: message_email.id,
                  attachment: req.body.attachments[k],
                });
              }
            }

            const inboxEmail = await conn.inbox_email.findOne({
              where: { inbox_id: inbox.id },
            });
            if (inboxEmail) {
              const token = await refreshAccessToken(
                inbox.channel.email_channel.refresh_token
              );
              const emailSendData = await sendReply(
                token,
                inboxEmail.thread_id,
                inbox.channel.email_channel.email,
                inbox.contact.email,
                req.body.subject,
                req.body.message,
                req.body.attachments
              );

              res.send({
                status: true,
                data: emailSendData,
              });
            } else {
              res.send({
                status: true,
                data: inbox,
              });
            }
          } else {
            res.send({
              status: true,
              data: inbox,
            });
          }
        } else {
          res.send({
            status: false,
            data: inbox,
          });
        }
      } else {
        res.send({
          status: false,
          data: "no inbox fount",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.createComment = async (req, res) => {
  console.log("createComment");
  console.log(req.body);
  console.log();
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

      var timestamp = Date.now();
      var message = {
        from_phone: user.phone,
        inbox_id: req.params.id,
        message_id: "comment_message_id",
        timestamp: timestamp,
        message: req.body.message,
        media_link: req.body.media,
        viewed: 1,
        type: req.body.type,
        user_id: userId,
      };

      const inbox = await conn.inboxes.findOne({
        where: { id: req.params.id },
        include: ["channel", "contact"],
      });
      if (inbox) {
        const result = await conn.messages.create(message);
        if (result) {
          if (req.body.mension) {
            const mensionInbox = await conn.mentioned_inboxes.findOne({
              where: { inbox_id: req.params.id, user_id: req.body.mension.id },
            });

            if (!mensionInbox) {
              const mensionInbox = await conn.mentioned_inboxes.create({
                inbox_id: req.params.id,
                user_id: req.body.mension.id,
                mentioned_user_id: userId,
              });
            }

            var creater = user.name;

            await conn.user_notifications.create({
              user_id: req.body.mension.id,
              inbox_id: req.params.id,
              title: "قام " + creater + " بذكرك في محادثة",
              body: req.body.message,
              title_en: "" + creater + " mension you in conversation",
              body_en: req.body.message,
            });
            const session = await conn.sessions.findOne({
              where: { user_id: req.body.mension.id },
            });
            global.io.to(session?.socket_id).emit("newInbox", {
              title: "قام " + creater + " بذكرك في محادثة",
              body: req.body.message,
            });

            if (session?.token) {
              const notificationsCount = await conn.user_notifications.count({
                where: { user_id: req.body.mension.id, viewed: 0 },
              });
              var language = session?.language ?? "ar";
              sendNotification(
                session?.token,
                {
                  title:
                    language == "en"
                      ? "" + creater + " mension you in conversation"
                      : "قام " + creater + " بذكرك في محادثة",
                  body: req.body.message,
                },
                notificationsCount
              );
            }
          }

          await conn.inboxes.update(
            { updated: Date.now() },
            { where: { id: inbox.id } }
          );
          res.send({
            status: true,
            data: inbox,
          });
        } else {
          res.send({
            status: false,
            data: inbox,
          });
        }
      } else {
        res.send({
          status: false,
          data: "no inbox fount",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.deleteComment = async (req, res) => {
  console.log("deleteComment");
  console.log(req.body);
  console.log();
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
      const inbox = await conn.inboxes.findOne({
        where: { id: req.params.id },
      });
      if (inbox) {
        await conn.messages.destroy({
          where: { id: req.body.id },
        });

        res.send({
          status: true,
          data: "no inbox fount",
        });
      } else {
        res.send({
          status: false,
          data: "no inbox fount",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.newChat = async (req, res) => {
  console.log(req.body);
  console.log();
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
      const channel = await conn.channels.findOne({
        include: [
          {
            model: conn.whatsapp_channels,
            as: "whatsapp_channel",
            required: true,
            where: { id: req.body.channel_id },
          },
        ],
      });

      if (channel) {
        var contact = await conn.contacts.findOne({
          where: { phone: req.body.phone_number },
        });
        if (!contact) {
          contact = await conn.contacts.create({
            phone: req.body.phone_number,
          });
        }

        if (contact) {
          var inbox = await conn.inboxes.findOne({
            where: { contact_id: contact.id, channel_id: channel.id },
            include: [
              {
                model: conn.channels,
                as: "channel",
                include: ["whatsapp_channel"],
              },
              "contact",
            ],
          });
          if (!inbox) {
            inbox = await conn.inboxes.create({
              contact_id: contact.id,
              channel_id: channel.id,
              assigned: 1,
              status: 1,
            });

            inbox = await getInbox(inbox.id, userId);

            var messageNote = "تم إنشاء التذكرة بواسطة " + user.name;
            var timestamp = Date.now();
            var messageN = {
              from_phone: user.phone,
              inbox_id: inbox.id,
              message_id: "inset_id",
              timestamp: timestamp,
              message: messageNote,
              media_link: null,
              viewed: 1,
              type: "inset_id",
            };

            await conn.messages.create(messageN);

            await conn.inbox_assigned_user.create({
              inbox_id: inbox.id,
              user_id: userId,
              status: 0,
            });

            var messageNote = "تم التعيين بواسطة " + user.name;
            var timestamp = Date.now();
            var messageN = {
              from_phone: user.phone,
              inbox_id: inbox.id,
              message_id: "inset_id",
              timestamp: timestamp,
              message: messageNote,
              media_link: null,
              viewed: 1,
              type: "inset_id",
            };
            await conn.messages.create(messageN);

            if (channel.whatsapp_channel != null) {
              console.log("yesss");
              const sending = await sendWhatsappMessage(
                message_type,
                req.body,
                channel.whatsapp_channel,
                contact
              );

              if (sending) {
                res.send({
                  status: true,
                  data: inbox,
                });
              } else {
                res.send({
                  status: false,
                  data: inbox,
                });
              }
            } else {
              res.send({
                status: false,
                message: "fail to create",
              });
            }
          } else {
            inbox = await getInbox(inbox.id, userId);

            if (inbox.status == 2) {
              var messageNote = "تم إعادة الفتح بواسطة " + user.name;
              var timestamp = Date.now();
              var messageN = {
                from_phone: user.phone,
                inbox_id: inbox.id,
                message_id: "inset_id",
                timestamp: timestamp,
                message: messageNote,
                media_link: null,
                viewed: 1,
                type: "inset_id",
              };

              await conn.messages.create(messageN);
            }

            await conn.inboxes.update(
              { updated: Date.now(), assigned: 1, status: 1 },
              { where: { id: inbox.id } }
            );
            const assigin = await conn.inbox_assigned_user.findOne({
              where: { inbox_id: inbox.id },
            });

            if (assigin) {
              await conn.inbox_assigned_user.update(
                { user_id: userId, status: 0 },
                { where: { inbox_id: inbox.id } }
              );
            } else {
              await conn.inbox_assigned_user.create({
                inbox_id: inbox.id,
                user_id: userId,
                status: 0,
              });
            }
          }

          if (inbox) {
            var message_type =
              req.body.message_type == "template" ? "template" : "text";

            var timestamp = Date.now();
            const message = await conn.messages.create({
              from_phone: user.phone,
              inbox_id: inbox.id,
              message_id: "local_id",
              timestamp: timestamp,
              message: req.body.message,
              viewed: 1,
              user_id: userId,
              type: message_type,
            });

            if (message) {
              await conn.inboxes.update(
                { updated: Date.now() },
                { where: { id: inbox.id } }
              );
              if (message_type == "template") {
                await conn.messages_template.create({
                  message_id: message.id,
                  template_id: req.body.template.id,
                });
              }
              console.log("sdsdsdsdsdsdsd");
              console.log(channel);
              if (channel.whatsapp_channel != null) {
                const sending = await sendWhatsappMessage(
                  message_type,
                  req.body,
                  channel.whatsapp_channel,
                  contact
                );

                if (sending) {
                  res.send({
                    status: true,
                    data: message,
                  });
                } else {
                  res.send({
                    status: false,
                    data: message,
                  });
                }
              } else {
                res.send({
                  status: false,
                  message: "fail to create",
                });
              }
            } else {
              res.send({
                status: false,
                message: "fail to create",
              });
            }
          } else {
            res.send({
              status: false,
              message: "fail to create",
            });
          }
        } else {
          res.send({
            status: false,
            message: "phone not valid",
          });
        }
      } else {
        res.send({
          status: false,
          message: "channel not valid",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

async function sendWhatsappMessage(message_type, body, channel, contact) {
  try {
    if (message_type == "template") {
      var template = {
        name: body.template.name,
        language: { code: body.template.language },
      };
      var components = [];
      if (body.template.header && body.template.header != null) {
        var type_h = body.template.header;
        var params = [];

        // if (body.template.header == "TEXT") {
        //   params.push({
        //     type: "text",
        //     text: body.template.template_header.value,
        //   });
        // }

        if (body.template.header == "IMAGE") {
          params.push({
            type: "image",
            image: {
              link: body.template.template_header.value,
            },
          });
        }
        if (body.template.header == "VIDEO") {
          params.push({
            type: "video",
            video: {
              link: body.template.template_header.value,
            },
          });
        }
        if (body.template.header == "DOCUMENT") {
          params.push({
            type: "document",
            document: {
              link: body.template.template_header.value,
            },
          });
        }

        components.push({
          type: "header",
          parameters: params,
        });
      }

      console.log(components);

      if (body.template.body_inputs != 0) {
        var params = [];
        for (let i = 0; i < body.template.body_inputs.length; i++) {
          var value = body.template.body_inputs[i].value;
          params.push({ type: "text", text: value });
        }
        components.push({
          type: "body",
          parameters: params,
        });
      }

      console.log(components);
      if (components.length > 0) {
        template.components = components;
      }

      return await sendMessage(
        channel.phone_id,
        channel.token,
        contact.phone,
        "template",
        {
          template: template,
        }
      );
    } else {
      var params = {};
      if (message_type == "text") {
        params = { body: body.message };
      } else {
        params = {
          // link: "http://individual.gpstracmap.com/bot/public/messages/1721219492238929.jpeg",
          link: public_configs.config.domain + body.media,
        };

        if (body.message != null && body.message != "null") {
          params.caption = body.message;
        }
      }
      return await sendMessage(
        channel.phone_id,
        channel.token,
        contact.phone,
        message_type,
        params
      );
    }
  } catch (e) {
    console.log(e);
    return false;
  }
}

async function sendReply(
  token,
  threadId,
  channelEmail,
  recipientEmail,
  subject,
  messageBody,
  attachments
) {
  const oauth2Client = new google.auth.OAuth2(
    email_configs.email.CLIENT_ID,
    email_configs.email.CLIENT_SECRET,
    email_configs.email.REDIRECT_URL
  );
  oauth2Client.setCredentials({ access_token: token });

  const gmail = google.gmail({ version: "v1", auth: oauth2Client });
  var attachmentsfiles = [];
  if (attachments) {
    for (var i = 0; i < attachments.length; i++) {
      const mediaFile = fs.readFileSync("./" + attachments[i]);
      attachmentsfiles.push({
        filename: path.basename("./" + attachments[i]), // Name of the attached file
        content: mediaFile, // The file content (buffer)
        encoding: "base64", // Base64 encoding for the attachment
      });
    }
  }

  const mail = new MailComposer({
    from: channelEmail,
    to: recipientEmail,
    subject: subject,
    text: messageBody,
    attachments: attachmentsfiles,
    references: threadId, // To keep the reply in the same thread
    inReplyTo: threadId, // To indicate it's a reply to the message
  });

  // Step 3: Build the raw email
  const rawEmail = await new Promise((resolve, reject) => {
    mail.compile().build((err, message) => {
      if (err) {
        reject(err);
      } else {
        resolve(message);
      }
    });
  });

  // // Compose the email message
  // const messageParts = [
  //   `To: ${recipientEmail}`,
  //   "Content-Type: text/html; charset=UTF-8",
  //   "MIME-Version: 1.0",
  //   `Subject: ${subject}`,
  //   "", // Blank line between headers and body
  //   messageBody, // The actual message body (could be plain text or HTML)
  // ];

  // // Join the message parts with newlines and base64 encode it
  // const message = messageParts.join("\r\n");
  // const encodedMessage = Buffer.from(message).toString("base64");
  const encodedEmail = Buffer.from(rawEmail)
    .toString("base64")
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=+$/, "");
  // return null;

  try {
    // Send the message
    const res = await gmail.users.messages.send({
      userId: "me",
      requestBody: {
        raw: encodedEmail,
        threadId: threadId, // Replying to the same thread
      },
    });

    return res.data;
  } catch (error) {
    console.error("Error sending reply:", error);
    return null;
  }
}

async function refreshAccessToken(refreshToken) {
  console.log(email_configs.email.CLIENT_ID);
  const oauth2Client = new google.auth.OAuth2(
    email_configs.email.CLIENT_ID,
    email_configs.email.CLIENT_SECRET,
    email_configs.email.REDIRECT_URL
  );

  console.log(refreshToken);
  // Set the refresh token
  oauth2Client.setCredentials({
    refresh_token: refreshToken,
  });

  // Get new access token
  const { credentials } = await oauth2Client.refreshAccessToken();
  return credentials.access_token;
}

exports.contactInfo = async (req, res) => {
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
      const contact = await conn.contacts.findOne({
        where: { id: req.body.id },
      });

      if (contact) {
        await conn.contacts.update(
          { [req.body.key]: req.body.value },
          {
            where: {
              id: req.body.id,
            },
          }
        );
        res.send({
          status: true,
          message: null,
        });
      } else {
        res.send({
          status: false,
          message: "contact not found",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.contactNote = async (req, res) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const note = await conn.contact_notes.create(req.body);
    if (note) {
      res.send({
        status: true,
        data: note,
      });
    } else {
      res.send({
        status: false,
        message: "note not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.replays = async (req, res) => {
  try {
    const replays = await conn.replays.findAll();
    if (replays) {
      res.send({
        status: true,
        data: replays,
      });
    } else {
      res.send({
        status: false,
        message: "no replays",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};
