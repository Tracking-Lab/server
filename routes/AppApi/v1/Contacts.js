const express = require("express");
const router = express.Router();
const {
  contacts,
  createContact,
  importContacts,
  getImports,
  deleteImport,
} = require("../../../controllers/app_api/v1/ContactsController");

router.route("/create").post(createContact);
router.route("/import").post(importContacts);
router.route("/import/delete").post(deleteImport);
router.route("/imports").get(getImports);
router.route("/").get(contacts);

module.exports = router;
