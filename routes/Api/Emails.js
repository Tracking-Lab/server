const express = require("express");
const router = express.Router();
const {
  index,
  webhook,
} = require("../../controllers/api/EmailWebhookController");

router.route("/").get(index).post(webhook);

module.exports = router;
