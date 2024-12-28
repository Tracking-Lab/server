const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const inboxes = require("../../models/inboxes");
const { sendMessage } = require("../../utils/whatsapp/index");
const { google } = require("googleapis");
const email_configs = require("../../configs/emails/index");
const public_configs = require("../../configs/public/index");
const { sendNotification } = require("../../utils/firebase/main/index");

async function scheduledTask() {
  try {
    const setting = await conn.auto_assign_setting.findOne({
      include: ["user"],
      order: [["id", "DESC"]],
    });

    if (setting) {
      var timestamp = Date.now();
      var settingTime = 60 * 1000 * 60 * setting.time;
      // var settingTime = 1000;
      var testTime = timestamp - settingTime;

      //   SELECT * FROM `inboxes` WHERE `updated` < Time("1726127587012") AND assigned = 1 AND status = 1;

      const [inboxes, metadata] = await sequelize.query(
        "SELECT * FROM `inboxes` WHERE `updated` < Time(" +
          testTime +
          ") AND assigned = 1 AND status = 1;"
      );

      if (inboxes.length > 0) {
        for (let i = 0; i < inboxes.length; i++) {
          console.log(inboxes[i].created);
          var messages = await conn.messages.findAll({
            where: { inbox_id: inboxes[i].id },
            order: [["id", "DESC"]],
            limit: 10,
          });
          //   message.message_id.includes("wamid.")
          if (messages) {
            console.log(
              messages.find((message) => message.message_id === "locat_id")
            );
            if (
              !messages.find((message) => message.message_id === "locat_id")
            ) {
              await conn.inbox_assigned_user.update(
                { user_id: setting.user_id, status: 0 },
                { where: { inbox_id: inboxes[i].id } }
              );

              await conn.inboxes.update(
                {
                  assigned: 1,
                  status: 1,
                  updated: Date.now(),
                },
                { where: { id: inboxes[i].id } }
              );

              var messageContent =
                "تم التعيين لـ " + setting.user.name + " تلقائياً من النظام";
              var timestamp = Date.now();
              var messageCC = {
                from_phone: setting.user.phone,
                inbox_id: inboxes[i].id,
                message_id: "inset_id",
                timestamp: timestamp,
                message: messageContent,
                media_link: null,
                viewed: 1,
                type: "inset_id",
                user_id: setting.user_id,
              };

              await conn.messages.create(messageCC);

              const session = await conn.sessions.findOne({
                where: { user_id: setting.user_id },
              });
              if (session) {
                await conn.user_notifications.create({
                  user_id: setting.user_id,
                  inbox_id: inboxes[i].id,
                  title: "لديك محادثة جديدة",
                  body: "تم تعيين المحادثة لك تلقائياً من النظام",
                  title_en: "New conversation",
                  body_en: "Conversation assigned to you",
                });
                global.io.to(session?.socket_id).emit("newInbox", {
                  title: "لديك محادثة جديدة",
                  body: "تم تعيين المحادثة لك تلقائياً من النظام",
                });

                if (session?.token) {
                  const notificationsCount =
                    await conn.user_notifications.count({
                      where: { user_id: setting.id, viewed: 0 },
                    });

                  var language = session?.language ?? "ar";
                  sendNotification(
                    session?.token,
                    {
                      title:
                        language == "en"
                          ? "New conversation"
                          : "لديك محادثة جديدة",
                      body:
                        language == "en"
                          ? "Conversation assigned to you by system"
                          : "تم تعيين المحادثة لك تلقائياً من النظام",
                    },
                    notificationsCount
                  );
                }
              }
            }
          }
        }
      }
    }

    var timestamp = Date.now();
    const [broadcasts, metadata] = await sequelize.query(
      "SELECT * FROM `whatsapp_broadcasts` WHERE `send_time` < FROM_UNIXTIME(" +
        timestamp +
        " / 1000) AND status = 'PENDING';"
    );

    if (broadcasts.length > 0) {
      for (let i = 0; i < broadcasts.length; i++) {
        var contacts = await conn.whatsapp_broadcasts_contacts.findAll({
          where: { whatsapp_broadcast_id: broadcasts[i].id },
        });

        const template = await conn.templates.findOne({
          include: ["channel", "template_header", "template_buttons"],
          where: {
            status: { [Op.not]: "DELETED" },
            id: broadcasts[i].template_id,
          },
        });
        for (let j = 0; j < contacts.length; j++) {
          await sendWhatsappMessage(
            "template",
            { template: template },
            template.channel,
            contacts[j]
          );
        }

        await conn.whatsapp_broadcasts.update(
          { status: "SENT" },
          { where: { id: broadcasts[i].id } }
        );
      }
    }
  } catch (error) {
    console.error("Error :", error);
  }

  //   console.log("Task is running at", new Date().toLocaleTimeString());
}

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
  } else {
    console.log(message_type);
    console.log(body);
    console.log(channel);
    console.log(phone);
  }
}

var timer = 60 * 1000 * 10;
// Keep the process running
console.log("Scheduler started, running every 5 seconds...");
// Schedule the function to run every 5 seconds (5000 milliseconds)
setInterval(() => {
  scheduledTask().catch((err) => console.log(err));
}, timer);

var emailTimer = 60 * 1000 * 60 * 48;
// Keep the process running
console.log("Scheduler started, running every 48 Hauer...");
// Schedule the function to running every 48 Hauer (5000 milliseconds)
setInterval(() => {
  watchEmailNotifications().catch((err) => console.log(err));
}, emailTimer);

async function watchEmailNotifications() {
  const oauth2Client = new google.auth.OAuth2(
    email_configs.email.CLIENT_ID,
    email_configs.email.CLIENT_SECRET,
    email_configs.email.REDIRECT_URL
  );
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
