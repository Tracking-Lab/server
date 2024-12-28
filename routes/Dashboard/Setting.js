const express = require("express");
const router = express.Router();
const {
  index,
  channels,
  whatsappChannels,
  createChannel,
  updateChannel,
  deleteChannel,
  addChannelReplay,
  whatsappUpdatePricing,
  emailsChannels,
  templates,
  createTemplate,
  deleteTemplate,
  labels,
  createLabel,
  updateLabel,
  deleteLabel,
  replays,
  createReplay,
  updateReplay,
  deleteReplay,
  teams,
  createTeam,
  updateTeam,
  deleteTeam,
  assginUser,
  unassginUser,
  assginChannel,
  unassginChannel,
  usersTypes,
  users,
  createUser,
  updateUser,
  deleteUser,
  inboxResults,
  createInboxResult,
  updateInboxResult,
  deleteInboxResult,
  autoAssigin,
  groups,
  createGroup,
  updateGroup,
  deleteGroup,
  groupsContacts,
  templateConsts,
  connectEmail,
  emailAuth,
  deleteEmailChannel,
} = require("../../controllers/dashboard/SettingController");

router.route("/channels/create").post(createChannel);
router.route("/channels/update").post(updateChannel);
router.route("/channels/delete").post(deleteChannel);
router.route("/channels/add_replay").post(addChannelReplay);
router.route("/channels/whatsapp").get(whatsappChannels);
router.route("/channels/update_pricing").post(whatsappUpdatePricing);
router.route("/channels").get(channels);
router.route("/channels/emails").get(emailsChannels);
router.route("/channels/emails/connect").get(connectEmail);
router.route("/channels/emails/delete").post(deleteEmailChannel);
router.route("/templates/create").post(createTemplate);
router.route("/templates/delete").post(deleteTemplate);
router.route("/templates").get(templates);
router.route("/labels/create").post(createLabel);
router.route("/labels/update").post(updateLabel);
router.route("/labels/delete").post(deleteLabel);
router.route("/labels").get(labels);
router.route("/replays/create").post(createReplay);
router.route("/replays/update").post(updateReplay);
router.route("/replays/delete").post(deleteReplay);
router.route("/replays").get(replays);
router.route("/teams/create").post(createTeam);
router.route("/teams/update").post(updateTeam);
router.route("/teams/delete").post(deleteTeam);
router.route("/teams/assgin_user").post(assginUser);
router.route("/teams/un_assgin_user").post(unassginUser);
router.route("/teams/assgin_channel").post(assginChannel);
router.route("/teams/un_assgin_channel").post(unassginChannel);
router.route("/teams").get(teams);
router.route("/users_types").get(usersTypes);
router.route("/users/create").post(createUser);
router.route("/users/update").post(updateUser);
router.route("/users/delete").post(deleteUser);
router.route("/users").get(users);
router.route("/inbox_results").get(inboxResults);
router.route("/inbox_results/create").post(createInboxResult);
router.route("/inbox_results/update").post(updateInboxResult);
router.route("/inbox_results/delete").post(deleteInboxResult);
router.route("/auto_assigin").post(autoAssigin);
router.route("/groups/create").post(createGroup);
router.route("/groups/update").post(updateGroup);
router.route("/groups/delete").post(deleteGroup);
router.route("/groups/contacts").get(groupsContacts);
router.route("/groups").get(groups);
router.route("/template_consts").get(templateConsts);
router.route("/auth/google/callback").get(emailAuth);
router.route("/").get(index);

module.exports = router;