const express = require("express");
const router = express.Router();

const webhook = require("./Webhook");
const emails = require("./Emails");

router.use("/webhook", webhook);
router.use("/emails", emails);

module.exports = router;
