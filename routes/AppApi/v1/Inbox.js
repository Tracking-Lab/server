const express = require("express");
const router = express.Router();
const {
  index,
  newInboxes,
  messages,
  labelInbox,
  removeLabel,
  assignInbox,
  reopenInbox,
  mensionInbox,
  assignedInboxes,
  spamInboxes,
  spamInbox,
  finishInbox,
  finishedInboxes,
  createMessage,
  createComment,
  deleteComment,
  newChat,
  assignedToMe,
  addInboxToFave,
  faveInboxs,
  menssionInboxs,
  channelInboxs,
  teamInboxs,
  labelInboxs,
  userInboxs,
  contactInfo,
  contactNote,
  getInboxByID,
  replays,
} = require("../../../controllers/app_api/v1/InboxController");

router.route("/new_inboxes").get(newInboxes);
router.route("/new_chat").post(newChat);
router.route("/assigned_inboxes").get(assignedInboxes);
router.route("/spam_inboxes").get(spamInboxes);
router.route("/finished_inboxes").get(finishedInboxes);
router.route("/assigned_to_me").get(assignedToMe);
router.route("/favorites").get(faveInboxs);
router.route("/menssion").get(menssionInboxs);
router.route("/replays").get(replays);
router.route("/team/:id").get(teamInboxs);
router.route("/channel/:id").get(channelInboxs);
router.route("/label/:id").get(labelInboxs);
router.route("/user/:id").get(userInboxs);
router.route("/:id/messages").get(messages).post(createMessage);
router.route("/:id/comments").post(createComment);
router.route("/:id/delete_comment").post(deleteComment);
router.route("/:id/label").post(labelInbox);
router.route("/:id/remove_label").post(removeLabel);
router.route("/:id/assigin").post(assignInbox);
router.route("/:id/reopen").post(reopenInbox);
router.route("/:id/mension").post(mensionInbox);
router.route("/:id/finish").post(finishInbox);
router.route("/:id/fave").post(addInboxToFave);
router.route("/:id/spam").post(spamInbox);
router.route("/:id/contact_info").post(contactInfo);
router.route("/:id/contact_note").post(contactNote);
router.route("/:id").get(getInboxByID);
router.route("/").get(index);

module.exports = router;
