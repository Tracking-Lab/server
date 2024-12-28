// const configs = require("./config/index");
const axios = require("../axios/index");

async function sendMessage(
  phone_number_id,
  token,
  receiver_number,
  type,
  messageData
) {
  try {
    console.log(messageData);
    var object = {
      messaging_product: "whatsapp",
      to: receiver_number,
      type: type,
    };

    if (type == "template") {
      object.template = messageData.template;
    } else {
      object.preview_url = true;
      object[type] = messageData;
    }
    let result = await axios.post(
      object,
      `https://graph.facebook.com/v19.0/${phone_number_id}/messages`,
      token
    );

    console.log("Message sent successfully:", result);
    return true;
  } catch (error) {
    console.error("Error sending message:", error);
    return false;
  }
}

async function sendTemplate(account_id, token, template) {
  try {
    console.log(template);

    let result = await axios.post(
      template,
      `https://graph.facebook.com/v20.0/${account_id}/message_templates`,
      token
    );

    console.log("Message sent successfully:", result);
    return result;
  } catch (error) {
    console.error("Error sending message:", error);
    return null;
  }
}

module.exports = { sendMessage, sendTemplate };
