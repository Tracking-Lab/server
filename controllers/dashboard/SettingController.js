const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const axios = require("axios");
const fs = require("fs");
const path = require("path");
const process = require("process");
const { authenticate } = require("@google-cloud/local-auth");
const { google } = require("googleapis");
const email_configs = require("../../configs/emails/index");
const public_configs = require("../../configs/public/index");
const { sendTemplate } = require("../../utils/whatsapp/index");
const crypto = require("crypto");

exports.index = async (req, res) => {
  try {
    const users = await conn.users.count({ where: { is_deleted: 0 } });
    const teams = await conn.teams.count();

    const auto_assign_setting = await conn.auto_assign_setting.findOne({
      include: ["user"],
      order: [["id", "DESC"]],
    });
    if (users && teams) {
      res.send({
        status: true,
        data: {
          users: users,
          teams: teams,
          auto_assign_setting: auto_assign_setting,
        },
      });
    } else {
      res.send({
        status: false,
        message: "no counts",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.usersTypes = async (req, res) => {
  try {
    const users_types = await conn.users_types.findAll();
    if (users_types) {
      res.send({
        status: true,
        data: users_types,
      });
    } else {
      res.send({
        status: false,
        message: "no teams",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.teams = async (req, res) => {
  try {
    const teams = await conn.teams.findAll({
      include: [
        {
          model: conn.team_users,
          as: "team_users",
          include: ["user"],
        },
        {
          model: conn.team_channels,
          as: "team_channels",
          include: [
            {
              model: conn.channels,
              as: "channel",
              include: ["whatsapp_channel"],
              where: { is_deleted: 0 },
            },
          ],
        },
      ],
    });
    if (teams) {
      res.send({
        status: true,
        data: teams,
      });
    } else {
      res.send({
        status: false,
        message: "no teams",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createTeam = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.teams.create(req.body);
    if (team) {
      res.send({
        status: true,
        data: team,
      });
    } else {
      res.send({
        status: false,
        message: "team not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateTeam = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.teams.update(
      {
        name: req.body.name,
      },
      { where: { id: req.body.id } }
    );
    if (team) {
      res.send({
        status: true,
        data: team,
      });
    } else {
      res.send({
        status: false,
        message: "team not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteTeam = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.teams.destroy({
      where: { id: req.body.id },
    });
    if (team) {
      res.send({
        status: true,
        data: team,
      });
    } else {
      res.send({
        status: false,
        message: "team not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.assginUser = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.team_users.findOne({
      where: { team_id: req.body.team_id, user_id: req.body.user_id },
    });
    if (team) {
      res.send({
        status: true,
        data: team,
      });
    } else {
      const team = await conn.team_users.create(req.body);
      if (team) {
        res.send({
          status: true,
          data: team,
        });
      } else {
        res.send({
          status: false,
          message: "team not created",
        });
      }
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.unassginUser = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const team = await conn.team_users.findOne({
      where: { id: req.body.id },
    });
    if (team) {
      await conn.team_users.destroy({
        where: { id: req.body.id },
      });
      res.send({
        status: true,
        data: team,
      });
    } else {
      res.send({
        status: false,
        data: team,
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.assginChannel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.team_channels.findOne({
      where: { team_id: req.body.team_id, channel_id: req.body.channel_id },
    });
    if (team) {
      res.send({
        status: true,
        data: team,
      });
    } else {
      const team = await conn.team_channels.create(req.body);
      if (team) {
        res.send({
          status: true,
          data: team,
        });
      } else {
        res.send({
          status: false,
          message: "team not created",
        });
      }
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.unassginChannel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const team = await conn.team_channels.findOne({
      where: { id: req.body.id },
    });
    if (team) {
      const team = await conn.team_channels.destroy({
        where: { id: req.body.id },
      });
      res.send({
        status: true,
        data: team,
      });
    } else {
      res.send({
        status: false,
        message: "team not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.users = async (req, res) => {
  try {
    const users = await conn.users.findAll({ where: { is_deleted: 0 } });
    if (users) {
      res.send({
        status: true,
        data: users,
      });
    } else {
      res.send({
        status: false,
        message: "no users",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createUser = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash("123456", salt);
    req.body.password = hashedPassword;

    const user = await conn.users.create(req.body);
    if (user) {
      res.send({
        status: true,
        data: user,
      });
    } else {
      res.send({
        status: false,
        message: "user not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateUser = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const user = await conn.users.update(
      {
        name: req.body.name,
        phone: req.body.phone,
        email: req.body.email,
        user_type_id: req.body.user_type_id,
      },
      { where: { id: req.body.id } }
    );
    if (user) {
      res.send({
        status: true,
        data: user,
      });
    } else {
      res.send({
        status: false,
        message: "user not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteUser = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const user = await conn.users.update(
      {
        is_deleted: 1,
      },
      { where: { id: req.body.id } }
    );
    if (user) {
      res.send({
        status: true,
        data: user,
      });
    } else {
      res.send({
        status: false,
        message: "user not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.labels = async (req, res) => {
  try {
    const labels = await conn.labels.findAll();
    if (labels) {
      res.send({
        status: true,
        data: labels,
      });
    } else {
      res.send({
        status: false,
        message: "no labels",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createLabel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const label = await conn.labels.create(req.body);
    if (label) {
      res.send({
        status: true,
        data: label,
      });
    } else {
      res.send({
        status: false,
        message: "label not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateLabel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const label = await conn.labels.update(
      {
        name: req.body.name,
        color: req.body.color,
      },
      { where: { id: req.body.id } }
    );
    if (label) {
      res.send({
        status: true,
        data: label,
      });
    } else {
      res.send({
        status: false,
        message: "label not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteLabel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const label = await conn.labels.destroy({ where: { id: req.body.id } });
    if (label) {
      res.send({
        status: true,
        data: label,
      });
    } else {
      res.send({
        status: false,
        message: "label not created",
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

exports.createReplay = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const replay = await conn.replays.create(req.body);
    if (replay) {
      res.send({
        status: true,
        data: replay,
      });
    } else {
      res.send({
        status: false,
        message: "replay not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateReplay = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const replay = await conn.replays.update(
      {
        tag: req.body.tag,
        body: req.body.body,
      },
      { where: { id: req.body.id } }
    );
    if (replay) {
      res.send({
        status: true,
        data: replay,
      });
    } else {
      res.send({
        status: false,
        message: "replay not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteReplay = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const replay = await conn.replays.destroy({ where: { id: req.body.id } });
    if (replay) {
      res.send({
        status: true,
        data: replay,
      });
    } else {
      res.send({
        status: false,
        message: "replay not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.inboxResults = async (req, res) => {
  try {
    const results = await conn.inbox_results.findAll();
    if (results) {
      res.send({
        status: true,
        data: results,
      });
    } else {
      res.send({
        status: false,
        message: "no results",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createInboxResult = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const result = await conn.inbox_results.create(req.body);
    if (result) {
      res.send({
        status: true,
        data: result,
      });
    } else {
      res.send({
        status: false,
        message: "result not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateInboxResult = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const result = await conn.inbox_results.update(
      {
        name: req.body.name,
      },
      { where: { id: req.body.id } }
    );
    if (result) {
      res.send({
        status: true,
        data: result,
      });
    } else {
      res.send({
        status: false,
        message: "result not update",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteInboxResult = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const result = await conn.inbox_results.destroy({
      where: { id: req.body.id },
    });
    if (result) {
      res.send({
        status: true,
        data: result,
      });
    } else {
      res.send({
        status: false,
        message: "result not deleted",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.channels = async (req, res) => {
  try {
    const channels = await conn.channels.findAll({
      include: [
        {
          model: conn.whatsapp_channels,
          as: "whatsapp_channel",
        },
      ],
      where: { is_deleted: 0 },
    });
    if (channels) {
      res.send({
        status: true,
        data: channels,
      });
    } else {
      res.send({
        status: false,
        message: "no channels",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.whatsappChannels = async (req, res) => {
  try {
    const channels = await conn.channels.findAll({
      include: [
        {
          model: conn.whatsapp_channels,
          as: "whatsapp_channel",
          required: true,
        },
      ],
      where: { is_deleted: 0 },
    });
    if (channels) {
      const pricing = await conn.whatsapp_template_cost.findAll();
      var response = {
        channels: channels,
      };

      if (pricing) {
        for (let index = 0; index < pricing.length; index++) {
          const element = pricing[index];
          response[element.template_type] = element.cost;
        }
      }
      res.send({
        status: true,
        data: response,
      });
    } else {
      res.send({
        status: false,
        message: "no channels",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.whatsappUpdatePricing = async (req, res) => {
  try {
    var update = await conn.whatsapp_template_cost.update(
      {
        cost: req.body.MARKETING,
      },
      { where: { template_type: "MARKETING" } }
    );

    update = await conn.whatsapp_template_cost.update(
      {
        cost: req.body.UTILITY,
      },
      { where: { template_type: "UTILITY" } }
    );
    if (update) {
      res.send({
        status: true,
        data: update,
      });
    } else {
      res.send({
        status: false,
        message: "cost not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createChannel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const channel = await conn.channels.create({
      name: req.body.name,
      type: req.body.type,
    });
    if (channel) {
      if (req.body.type == "WB") {
        delete req.body.type;
        req.body.channel_id = channel.id;
        await conn.whatsapp_channels.create(req.body);
      }
      res.send({
        status: true,
        data: channel,
      });
    } else {
      res.send({
        status: false,
        message: "channel not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateChannel = async (req, res, next) => {
  console.log("req");

  try {
    const channel = await conn.channels.update(
      {
        name: req.body.name,
      },
      { where: { id: req.body.channel_id } }
    );
    if (channel) {
      if (req.body.type == "WB") {
        await conn.whatsapp_channels.update(
          {
            name: req.body.name,
            phone_number: req.body.phone_number,
            phone_id: req.body.phone_id,
            account_id: req.body.account_id,
            token: req.body.token,
          },
          { where: { id: req.body.id } }
        );
      }

      res.send({
        status: true,
        data: channel,
      });
    } else {
      res.send({
        status: false,
        message: "channel not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteChannel = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const channel = await conn.channels.update(
      { is_deleted: 1 },
      { where: { id: req.body.id } }
    );
    if (channel) {
      await conn.inboxes.update(
        {
          status: 2,
          assigned: 0,
          result: "Channel Deleted",
        },
        { where: { channel_id: req.body.channel_id } }
      );
      res.send({
        status: true,
        data: channel,
      });
    } else {
      res.send({
        status: false,
        message: "channel not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.addChannelReplay = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const channel = await conn.channels.update(
      {
        auto_replay: req.body.replay,
      },
      { where: { id: req.body.id } }
    );
    if (channel) {
      res.send({
        status: true,
        data: channel,
      });
    } else {
      res.send({
        status: false,
        message: "channel not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.autoAssigin = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const assigin = await conn.auto_assign_setting.create({
      user_id: req.body.id,
      time: req.body.time,
    });
    if (assigin) {
      res.send({
        status: true,
        data: assigin,
      });
    } else {
      res.send({
        status: false,
        message: "assigin not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.templates = async (req, res) => {
  try {
    const templates = await conn.templates.findAll({
      include: ["channel", "template_header", "template_buttons"],
      where: { status: { [Op.not]: "DELETED" } },
    });
    if (templates) {
      res.send({
        status: true,
        data: templates,
      });
    } else {
      res.send({
        status: false,
        message: "no templates",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createTemplate = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);

  try {
    var bodyData = req.body;

    var header = null;

    if (bodyData.has_header == "true") {
      header = bodyData.header_format;
    }

    const template = {
      name: bodyData.name,
      channel_id: bodyData.channel_id,
      category: bodyData.category,
      language: bodyData.language,
      body: bodyData.body,
      header: header,
      footer_text: bodyData.footer_text,
      body_inputs: bodyData.body_inputs_lenght,
      status: "PENDING",
    };
    const result = await conn.templates.create(template);
    if (result) {
      bodyData.body_inputs = JSON.parse(bodyData.body_inputs);
      bodyData.buttons = JSON.parse(bodyData.buttons);

      if (bodyData.has_header == "true") {
        var header_vaule = bodyData.header_text;

        if (bodyData.header_format == "TEXT") {
          header_vaule = bodyData.header_text;
        } else if (bodyData.header_format == "LOCATION") {
          header_vaule = null;
        } else {
          header_vaule = bodyData.media;
        }
        await conn.template_header.create({
          template_id: result.id,
          format: bodyData.header_format,
          value: header_vaule,
        });
      }
      if (bodyData.has_buttons == "true") {
        for (var i = 0; i < bodyData.buttons.length; i++) {
          var btn = bodyData.buttons[i];
          await conn.template_buttons.create({
            template_id: result.id,
            type: btn.type,
            name: btn.name,
            value: btn.vaule,
          });
        }
      }

      if (bodyData.send_to_facebook == "true") {
        const channel = await conn.whatsapp_channels.findOne({
          where: { id: bodyData.channel_id },
        });

        if (bodyData.has_header == "true" && bodyData.has_media == "true") {
          const session = await requestForUploadSession(
            bodyData.media,
            bodyData.media_type,
            channel
          );
          console.log(session);
          if (session != null) {
            const uploadToken = await uploadToFacebook(
              bodyData.media,
              session.id,
              channel
            );
            console.log(uploadToken);
            bodyData.media_h = uploadToken.h;
          }
        }

        const response = await sendTemplateToFacebook(bodyData, channel);
        console.log(response);

        await conn.templates.update(
          {
            template_id: response.id,
            status: response.status,
          },
          { where: { id: result.id } }
        );
      } else {
        await conn.templates.update(
          {
            status: "APPROVED",
          },
          { where: { id: result.id } }
        );
      }

      res.send({
        status: true,
        data: result,
      });
    } else {
      res.send({
        status: false,
        message: "result not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteTemplate = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const template = await conn.templates.update(
      { status: "DELETED" },
      { where: { id: req.body.id } }
    );
    if (template) {
      res.send({
        status: true,
        data: template,
      });
    } else {
      res.send({
        status: false,
        message: "template not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

async function sendTemplateToFacebook(data, channel) {
  var params = [];
  console.log(data.body_inputs.length);
  console.log(data.buttons.length);
  for (let i = 0; i < data.body_inputs.length; i++) {
    var value = data.body_inputs[i].value;
    console.log("value");
    params.push(value);
  }

  var template = {
    name: data.name,
    category: data.category,
    allow_category_change: false,
    language: data.language,
    components: [],
  };

  var body = {
    type: "BODY",
    text: data.body,
  };

  if (params.length > 0) {
    body.example = {
      body_text: [params],
    };
  }

  template.components.push(body);

  if (data.has_header == "true") {
    // {
    //   "type": "HEADER",
    //   "format": "TEXT",
    //   "text": "Our {{1}} is on!",
    //   "example": {
    //     "header_text": [
    //       "Summer Sale"
    //     ]
    //   }
    // },

    if (data.header_format == "TEXT") {
      template.components.push({
        type: "HEADER",
        format: "TEXT",
        text: data.header_text,
      });
    } else if (data.header_format == "LOCATION") {
      template.components.push({
        type: "HEADER",
        format: "LOCATION",
      });
    } else {
      template.components.push({
        type: "HEADER",
        format: data.header_format,
        example: {
          header_handle: [data.media_h],
        },
      });
    }
  }

  if (data.has_footer == "true") {
    template.components.push({
      type: "FOOTER",
      text: data.footer_text,
    });
  }

  if (data.has_buttons == "true") {
    // {
    //   type: "URL",
    //   text: "Contact Support",
    //   url: "https://www.luckyshrub.com/support",
    // },

    // {
    //   "type": "PHONE_NUMBER",
    //   "text": "Call",
    //   "phone_number": "15550051310"
    // },

    // {
    //   "type": "QUICK_REPLY",
    //   "text": "Unsubscribe from Promos"
    // },

    var buttons = [];
    for (var i = 0; i < data.buttons.length; i++) {
      var btn = data.buttons[i];
      console.log("btn.type");
      if (btn.type == "QUICK_REPLY") {
        buttons.push({
          type: "QUICK_REPLY",
          text: btn.name,
        });
      } else if (btn.type == "URL") {
        buttons.push({
          type: "URL",
          text: btn.name,
          url: btn.value,
        });
      } else if (btn.type == "PHONE_NUMBER") {
        buttons.push({
          type: "PHONE_NUMBER",
          text: btn.name,
          phone_number: btn.value,
        });
      }
    }

    template.components.push({
      type: "BUTTONS",
      buttons: buttons,
    });
  }

  return await sendTemplate(channel.account_id, channel.token, template);
}

async function requestForUploadSession(media_file, type, channel) {
  try {
    const APP_ID = channel.app_id;
    const USER_ACCESS_TOKEN = channel.token;
    const filePath = media_file;
    // path.join(
    //   __dirname,
    //   "templates",
    //   media_file.split("/").pop()
    // ); // Path to file in assets
    const FILE_TYPE = type; // e.g., 'image/jpeg', 'video/mp4'

    // Get file name and file size
    const FILE_NAME = path.basename(filePath); // Extracts the file name from the path
    const fileStats = fs.statSync(filePath); // Gets file stats, including file size
    const FILE_LENGTH = fileStats.size; // File size in bytes

    // Create the URL with query parameters
    const url = `https://graph.facebook.com/v20.0/${APP_ID}/uploads?file_name=${encodeURIComponent(
      FILE_NAME
    )}&file_length=${FILE_LENGTH}&file_type=${encodeURIComponent(
      FILE_TYPE
    )}&access_token=${USER_ACCESS_TOKEN}`;

    // Send POST request using axios
    const result = await axios.post(url);
    return result.data;
  } catch (error) {
    console.error("Error message:", error);
    return null;
  }
}

async function uploadToFacebook(media_file, session_id, channel) {
  const UPLOAD_SESSION_ID = session_id;
  const USER_ACCESS_TOKEN = channel.token;
  const FILE_NAME = media_file; // Path to your file
  const fileOffset = 0;
  // Create a readable stream for the file
  // console.log(fileStream.path);
  // Create the request
  if (!fs.existsSync(FILE_NAME)) {
    console.error("File does not exist:", FILE_NAME);
    process.exit(1);
  }
  const fileSize = fs.statSync(FILE_NAME).size;
  // Create a readable stream for the file
  const fileStream = fs.createReadStream(FILE_NAME);

  // Construct the URL
  const url = `https://graph.facebook.com/v20.0/${UPLOAD_SESSION_ID}`;

  // Make the POST request
  return await axios
    .post(url, fileStream, {
      headers: {
        Authorization: `OAuth ${USER_ACCESS_TOKEN}`,
        file_offset: fileOffset,
        "Content-Type": "application/octet-stream",
        "Content-Length": fileSize,
      },
    })
    .then((response) => {
      console.log("File uploaded successfully:", response.data);
      return response.data;
    })
    .catch((error) => {
      // Enhanced error logging
      if (error.response) {
        console.error("Error response data:", error.response.data);
        console.error("Error response status:", error.response.status);
        console.error("Error response headers:", error.response.headers);
      } else if (error.request) {
        console.error("No response received:", error.request);
      } else {
        console.error("Error during request setup:", error.message);
      }

      return null;
    });
}

exports.groups = async (req, res) => {
  try {
    const groups = await conn.groups.findAll();
    if (groups) {
      res.send({
        status: true,
        data: groups,
      });
    } else {
      res.send({
        status: false,
        message: "no groups",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.groupsContacts = async (req, res) => {
  try {
    const groups = await conn.groups.findAll({ include: ["contacts"] });
    if (groups) {
      res.send({
        status: true,
        data: groups,
      });
    } else {
      res.send({
        status: false,
        message: "no groups",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.createGroup = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const group = await conn.groups.create(req.body);
    if (group) {
      res.send({
        status: true,
        data: group,
      });
    } else {
      res.send({
        status: false,
        message: "group not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.updateGroup = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const group = await conn.groups.update(
      {
        name: req.body.name,
      },
      { where: { id: req.body.id } }
    );
    if (group) {
      res.send({
        status: true,
        data: group,
      });
    } else {
      res.send({
        status: false,
        message: "group not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteGroup = async (req, res, next) => {
  try {
    console.log("req.body");
    console.log(req.body);
    const group = await conn.groups.destroy({ where: { id: req.body.id } });
    if (group) {
      res.send({
        status: true,
        data: group,
      });
    } else {
      res.send({
        status: false,
        message: "group not deleted",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.templateConsts = async (req, res) => {
  try {
    const consts = await conn.whatsapp_template_cost.findAll();
    if (consts) {
      res.send({
        status: true,
        data: consts,
      });
    } else {
      res.send({
        status: false,
        message: "no consts",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.connectEmail = async (req, res, next) => {
  const state = crypto.randomBytes(20).toString("hex"); // Optional: use for CSRF protection
  const authUrl = oauth2Client.generateAuthUrl({
    access_type: "offline", // Request a refresh token
    scope: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile",
      "https://www.googleapis.com/auth/gmail.readonly",
      "https://www.googleapis.com/auth/gmail.modify",
      "https://mail.google.com/",
    ], // Scopes to request
    state: state,
    prompt: "consent", // Force Google to show the consent screen again
  });

  // Optionally save state to session
  req.session.state = state;
  console.log(authUrl);
  res.redirect(authUrl);
};

// Create an OAuth2 client
const oauth2Client = new google.auth.OAuth2(
  email_configs.email.CLIENT_ID,
  email_configs.email.CLIENT_SECRET,
  email_configs.email.REDIRECT_URL
);

exports.emailAuth = async (req, res, next) => {
  const code = req.query.code; // Authorization code from Google
  const { state } = req.query; // Optional: verify the state for CSRF protection

  try {
    const { tokens } = await oauth2Client.getToken(code); // Exchange code for tokens
    oauth2Client.setCredentials(tokens); // Set tokens on OAuth2 client

    // Store tokens in database (e.g., accessToken, refreshToken)
    const accessToken = tokens.access_token;
    const refreshToken = tokens.refresh_token;
    const expiryDate = tokens.expiry_date;

    // Save the refresh token securely (e.g., in the database for long-term use)
    // You might also generate a session or JWT token for the frontend here
    req.session.user = { accessToken, refreshToken }; // Example with sessions

    console.log({ accessToken, refreshToken });

    const oauth2 = google.oauth2({
      auth: oauth2Client,
      version: "v2",
    });

    // Fetch the user profile
    oauth2.userinfo.get(async (err, res) => {
      if (err) {
        console.error("Error fetching user info:", err);
        return;
      }
      console.log("User info:", res.data);
      // Access the email and name
      const email = res.data.email;
      const name = res.data.name;
      const picture = res.data.picture;
      const id = res.data.id;

      console.log(
        `Email: ${email}, Name: ${name}, accessToken: ${accessToken}, refreshToken: ${refreshToken}, expiryDate: ${expiryDate}`
      );
      await saveEmailChannel({
        token: accessToken,
        refresh_token: refreshToken,
        email: email,
        email_id: id,
        name: name,
        expires_at: expiryDate,
        picture: picture,
      });
    });
    // Redirect back to the frontend
    res.redirect(public_configs.config.dashboard + "settings/emails_channels"); // Redirect to Vue.js app dashboard
  } catch (error) {
    console.error("Error retrieving tokens:", error);
    res.status(500).send("Authentication failed");
  }
};

async function getProfile() {
  const email = req.query.email; // Assuming you get the user's email from the query or session
  const user = await User.findOne({ email });

  let accessToken = user.token; // Your stored access token
  const refreshToken = user.refreshToken; // Your stored refresh token

  // Check if the access token is expired and refresh it if necessary
  if (isAccessTokenExpired(accessToken)) {
    accessToken = await refreshAccessToken(refreshToken);
    // Update the access token in the database
    user.token = accessToken;
    await user.save();
  }

  // Now you can use the accessToken to make API calls
  const oauth2Client = new google.auth.OAuth2();
  oauth2Client.setCredentials({ access_token: accessToken });

  const gmail = google.gmail({ version: "v1", auth: oauth2Client });

  // Example API call
  try {
    const result = await gmail.users.getProfile({ userId: "me" });
    res.json(result.data);
  } catch (error) {
    console.error("Error fetching user profile:", error);
    res.status(500).json({ error: "Failed to fetch user profile" });
  }
}

async function refreshAccessToken(refreshToken) {
  const oauth2Client = new google.auth.OAuth2(
    email_configs.email.CLIENT_ID,
    email_configs.email.CLIENT_SECRET,
    email_configs.email.REDIRECT_URL
  );
  // Set the refresh token
  oauth2Client.setCredentials({
    refresh_token: refreshToken,
  });

  // Get new access token
  const { credentials } = await oauth2Client.refreshAccessToken();
  return credentials.access_token;
}

function isAccessTokenExpired(token) {
  // Implement your logic to check if the token is expired
  return false; // Placeholder: Update this logic based on your needs
}

async function saveEmailChannel(data) {
  // console.log(req.body);
  const { token, refresh_token, email, email_id, name, expires_at, picture } =
    data; // Make sure to send refreshToken from the client

  try {
    const existingUser = await conn.email_channels.findOne({
      where: { email: email },
    });

    if (existingUser) {
      // Update existing user
      existingUser.token = token;
      existingUser.refresh_token = refresh_token; // Save refresh token
      await existingUser.save();

      // res.send({
      //   status: true,
      //   data: existingUser,
      // });
    } else {
      // Create a new user
      const channel = await conn.channels.create({ name: name, type: "EM" });

      const newChannel = await conn.email_channels.create({
        channel_id: channel.id,
        email_id: email_id,
        name: name,
        email: email,
        token: token,
        refresh_token: refresh_token,
        expiry_date: expires_at,
        image: picture,
      });

      // res.send({
      //   status: true,
      //   data: newChannel,
      // });
    }

    watchEmailNotifications();
  } catch (error) {
    console.error("Error saving token:", error);
    // res.status(500).json({ error: "Failed to save token" });
  }
}

async function watchEmailNotifications() {
  const gmail = google.gmail({ version: "v1", auth: oauth2Client });

  try {
    // Use the 'watch' method to start receiving notifications
    const res = await gmail.users.watch({
      userId: "me",
      requestBody: {
        topicName: "projects/support-system-433206/topics/new_inbox", // Pub/Sub topic name
        labelIds: ["INBOX"], // Watch for changes in INBOX
        labelFilterAction: "include", // Optionally filter by labels
      },
    });

    console.log("Push notifications enabled:", res.data);
  } catch (error) {
    console.error("Error enabling push notifications:", error);
  }
}

exports.emailsChannels = async (req, res) => {
  try {
    const channels = await conn.channels.findAll({
      include: [
        {
          model: conn.email_channels,
          as: "email_channel",
          required: true,
        },
      ],
      where: { is_deleted: 0 },
    });

    if (channels) {
      res.send({
        status: true,
        data: channels,
      });
    } else {
      res.send({
        status: false,
        message: "no channels",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.deleteEmailChannel = async (req, res) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const channel = await conn.channels.update(
      { is_deleted: 1 },
      { where: { id: req.body.channel_id } }
    );
    if (channel) {
      await conn.inboxes.update(
        {
          status: 2,
          assigned: 0,
          result: "Channel Deleted",
        },
        { where: { channel_id: req.body.channel_id } }
      );

      const token = await refreshAccessToken(req.body.refresh_token); // Replace with the stored access token
      fetch(`https://oauth2.googleapis.com/revoke?token=${token}`, {
        method: "POST",
        headers: {
          "Content-type": "application/x-www-form-urlencoded",
        },
      })
        .then((response) => {
          if (response.ok) {
            console.log("Token revoked successfully.");
            // Clear any local user session data or token from storage
          } else {
            console.error("Failed to revoke token.");
          }
        })
        .catch((error) => console.error("Error revoking token:", error));

      res.send({
        status: true,
        data: channel,
      });
    } else {
      res.send({
        status: false,
        message: "channel not updated",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};
