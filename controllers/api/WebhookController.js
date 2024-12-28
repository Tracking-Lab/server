const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const { sendMessage } = require("../../utils/whatsapp/index");
const fs = require("node:fs");
const axios = require("../../utils/axios/index");
const util = require("util");
const stream = require("stream");
const { sendNotification } = require("../../utils/firebase/main/index");
// const ffmpeg = require("fluent-ffmpeg");
// const ffmpegPath = require("@ffmpeg-installer/ffmpeg").path;

exports.index = async (req, res) => {
  for (const [p, val] of Object.entries(req.query)) {
    if (`${p}` == "hub.challenge") {
      res.send(val);
    }
  }

  const content = JSON.stringify(req.query);

  fs.appendFile("./public/whatsapp.txt", content, (err) => {
    if (err) {
      console.error(err);
    } else {
    }
  });
};

exports.webhook = async (req, res) => {
  try {
    var body = req.body;

    const content = JSON.stringify(body);

    fs.writeFile("./public/whatsapp.txt", content, (err) => {
      if (err) {
        console.error(err);
      } else {
      }
    });

    if (body.object == "whatsapp_business_account") {
      for (let index = 0; index < body.entry.length; index++) {
        const item = body.entry[index];
        var account_id = item.id;
        for (let j = 0; j < item.changes.length; j++) {
          const change = item.changes[j];
          if (change.field == "messages") {
            var value = change.value;
            if (value.messaging_product == "whatsapp") {
              var phone_number_id = value.metadata.phone_number_id;
              const channel = await conn.channels.findOne({
                include: [
                  {
                    model: conn.whatsapp_channels,
                    as: "whatsapp_channel",
                    required: true,
                    where: {
                      phone_id: phone_number_id,
                      account_id: account_id,
                    },
                  },
                ],
              });

              if (channel) {
                for (let cIndex = 0; cIndex < value.contacts.length; cIndex++) {
                  const contactVal = value.contacts[cIndex];

                  const contact = await conn.contacts.findOne({
                    where: {
                      phone: contactVal.wa_id,
                    },
                  });

                  if (contact) {
                    return handelSaveMessage(
                      channel.whatsapp_channel,
                      contact,
                      value.messages,
                      channel.auto_replay,
                      res
                    );
                  } else {
                    const contact = await conn.contacts.create({
                      phone: contactVal.wa_id,
                      name: contactVal.profile.name,
                    });

                    return handelSaveMessage(
                      channel.whatsapp_channel,
                      contact,
                      value.messages,
                      channel.auto_replay,
                      res
                    );
                  }
                }
              } else {
                return res
                  .status(200)
                  .json({ status: false, message: "noChannel" });
              }
            }
          } else if (change.field == "message_template_status_update") {
            var value = change.value;
            await conn.templates.update(
              {
                status: value.event,
                status_note: value.reason,
              },
              { where: { template_id: value.message_template_id } }
            );

            return res.status(200).json({ status: true, message: null });
          }
        }
      }
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "one" });
  }
};

async function handelSaveMessage(channel, contact, messages, auto_replay, res) {
  try {
    for (let index = 0; index < messages.length; index++) {
      const message = messages[index];

      if (message.from == contact.phone) {
        const inbox = await conn.inboxes.findOne({
          where: {
            contact_id: contact.id,
            channel_id: channel.channel_id,
          },
        });

        if (inbox) {
          var msgC = "";
          if (message.type == "text") {
            msgC = message.text.body;
          } else if (message.type == "button") {
            msgC = message.button.payload;
          } else {
            msgC = message.type;
          }
          var creater = contact.name ?? contact.phone;

          if (inbox.status == 1 && inbox.spam == 0) {
            var assiginUser = await conn.inbox_assigned_user.findOne({
              where: { inbox_id: inbox.id, status: 0 },
            });
            if (assiginUser) {
              var user = null;
              user = await conn.users.findOne({
                where: { id: assiginUser?.user_id, is_deleted: 0 },
              });
              if (user) {
                await conn.user_notifications.create({
                  user_id: user.id,
                  inbox_id: inbox.id,
                  title: "رسالة جديدة من " + creater,
                  body: creater + " - " + msgC,
                  title_en: "New message from " + creater,
                  body_en: msgC,
                });
                const session = await conn.sessions.findOne({
                  where: { user_id: user.id },
                });
                global.io.to(session?.socket_id).emit("newInbox", {
                  title: "رسالة جديدة من " + creater,
                  body: msgC,
                });

                if (session?.token) {
                  const notificationsCount =
                    await conn.user_notifications.count({
                      where: { user_id: user.id, viewed: 0 },
                    });

                  var language = session?.language ?? "ar";
                  sendNotification(
                    session?.token,
                    {
                      title:
                        language == "en"
                          ? "New message from " + creater
                          : "رسالة جديدة من " + creater,
                      body: msgC,
                    },
                    notificationsCount
                  );
                }
              }
            }
          } else {
            if (inbox.status == 2 && inbox.spam == 0) {
              await conn.inboxes.update(
                { status: 0, assigin: 0 },
                {
                  where: {
                    id: inbox.id,
                  },
                }
              );
              var messageNote =
                "تم إعادة الفتح بواسطة " + contact.name ?? contact.phone;
              var timestamp = Date.now();
              var messageN = {
                from_phone: contact.phone,
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

            var users = null;

            if (inbox.spam == 0) {
              users = await conn.users.findAll({ where: { is_deleted: 0 } });
              if (users) {
                for (let i = 0; i < users.length; i++) {
                  const user = users[i];
                  await conn.user_notifications.create({
                    user_id: user.id,
                    inbox_id: inbox.id,
                    title: "رسالة جديدة من " + creater,
                    body: msgC,
                    title_en: "New message from " + creater,
                    body_en: msgC,
                  });
                  const session = await conn.sessions.findOne({
                    where: { user_id: user.id },
                  });

                  if (session?.token) {
                    const notificationsCount =
                      await conn.user_notifications.count({
                        where: { user_id: user.id, viewed: 0 },
                      });
                    var language = session?.language ?? "ar";
                    sendNotification(
                      session?.token,
                      {
                        title:
                          language == "en"
                            ? "New message from " + creater
                            : "رسالة جديدة من " + creater,
                        body: msgC,
                      },
                      notificationsCount
                    );
                  }
                }
              }

              global.io.emit("newInbox", {
                title: "رسالة جديدة من " + creater,
                body: msgC,
              });
            }
          }

          const { messageContent, media_link } = await handelMessageType(
            message,
            channel
          );

          var timestamp = Date.now();
          const newMessage = await conn.messages.create({
            from_phone: contact.phone,
            inbox_id: inbox.id,
            message_id: message.id,
            timestamp: timestamp,
            message: messageContent,
            media_link: media_link,
            type: message.type,
          });
          if (newMessage) {
            if (message.type == "button") {
              await conn.messages_button.create({
                message_id: newMessage.id,
                payload: message.button.payload,
                text: message.button.text,
              });
            }
          }

          await conn.inboxes.update(
            { updated: Date.now() },
            { where: { id: inbox.id } }
          );

          return res.status(200).json({ status: true, message: newMessage });
        } else {
          const inbox = await conn.inboxes.create({
            contact_id: contact.id,
            channel_id: channel.channel_id,
          });

          var messageNote =
            "تم إنشاء التذكرة بواسطة " + contact.name ?? contact.phone;
          var timestamp = Date.now();
          var messageN = {
            from_phone: contact.phone,
            inbox_id: inbox.id,
            message_id: "inset_id",
            timestamp: timestamp,
            message: messageNote,
            media_link: null,
            viewed: 1,
            type: "inset_id",
          };

          await conn.messages.create(messageN);
          var users = null;
          // if (user.user_type.name == "ADMIN") {
          var msgC = "";
          if (message.type == "text") {
            msgC = message.text.body;
          } else if (message.type == "button") {
            msgC = message.button.payload;
          } else {
            msgC = message.type;
          }
          users = await conn.users.findAll({ where: { is_deleted: 0 } });
          var creater = contact.name ?? contact.phone;
          if (users) {
            for (let i = 0; i < users.length; i++) {
              const user = users[i];
              await conn.user_notifications.create({
                user_id: user.id,
                inbox_id: inbox.id,
                title: "رسالة جديدة من " + creater,
                body: msgC,
                title_en: "New message from" + creater,
                body_en: msgC,
              });

              const session = await conn.sessions.findOne({
                where: { user_id: user.id },
              });

              if (session?.token) {
                const notificationsCount = await conn.user_notifications.count({
                  where: { user_id: user.id, viewed: 0 },
                });
                var language = session?.language ?? "ar";
                sendNotification(
                  session?.token,
                  {
                    title:
                      language == "en"
                        ? "New message from" + creater
                        : "رسالة جديدة من " + creater,
                    body: msgC,
                  },
                  notificationsCount
                );
              }
            }
          }
          global.io.emit("newInbox", {
            title: "رسالة جديدة من " + creater,
            body: msgC,
          });

          const { messageContent, media_link } = await handelMessageType(
            message,
            channel
          );

          console.log(messageContent);

          var timestamp = Date.now();
          const newMessage = await conn.messages.create({
            from_phone: contact.phone,
            inbox_id: inbox.id,
            message_id: message.id,
            timestamp: timestamp,
            message: messageContent,
            media_link: media_link,
            type: message.type,
          });

          // const template = await conn.templates.findOne({
          //   where: { channel_id: channel.id, is_default: 1 },
          // });

          if (newMessage) {
            if (message.type == "button") {
              await conn.messages_button.create({
                message_id: newMessage.id,
                payload: message.button.payload,
                text: message.button.text,
              });
            }

            var messageType = "text";
            var replayMessage = auto_replay;
            var timestamp = Date.now();
            var messageText = {
              from_phone: channel.phone_number,
              inbox_id: inbox.id,
              message_id: "local_id",
              timestamp: timestamp,
              message: replayMessage,
              media_link: null,
              viewed: 1,
              type: messageType,
            };

            // const result = await conn.messages.create(messageTemplate);
            if (messageText) {
              await conn.inboxes.update(
                { updated: Date.now() },
                { where: { id: inbox.id } }
              );
              // if (messageType == "template") {
              //   await conn.messages_template.create({
              //     message_id: result.id,
              //     template_id: template.id,
              //   });
              // }
              await sendWhatsappMessage(
                messageType,
                { message: replayMessage },
                channel,
                contact.phone
              );
            }
          }

          return res.status(200).json({ status: true, message: newMessage });
        }
      }
    }
  } catch (e) {
    console.log(e);
    return res.status(500).json({ status: false, message: "elasssst" });
  }
}

async function handelMessageType(message, channel) {
  var messageContent = null;
  var media_link = null;

  if (message.type == "text") {
    messageContent = message.text.body;
  } else if (message.type == "button") {
    messageContent = message.button.payload;
  } else if (message.type == "image") {
    messageContent = message.image.caption ?? "";
    let result = await axios.get(
      `https://graph.facebook.com/v20.0/${message.image.id}`,
      channel.token
    );
    if (result.id == message.image.id) {
      var imgEx = message.image.mime_type.split("/").pop();
      var imgName = message.image.id + "." + imgEx;
      media_link = "public/messages/" + imgName;
      await axios
        .download(result.url, channel.token)
        .then(async function (response) {
          fs.writeFile("./public/messages/" + imgName, response, (err) => {
            if (err) {
              console.log("Ima " + err);
            } else {
              console.log("Image downloaded successfully!");
            }
          });
        });
    }
  } else if (message.type == "sticker") {
    messageContent = message.sticker.caption ?? "";
    let result = await axios.get(
      `https://graph.facebook.com/v20.0/${message.sticker.id}`,
      channel.token
    );
    if (result.id == message.sticker.id) {
      var imgEx = message.sticker.mime_type.split("/").pop();
      var imgName = message.sticker.id + "." + imgEx;
      media_link = "public/messages/" + imgName;
      await axios
        .download(result.url, channel.token)
        .then(async function (response) {
          fs.writeFile("./public/messages/" + imgName, response, (err) => {
            if (err) {
              console.log("Ima " + err);
            } else {
              console.log("Image downloaded successfully!");
            }
          });
        });
    }
  } else if (message.type == "audio") {
    messageContent = message.audio.caption ?? "";
    let result = await axios.get(
      `https://graph.facebook.com/v20.0/${message.audio.id}`,
      channel.token
    );
    if (result.id == message.audio.id) {
      var audEx = result.mime_type.split("/").pop();
      var audName = message.audio.id + "." + audEx;
      media_link = "public/messages/" + audName;
      const audioData = await downloadFile(result.url, channel.token);
      await fs.promises.writeFile(`./public/messages/${audName}`, audioData);

      // if (audEx === "ogg") {
      //   const mp3AudName = `${message.audio.id}.mp3`;
      //   const mp3Path = `public/messages/${mp3AudName}`;
      //   await convertToMp3(media_link, mp3Path);
      //   media_link = mp3Path; // Update the media link after conversion
      // }
    }
  } else if (message.type == "video") {
    messageContent = message.video.caption ?? "";
    let result = await axios.get(
      `https://graph.facebook.com/v20.0/${message.video.id}`,
      channel.token
    );
    if (result.id == message.video.id) {
      var vidEx = message.video.mime_type.split("/").pop();
      var vidName = message.video.id + "." + vidEx;
      media_link = "public/messages/" + vidName;
      await axios
        .download(result.url, channel.token)
        .then(async function (response) {
          fs.writeFile("./public/messages/" + vidName, response, (err) => {
            if (err) {
              console.log("Ima " + err);
            } else {
              console.log("Image downloaded successfully!");
            }
          });
        });
    }
  } else if (message.type == "document") {
    messageContent = message.document.caption ?? "";
    let result = await axios.get(
      `https://graph.facebook.com/v20.0/${message.document.id}`,
      channel.token
    );
    if (result.id == message.document.id) {
      var docEx = message.document.mime_type.split("/").pop();
      var docName = message.document.id + "." + docEx;
      media_link = "public/messages/" + docName;
      await axios
        .download(result.url, channel.token)
        .then(async function (response) {
          fs.writeFile("./public/messages/" + docName, response, (err) => {
            if (err) {
              console.log("Ima " + err);
            } else {
              console.log("Image downloaded successfully!");
            }
          });
        });
    }
  } else if (message.type == "contacts") {
    messageContent = "";
    for (var contactIndex in message.contacts) {
      messageContent += `${message.contacts[contactIndex].name.formatted_name} - ${message.contacts[contactIndex].phones[0].phone} \n`;
    }
  } else if (message.type == "location") {
    messageContent =
      message.location.latitude + "," + message.location.longitude;
  } else {
    messageContent = message.type;
  }
  return { messageContent, media_link };
}

async function sendWhatsappMessage(message_type, body, channel, userPhone) {
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
      if (body.template.header == "VEDIO") {
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
      userPhone,
      "template",
      {
        template: template,
      }
    );
  } else {
    var params = {};
    if (message_type == "text") {
      params = { body: body.message };
    }
    return await sendMessage(
      channel.phone_id,
      channel.token,
      userPhone,
      "text",
      params
    );
  }
}

const downloadFile = async (url, token) => {
  try {
    const response = await await axios.download(url, token);
    return response;
  } catch (error) {
    console.error("Download error:", error.message);
    throw error;
  }
};

const convertToMp3 = (inputPath, outputPath) => {
  return new Promise((resolve, reject) => {
    // ffmpeg.setFfmpegPath(ffmpegPath);
    ffmpeg(inputPath)
      .toFormat("mp3")
      .on("start", (commandLine) => {
        console.log("FFmpeg process started:", commandLine);
      })
      .on("progress", (progress) => {
        console.log(`Processing: ${progress.percent}% done`);
      })
      .on("end", () => {
        console.log("Conversion completed successfully!");
        resolve();
      })
      .on("error", (err) => {
        console.error("Error during conversion:", err.message);
        reject(err);
      })
      .save(outputPath);
  });
};
