const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes } = require("sequelize");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

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
      var ids = [];
      if (teams) {
        ids = teams.map((x) => x.id);
        console.log(ids);
      }

      // const contacts = await sequelize.query(`SELECT c.* FROM contacts c
      //   INNER JOIN inboxes i ON (i.contact_id = c.id)
      //   LEFT OUTER JOIN inbox_assigned_user ia ON (i.id = ia.inbox_id)
      //   WHERE ia.user_id = ${userId} GROUP BY c.id;`);
      const contactsList = await conn.contacts.findAll({
        include: ["inboxes"],
      });
      if (contactsList) {
        // var contactsList = contacts[0];
        for (let i = 0; i < contactsList.length; i++) {
          var id = contactsList[i].id;
          const channels = await conn.channels.findAll({
            include: [
              {
                model: conn.whatsapp_channels,
                as: "whatsapp_channel",
              },
              {
                model: conn.inboxes,
                as: "inboxes",
                where: { contact_id: id },
              },
              {
                model: conn.team_channels,
                as: "team_channels",
                where: { team_id: { [Op.in]: ids } },
              },
            ],
          });
          if (channels) {
            contactsList[i].setDataValue("channels", channels);
          }
          const labels = await conn.inbox_labels.findAll({
            include: [
              {
                model: conn.labels,
                as: "label",
              },
              {
                model: conn.inboxes,
                as: "inbox",
                where: { contact_id: id },
              },
            ],
          });
          if (labels) {
            contactsList[i].setDataValue("labels", labels);
          }
        }

        res.send({
          status: true,
          data: contactsList,
        });
      } else {
        res.send({
          status: false,
          message: "no contacts",
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

exports.createContact = async (req, res, next) => {
  console.log("req.body");
  console.log(req.body);
  try {
    const contact = await conn.contacts.create(req.body);
    if (contact) {
      res.send({
        status: true,
        data: contact,
      });
    } else {
      res.send({
        status: false,
        message: "contact not created",
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "server error" });
  }
};

exports.getImports = async (req, res, next) => {
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
    try {
      const importsList = await conn.contacts_imports.findAll();
      if (importsList) {
        res.send({
          status: true,
          data: importsList,
        });
      } else {
        res.send({
          status: false,
          message: "no imports",
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

exports.importContacts = async (req, res, next) => {
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
      var newImport = {
        user_id: userId,
        contacts_count: req.body.contacts.length,
        status: "SUCCESS",
      };
      const contacts_import = await conn.contacts_imports.create(newImport);
      if (contacts_import) {
        for (let i = 0; i < req.body.contacts.length; i++) {
          const contact = req.body.contacts[i];
          await conn.contacts.create({
            name: contact.name,
            phone: contact.phone,
            group_id: req.body.group_id,
            contact_import_id: contacts_import.id,
          });
        }

        res.send({
          status: true,
          data: contacts_import,
        });
      } else {
        res.send({
          status: false,
          message: "contact not created",
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

exports.deleteImport = async (req, res, next) => {
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
      const contacts_imports = await conn.contacts_imports.destroy({
        where: { id: req.body.id },
      });
      if (contacts_imports) {
        res.send({
          status: true,
          data: contacts_imports,
        });
      } else {
        res.send({
          status: false,
          message: "import not deleted",
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
