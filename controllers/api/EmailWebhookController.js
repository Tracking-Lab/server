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
const url = require("url");
const crypto = require("crypto");
const email_configs = require("../../configs/emails/index");
const public_configs = require("../../configs/public/index");

// Create an OAuth2 client
const oauth2Client = new google.auth.OAuth2(
  email_configs.email.CLIENT_ID,
  email_configs.email.CLIENT_SECRET,
  email_configs.email.REDIRECT_URL
);

exports.index = async (req, res, next) => {};

exports.webhook = async (req, res, next) => {
  try {
    const body = JSON.parse(dataFromBuffer(req.body.message.data));

    const content = JSON.stringify(req.body);

    fs.writeFile("./public/email.txt", content, (err) => {
      if (err) {
        console.error(err);
      } else {
      }
    });

    const message = req.body.message;
    // console.log(message);
    // console.log(message.message_id);
    // console.log(message.messageId);
    // console.log(body);
    const emailAddress = body.emailAddress;
    const historyId = body.historyId;
    if (body.emailAddress != null) {
      const emailChannel = await conn.email_channels.findOne({
        include: [
          { model: conn.channels, as: "channel", where: { is_deleted: 0 } },
        ],
        where: { email: body.emailAddress },
      });
      if (emailChannel) {
        // console.log(historyId);
        const token = await refreshAccessToken(emailChannel.refresh_token);
        const messageData = await fetchLatestMessage(historyId, token);

        // const messageData = res.data;
        // console.log("Message details:", messageData);
        // console.log("Message details:", res);

        // Extract parts of the message
        const headers = messageData.payload.headers;
        const subject = headers.find(
          (header) => header.name === "Subject"
        )?.value;
        const from = headers.find((header) => header.name === "From")?.value;
        const to = headers.find((header) => header.name === "To")?.value;
        const emailMatch = headers
          .find((header) => header.name === "From")
          ?.value.match(/<(.*)>/);
        const nameMatch = headers
          .find((header) => header.name === "From")
          ?.value.match(/(.*) <.*>/);
        var messageIdHeader = headers.find(
          (header) => header.name === "Message-Id"
        )?.value;

        if (messageIdHeader == null) {
          messageIdHeader = headers.find(
            (header) => header.name === "Message-ID"
          )?.value;
        }

        // const nameMatch = fromValue.match(/(.*) <.*>/);
        // const emailMatch = fromValue.match(/<(.*)>/);

        const senderName = nameMatch ? nameMatch[1].trim() : null;
        const senderEmail = emailMatch ? emailMatch[1] : null;

        const { emailBody, images } = await getBody(
          messageData.payload,
          messageIdHeader
        );

        console.log;

        console.log(`Subject: ${subject}`);
        console.log(`From: ${from}`);
        console.log(`Sender: ${senderEmail}`);
        console.log(`Sender Name: ${senderName}`);
        console.log(`To: ${to}`);
        console.log(`Message ID: ${messageIdHeader}`);
        // console.log(`Body: ${emailBody}`);

        var contact = null;
        var inbox = null;

        contact = await conn.contacts.findOne({
          where: { email: senderEmail },
        });
        if (contact == null) {
          contact = await conn.contacts.create({
            name: senderName,
            email: senderEmail,
          });
        }

        if (contact != null) {
          var isNewInbox = false;
          inbox = await conn.inboxes.findOne({
            where: {
              contact_id: contact.id,
              channel_id: emailChannel.channel.id,
            },
          });

          if (inbox == null) {
            inbox = await conn.inboxes.create({
              contact_id: contact.id,
              channel_id: emailChannel.channel.id,
            });
            isNewInbox = true;
            // email_message_id: messageIdHeader,
            // thread_id: messageData.threadId,
          }

          if (inbox) {
            const inbox_email = await conn.inbox_email.findOne({
              where: { inbox_id: inbox.id },
            });

            if (!inbox_email) {
              const inbox_email = await conn.inbox_email.create({
                inbox_id: inbox.id,
                sender: from,
                message_id: messageIdHeader,
                thread_id: messageData.threadId,
              });
            }

            if (isNewInbox) {
              var messageNote =
                "تم إنشاء التذكرة بواسطة " + contact.name ?? contact.email;
              var timestamp = Date.now();
              var messageN = {
                from_phone: contact.email,
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

            if (inbox.status == 0 && inbox.spam == 0) {
              var users = await conn.users.findAll({
                where: { is_deleted: 0 },
              });
              var creater = contact.name ?? contact.email;
              if (users) {
                for (let i = 0; i < users.length; i++) {
                  const user = users[i];
                  await conn.user_notifications.create({
                    user_id: user.id,
                    inbox_id: inbox.id,
                    title: "توجد محادثة جديدة",
                    body: creater + " - " + subject,
                    title_en: "New message",
                    body_en: creater + " - " + subject,
                  });
                }
              }
              global.io.emit("newInbox", {
                title: "توجد محادثة جديدة",
                body: creater + " - " + subject,
              });
            }

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
                "تم إعادة الفتح بواسطة " + contact.name ?? contact.email;
              var timestamp = Date.now();
              var messageN = {
                from_phone: contact.email,
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
              users = await conn.users.findAll({ where: { is_deleted: 0 } });
              if (users) {
                for (let i = 0; i < users.length; i++) {
                  const user = users[i];
                  await conn.user_notifications.create({
                    user_id: user.id,
                    inbox_id: inbox.id,
                    title: "توجد محادثة جديدة",
                    body: creater + " - " + subject,
                    title_en: "New message",
                    body_en: creater + " - " + subject,
                  });
                }
              }

              global.io.emit("newInbox", {
                title: "توجد محادثة جديدة",
                body: creater + " - " + subject,
              });
            }

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
                  var creater = contact.name ?? contact.email;

                  await conn.user_notifications.create({
                    user_id: user.id,
                    inbox_id: inbox.id,
                    title: "لديك محادثة جديدة",
                    body: creater + " - " + subject,
                    title_en: "New message",
                    body_en: creater + " - " + subject,
                  });
                  const session = await conn.sessions.findOne({
                    where: { user_id: user.id },
                  });
                  global.io.to(session?.socket_id).emit("newInbox", {
                    title: "لديك محادثة جديدة",
                    body: creater + " - " + subject,
                  });
                }
              }
            }

            var timestamp = Date.now();
            const newMessage = await conn.messages.create({
              from_phone: contact.email,
              inbox_id: inbox.id,
              message_id: "email_message",
              timestamp: timestamp,
              message: subject,
              media_link: null,
              type: "email",
            });

            const message_email = await conn.messages_email.create({
              message_id: newMessage.id,
              subject: subject,
              sender: from,
              body: emailBody,
            });

            Object.keys(images).forEach(async (cid) => {
              var imagePath = "public/messages/" + images[cid].filename;
              var size = images[cid].size / 1024;

              const sizeInKB = (images[cid].size / 1024).toFixed(0);
              const sizeInMB = (images[cid].size / (1024 * 1024)).toFixed(2);
              var mime_type = images[cid].mime_type;
              var strSize = "";
              if (sizeInMB > 1) {
                strSize = sizeInMB + " MB";
              } else {
                strSize = sizeInKB + " KB";
              }
              await conn.messages_email_attachments.create({
                messages_email_id: message_email.id,
                attachment: imagePath,
                size: strSize,
                mime_type: mime_type,
              });
            });

            await conn.inboxes.update(
              { updated: Date.now() },
              { where: { id: inbox.id } }
            );
          }
        }

        res.sendStatus(200);
      } else {
        res.sendStatus(200);
      }
    } else {
      res.sendStatus(200);
    }

    // const oauth2Client = new google.auth.OAuth2();
    // oauth2Client.setCredentials({ access_token: accessToken });
  } catch (e) {
    console.log(e);
    res.sendStatus(200);
  }
};

// Get message by ID
async function fetchLatestMessage(historyId, token) {
  oauth2Client.setCredentials({ access_token: token });

  const gmail = google.gmail({ version: "v1", auth: oauth2Client });
  try {
    // Step 1: Fetch history
    const historyRes = await gmail.users.history.list({
      userId: "me",
      startHistoryId: historyId, // The historyId from the webhook or previous fetch
    });

    const history = historyRes.data.history;

    // Step 2: Check for messagesAdded event
    if (history && history.length > 0) {
      const messageAddedEvents = history
        .filter((event) => event.messagesAdded)
        .flatMap((event) => event.messagesAdded);

      if (messageAddedEvents.length > 0) {
        // Step 3: Get the details of the latest message added
        const lastMessageId =
          messageAddedEvents[messageAddedEvents.length - 1].message.id;
        const messageDetails = await gmail.users.messages.get({
          userId: "me",
          id: lastMessageId,
        });

        console.log("Latest Added message from history:", messageDetails.data);
        return messageDetails.data;
      }
    }

    // Step 4: If no messagesAdded in history, fetch the latest message manually
    console.log("No messagesAdded event, fetching latest message manually...");

    // Step 5: Fetch the latest message from the inbox
    const messagesRes = await gmail.users.messages.list({
      userId: "me",
      maxResults: 1,
      q: "in:inbox", // Only get messages in the inbox
    });

    const latestMessageId = messagesRes.data.messages[0].id;
    const latestMessageDetails = await gmail.users.messages.get({
      userId: "me",
      id: latestMessageId,
    });

    console.log("Latest message from inbox:", latestMessageDetails.data);
    return latestMessageDetails.data;
  } catch (error) {
    console.error("Error fetching latest message:", error);
  }
}

// Helper function to extract the body from the message payload
async function getBody(payload, messageId) {
  let emailBody = "";
  var images = {};
  console.log(payload);
  if (payload.parts && payload.parts.length) {
    var htmlContent = getHtmlPart(payload.parts);
    images = await getImageAttachments(payload.parts, messageId);
    if (htmlContent) {
      console.log("htmlContent");
      console.log(htmlContent);
      if (Buffer.isBuffer(htmlContent)) {
        htmlContent = htmlContent.toString("utf-8"); // Convert buffer to string
      }
      const updatedHtml = replaceCidWithImages(htmlContent, images);
      // const cleanHtml = DOMPurify.sanitize(updatedHtml);
      console.log("updatedHtml");
      console.log(updatedHtml);
      emailBody = updatedHtml;
    } else {
      console.log("No HTML content found in the email.");
    }
    // body = getMessageBody(payload.parts);
  } else if (payload.body) {
    console.log(payload.body);
    emailBody = dataFromBuffer(payload.body.data);
  }

  return { emailBody, images };
}

function getHtmlPart(parts) {
  for (const part of parts) {
    if (part.mimeType === "text/html") {
      console.log(part.mimeType);
      console.log(part.body);
      if (part.body && part.body.data) {
        return decodeBase64url(part.body.data);
      }
    } else if (part.parts) {
      console.log(part.parts);
      // Recursive search in nested parts (multipart emails)
      const result = getHtmlPart(part.parts);
      if (result) return result;
    }
  }
  return null;
}

async function getImageAttachments(parts, messageId) {
  const images = {};
  for (const part of parts) {
    if (
      part.mimeType.startsWith("image/") ||
      part.mimeType.startsWith("video/") ||
      part.mimeType.startsWith("application/") ||
      part.mimeType.startsWith("audio/")
    ) {
      const cid = part.headers.find(
        (header) => header.name === "Content-ID"
      ).value;

      const gmail = google.gmail({ version: "v1", auth: oauth2Client });
      const attachment = await gmail.users.messages.attachments.get({
        userId: "me",
        messageId: messageId,
        id: part.body.attachmentId,
      });

      // console.log(attachment.data);
      console.log("attachment.data");
      console.log("attachment.data");
      if (attachment.data.data) {
        const size = attachment.data.size || decodedData.length;

        const imageData = decodeBase64url(attachment.data.data);
        images[cid] = {
          data: imageData,
          filename: part.filename,
          size: size,
          mime_type: part.mimeType,
        };
      }
    }
  }
  return images;
}

function replaceCidWithImages(htmlContent, images) {
  Object.keys(images).forEach(async (cid) => {
    var filePath = "./public/messages/" + images[cid].filename;
    await saveImage(images[cid].data, filePath);
    var id = cid.match(/<(.*)>/)[1];
    console.log(cid.match(/<(.*)>/)[1]);
    console.log("cid.match(/<(.*)>/)");
    var imagePath =
      public_configs.config.domain + "messages/" + images[cid].filename;
    htmlContent = htmlContent.replace(`cid:${id}`, imagePath);
  });
  return htmlContent;
}

async function saveImage(imageData, filename) {
  await fs.writeFileSync(filename, imageData);
  console.log(`Image saved as ${filename}`);
}

function decodeBase64url(base64url) {
  const base64 = base64url.replace(/-/g, "+").replace(/_/g, "/");
  return Buffer.from(base64, "base64");
}

function dataFromBuffer(data) {
  return Buffer.from(data, "base64").toString("utf8");
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
