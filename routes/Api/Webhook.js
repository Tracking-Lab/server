const express = require("express");
const router = express.Router();
const { index, webhook } = require("../../controllers/api/WebhookController");

router.route("/").get(index).post(webhook);

module.exports = router;
