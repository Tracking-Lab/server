const express = require("express");
const router = express.Router();
const {
  login,
  changePassword,
  notifications,
  clearNotifications,
} = require("../../controllers/dashboard/UserController");

router.route("/login").post(login);
router.route("/change_password").post(changePassword);
router.route("/notifications").get(notifications);
router.route("/clear_notifications").get(clearNotifications);

module.exports = router;
