const express = require("express");
const router = express.Router();
const {
  contacts,
  messages,
  createMessages,
  deleteMessage,
  starMessage,
  pinMessage,
  searchMessage,
  starMessages,
  pinMessages,
} = require("../../../controllers/app_api/v1/CommunicationController");

router.route("/messages/:id/star").get(starMessage);
router.route("/messages/:id/delete").get(deleteMessage);
router.route("/:id/messages").get(messages).post(createMessages);
router.route("/:id/messages/pin").post(pinMessage);
router.route("/:id/search").post(searchMessage);
router.route("/:id/star").get(starMessages);
router.route("/:id/pin").get(pinMessages);
router.route("/").get(contacts);

module.exports = router;
