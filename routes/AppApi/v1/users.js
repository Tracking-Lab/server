const express = require("express");
const router = express.Router();
const {
  login,
  changePassword,
  notifications,
  clearNotifications,
  updateFCMToken,
} = require("../../../controllers/app_api/v1/UserController");

router.route("/login").post(login);
router.route("/change_password").post(changePassword);
router.route("/notifications").get(notifications);
router.route("/clear_notifications").get(clearNotifications);
router.route("/update_fcm_token").post(updateFCMToken);

module.exports = router;
