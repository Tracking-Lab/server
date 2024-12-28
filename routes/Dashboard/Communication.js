const express = require("express");
const router = express.Router();
const {
  contacts,
  messages,
  createMessages,
  starMessage,
  pinMessage,
  deleteMessage,
  searchMessage,
  starMessages,
  pinMessages,
} = require("../../controllers/dashboard/CommunicationController");

router.route("/messages/:id/star").get(starMessage);
router.route("/messages/:id/delete").get(deleteMessage);
router.route("/:id/messages").get(messages).post(createMessages);
router.route("/:id/messages/pin").post(pinMessage);
router.route("/:id/search").post(searchMessage);
router.route("/:id/star").get(starMessages);
router.route("/:id/pin").get(pinMessages);
router.route("/").get(contacts);

module.exports = router;
