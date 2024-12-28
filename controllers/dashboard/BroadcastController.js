const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes } = require("sequelize");
const jwt = require("jsonwebtoken");
const { sendMessage } = require("../../utils/whatsapp/index");

exports.broadcasts = async (req, res) => {
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
      const broadcasts = await conn.whatsapp_broadcasts.findAll({
        include: ["whatsapp_channel", "template"],
        order: [["id", "DESC"]],
      });
      if (broadcasts) {
        res.send({
          status: true,
          data: broadcasts,
        });
      } else {
        res.send({
          status: false,
          message: "no broadcasts",
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

exports.createBroadcast = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
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
      var channel = req.body.channel.whatsapp_channel;

      var body = {
        user_id: userId,
        name: req.body.name,
        whatsapp_channel_id: channel.id,
        template_id: req.body.template.id,
        send_time: req.body.send_time,
        cost: req.body.cost,
        contacts_count: req.body.contacts.length,
        status: "PENDING",
      };
      const broadcast = await conn.whatsapp_broadcasts.create(body);
      if (broadcast) {
        for (var i = 0; i < req.body.contacts.length; i++) {
          var phone = req.body.contacts[i];
          await conn.whatsapp_broadcasts_contacts.create({
            whatsapp_broadcast_id: broadcast.id,
            contact_phone: phone,
          });
          if (req.body.send_action == "now") {
            await sendWhatsappMessage("template", req.body, channel, phone);
          }
        }

        if (req.body.send_action == "now") {
          await conn.whatsapp_broadcasts.update(
            { status: "SENT" },
            { where: { id: broadcast.id } }
          );
        }

        res.send({
          status: true,
          data: broadcast,
        });
      } else {
        res.send({
          status: false,
          message: "broadcast not created",
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

async function sendWhatsappMessage(message_type, body, channel, phone) {
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
      phone,
      "template",
      {
        template: template,
      }
    );
  }
}
