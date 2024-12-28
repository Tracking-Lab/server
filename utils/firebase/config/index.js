const admin = require("firebase-admin");

// Replace with your downloaded service account credentials file path
const serviceAccount = require("../../../configs/firebase/serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

exports.messaging = admin.messaging();
