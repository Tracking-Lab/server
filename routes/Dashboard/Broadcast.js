const express = require("express");
const router = express.Router();
const {
  broadcasts,
  createBroadcast,
} = require("../../controllers/dashboard/BroadcastController");

router.route("/create").post(createBroadcast);
router.route("/").get(broadcasts);

module.exports = router;
