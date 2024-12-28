const express = require("express");
const router = express.Router();

const inbox = require("./Inbox");
const settings = require("./Setting");
const users = require("./Users");
const contacts = require("./Contacts");
const broadcast = require("./Broadcast");
const communication = require("./Communication");

router.use("/users", users);
router.use("/settings", settings);
router.use("/inbox", inbox);
router.use("/contacts", contacts);
router.use("/broadcasts", broadcast);
router.use("/communication", communication);

module.exports = router;
