const express = require("express");
const router = express.Router();

const inbox = require("./Inbox");
const users = require("./users");
const contacts = require("./Contacts");
const communication = require("./Communication");

router.use("/users", users);
router.use("/inbox", inbox);
router.use("/contacts", contacts);
router.use("/communication", communication);

module.exports = router;
