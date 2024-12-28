const messaging = require("../config/index").messaging;

async function sendNotification(registrationToken, notificationData, badge) {
  const message = {
    token: registrationToken,
    // Customize notification payload as needed
    notification: {
      title: notificationData.title,
      body: notificationData.body,
    },
    data: notificationData, // Optional data payload for background processing
    android: {
      priority: "high",
      notification: {
        sound: "default",
      },
    },
    apns: {
      payload: {
        aps: {
          contentAvailable: true,
          badge: badge,
          sound: "default",
        },
      },
    },
  };

  try {
    const response = await messaging.send(message);
    console.log("Notification sent successfully:", response);
  } catch (error) {
    console.error("Error sending notification:", error);
  }
}

module.exports = { sendNotification };
