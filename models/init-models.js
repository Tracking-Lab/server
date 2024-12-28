var DataTypes = require("sequelize").DataTypes;
var _auto_assign_setting = require("./auto_assign_setting");
var _channels = require("./channels");
var _contact_notes = require("./contact_notes");
var _contacts = require("./contacts");
var _contacts_imports = require("./contacts_imports");
var _conversation_messages = require("./conversation_messages");
var _conversation_messages_mentioned = require("./conversation_messages_mentioned");
var _conversation_messages_pin = require("./conversation_messages_pin");
var _conversation_messages_star = require("./conversation_messages_star");
var _conversation_participants = require("./conversation_participants");
var _conversations = require("./conversations");
var _email_channels = require("./email_channels");
var _favorites = require("./favorites");
var _groups = require("./groups");
var _inbox_assigned_user = require("./inbox_assigned_user");
var _inbox_email = require("./inbox_email");
var _inbox_labels = require("./inbox_labels");
var _inbox_results = require("./inbox_results");
var _inboxes = require("./inboxes");
var _labels = require("./labels");
var _mentioned_inboxes = require("./mentioned_inboxes");
var _messages = require("./messages");
var _messages_button = require("./messages_button");
var _messages_email = require("./messages_email");
var _messages_email_attachments = require("./messages_email_attachments");
var _messages_template = require("./messages_template");
var _notifications = require("./notifications");
var _replays = require("./replays");
var _sessions = require("./sessions");
var _spam = require("./spam");
var _team_channels = require("./team_channels");
var _team_users = require("./team_users");
var _teams = require("./teams");
var _template_buttons = require("./template_buttons");
var _template_header = require("./template_header");
var _templates = require("./templates");
var _user_notifications = require("./user_notifications");
var _users = require("./users");
var _users_types = require("./users_types");
var _whatsapp_broadcasts = require("./whatsapp_broadcasts");
var _whatsapp_broadcasts_contacts = require("./whatsapp_broadcasts_contacts");
var _whatsapp_channels = require("./whatsapp_channels");
var _whatsapp_template_cost = require("./whatsapp_template_cost");

function initModels(sequelize) {
  var auto_assign_setting = _auto_assign_setting(sequelize, DataTypes);
  var channels = _channels(sequelize, DataTypes);
  var contact_notes = _contact_notes(sequelize, DataTypes);
  var contacts = _contacts(sequelize, DataTypes);
  var contacts_imports = _contacts_imports(sequelize, DataTypes);
  var conversation_messages = _conversation_messages(sequelize, DataTypes);
  var conversation_messages_mentioned = _conversation_messages_mentioned(sequelize, DataTypes);
  var conversation_messages_pin = _conversation_messages_pin(sequelize, DataTypes);
  var conversation_messages_star = _conversation_messages_star(sequelize, DataTypes);
  var conversation_participants = _conversation_participants(sequelize, DataTypes);
  var conversations = _conversations(sequelize, DataTypes);
  var email_channels = _email_channels(sequelize, DataTypes);
  var favorites = _favorites(sequelize, DataTypes);
  var groups = _groups(sequelize, DataTypes);
  var inbox_assigned_user = _inbox_assigned_user(sequelize, DataTypes);
  var inbox_email = _inbox_email(sequelize, DataTypes);
  var inbox_labels = _inbox_labels(sequelize, DataTypes);
  var inbox_results = _inbox_results(sequelize, DataTypes);
  var inboxes = _inboxes(sequelize, DataTypes);
  var labels = _labels(sequelize, DataTypes);
  var mentioned_inboxes = _mentioned_inboxes(sequelize, DataTypes);
  var messages = _messages(sequelize, DataTypes);
  var messages_button = _messages_button(sequelize, DataTypes);
  var messages_email = _messages_email(sequelize, DataTypes);
  var messages_email_attachments = _messages_email_attachments(sequelize, DataTypes);
  var messages_template = _messages_template(sequelize, DataTypes);
  var notifications = _notifications(sequelize, DataTypes);
  var replays = _replays(sequelize, DataTypes);
  var sessions = _sessions(sequelize, DataTypes);
  var spam = _spam(sequelize, DataTypes);
  var team_channels = _team_channels(sequelize, DataTypes);
  var team_users = _team_users(sequelize, DataTypes);
  var teams = _teams(sequelize, DataTypes);
  var template_buttons = _template_buttons(sequelize, DataTypes);
  var template_header = _template_header(sequelize, DataTypes);
  var templates = _templates(sequelize, DataTypes);
  var user_notifications = _user_notifications(sequelize, DataTypes);
  var users = _users(sequelize, DataTypes);
  var users_types = _users_types(sequelize, DataTypes);
  var whatsapp_broadcasts = _whatsapp_broadcasts(sequelize, DataTypes);
  var whatsapp_broadcasts_contacts = _whatsapp_broadcasts_contacts(sequelize, DataTypes);
  var whatsapp_channels = _whatsapp_channels(sequelize, DataTypes);
  var whatsapp_template_cost = _whatsapp_template_cost(sequelize, DataTypes);

  email_channels.belongsTo(channels, { as: "channel", foreignKey: "channel_id"});
  channels.hasOne(email_channels, { as: "email_channel", foreignKey: "channel_id"});
  inboxes.belongsTo(channels, { as: "channel", foreignKey: "channel_id"});
  channels.hasMany(inboxes, { as: "inboxes", foreignKey: "channel_id"});
  team_channels.belongsTo(channels, { as: "channel", foreignKey: "channel_id"});
  channels.hasMany(team_channels, { as: "team_channels", foreignKey: "channel_id"});
  whatsapp_channels.belongsTo(channels, { as: "channel", foreignKey: "channel_id"});
  channels.hasOne(whatsapp_channels, { as: "whatsapp_channel", foreignKey: "channel_id"});
  contact_notes.belongsTo(contacts, { as: "contact", foreignKey: "contact_id"});
  contacts.hasMany(contact_notes, { as: "contact_notes", foreignKey: "contact_id"});
  inboxes.belongsTo(contacts, { as: "contact", foreignKey: "contact_id"});
  contacts.hasMany(inboxes, { as: "inboxes", foreignKey: "contact_id"});
  spam.belongsTo(contacts, { as: "contact", foreignKey: "contact_id"});
  contacts.hasMany(spam, { as: "spams", foreignKey: "contact_id"});
  spam.belongsTo(contacts, { as: "user", foreignKey: "user_id"});
  contacts.hasMany(spam, { as: "user_spams", foreignKey: "user_id"});
  contacts.belongsTo(contacts_imports, { as: "contact_import", foreignKey: "contact_import_id"});
  contacts_imports.hasMany(contacts, { as: "contacts", foreignKey: "contact_import_id"});
  conversation_messages.belongsTo(conversation_messages, { as: "parent", foreignKey: "parent_id"});
  conversation_messages.hasMany(conversation_messages, { as: "conversation_messages", foreignKey: "parent_id"});
  conversation_messages_mentioned.belongsTo(conversation_messages, { as: "message", foreignKey: "message_id"});
  conversation_messages.hasMany(conversation_messages_mentioned, { as: "conversation_messages_mentioneds", foreignKey: "message_id"});
  conversation_messages_pin.belongsTo(conversation_messages, { as: "message", foreignKey: "message_id"});
  conversation_messages.hasOne(conversation_messages_pin, { as: "conversation_messages_pin", foreignKey: "message_id"});
  conversation_messages_star.belongsTo(conversation_messages, { as: "message", foreignKey: "message_id"});
  conversation_messages.hasOne(conversation_messages_star, { as: "conversation_messages_star", foreignKey: "message_id"});
  conversation_messages.belongsTo(conversations, { as: "conversation", foreignKey: "conversation_id"});
  conversations.hasMany(conversation_messages, { as: "conversation_messages", foreignKey: "conversation_id"});
  conversation_messages_pin.belongsTo(conversations, { as: "conversation", foreignKey: "conversation_id"});
  conversations.hasMany(conversation_messages_pin, { as: "conversation_messages_pins", foreignKey: "conversation_id"});
  conversation_participants.belongsTo(conversations, { as: "conversation", foreignKey: "conversation_id"});
  conversations.hasMany(conversation_participants, { as: "conversation_participants", foreignKey: "conversation_id"});
  contacts.belongsTo(groups, { as: "group", foreignKey: "group_id"});
  groups.hasMany(contacts, { as: "contacts", foreignKey: "group_id"});
  favorites.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasMany(favorites, { as: "favorites", foreignKey: "inbox_id"});
  inbox_assigned_user.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasOne(inbox_assigned_user, { as: "inbox_assigned_user", foreignKey: "inbox_id"});
  inbox_email.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasOne(inbox_email, { as: "inbox_email", foreignKey: "inbox_id"});
  inbox_labels.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasMany(inbox_labels, { as: "inbox_labels", foreignKey: "inbox_id"});
  mentioned_inboxes.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasMany(mentioned_inboxes, { as: "mentioned_inboxes", foreignKey: "inbox_id"});
  messages.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasMany(messages, { as: "messages", foreignKey: "inbox_id"});
  user_notifications.belongsTo(inboxes, { as: "inbox", foreignKey: "inbox_id"});
  inboxes.hasMany(user_notifications, { as: "user_notifications", foreignKey: "inbox_id"});
  inbox_labels.belongsTo(labels, { as: "label", foreignKey: "label_id"});
  labels.hasMany(inbox_labels, { as: "inbox_labels", foreignKey: "label_id"});
  messages_button.belongsTo(messages, { as: "message", foreignKey: "message_id"});
  messages.hasOne(messages_button, { as: "messages_button", foreignKey: "message_id"});
  messages_email.belongsTo(messages, { as: "message", foreignKey: "message_id"});
  messages.hasOne(messages_email, { as: "messages_email", foreignKey: "message_id"});
  messages_template.belongsTo(messages, { as: "message", foreignKey: "message_id"});
  messages.hasOne(messages_template, { as: "messages_template", foreignKey: "message_id"});
  messages_email_attachments.belongsTo(messages_email, { as: "messages_email", foreignKey: "messages_email_id"});
  messages_email.hasMany(messages_email_attachments, { as: "messages_email_attachments", foreignKey: "messages_email_id"});
  team_channels.belongsTo(teams, { as: "team", foreignKey: "team_id"});
  teams.hasMany(team_channels, { as: "team_channels", foreignKey: "team_id"});
  team_users.belongsTo(teams, { as: "team", foreignKey: "team_id"});
  teams.hasMany(team_users, { as: "team_users", foreignKey: "team_id"});
  messages_template.belongsTo(templates, { as: "template", foreignKey: "template_id"});
  templates.hasMany(messages_template, { as: "messages_templates", foreignKey: "template_id"});
  template_buttons.belongsTo(templates, { as: "template", foreignKey: "template_id"});
  templates.hasMany(template_buttons, { as: "template_buttons", foreignKey: "template_id"});
  template_header.belongsTo(templates, { as: "template", foreignKey: "template_id"});
  templates.hasOne(template_header, { as: "template_header", foreignKey: "template_id"});
  whatsapp_broadcasts.belongsTo(templates, { as: "template", foreignKey: "template_id"});
  templates.hasMany(whatsapp_broadcasts, { as: "whatsapp_broadcasts", foreignKey: "template_id"});
  auto_assign_setting.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(auto_assign_setting, { as: "auto_assign_settings", foreignKey: "user_id"});
  contact_notes.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(contact_notes, { as: "contact_notes", foreignKey: "user_id"});
  contacts_imports.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(contacts_imports, { as: "contacts_imports", foreignKey: "user_id"});
  conversation_messages.belongsTo(users, { as: "sender", foreignKey: "sender_id"});
  users.hasMany(conversation_messages, { as: "conversation_messages", foreignKey: "sender_id"});
  conversation_messages_mentioned.belongsTo(users, { as: "mention_user", foreignKey: "mention_user_id"});
  users.hasMany(conversation_messages_mentioned, { as: "conversation_messages_mentioneds", foreignKey: "mention_user_id"});
  conversation_messages_mentioned.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(conversation_messages_mentioned, { as: "user_conversation_messages_mentioneds", foreignKey: "user_id"});
  conversation_messages_star.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(conversation_messages_star, { as: "conversation_messages_stars", foreignKey: "user_id"});
  favorites.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(favorites, { as: "favorites", foreignKey: "user_id"});
  inbox_assigned_user.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(inbox_assigned_user, { as: "inbox_assigned_users", foreignKey: "user_id"});
  mentioned_inboxes.belongsTo(users, { as: "mentioned_user", foreignKey: "mentioned_user_id"});
  users.hasMany(mentioned_inboxes, { as: "mentioned_inboxes", foreignKey: "mentioned_user_id"});
  mentioned_inboxes.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(mentioned_inboxes, { as: "user_mentioned_inboxes", foreignKey: "user_id"});
  messages.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(messages, { as: "messages", foreignKey: "user_id"});
  sessions.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(sessions, { as: "sessions", foreignKey: "user_id"});
  team_users.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(team_users, { as: "team_users", foreignKey: "user_id"});
  user_notifications.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(user_notifications, { as: "user_notifications", foreignKey: "user_id"});
  users.belongsTo(users_types, { as: "user_type", foreignKey: "user_type_id"});
  users_types.hasMany(users, { as: "users", foreignKey: "user_type_id"});
  whatsapp_broadcasts_contacts.belongsTo(whatsapp_broadcasts, { as: "whatsapp_broadcast", foreignKey: "whatsapp_broadcast_id"});
  whatsapp_broadcasts.hasMany(whatsapp_broadcasts_contacts, { as: "whatsapp_broadcasts_contacts", foreignKey: "whatsapp_broadcast_id"});
  templates.belongsTo(whatsapp_channels, { as: "channel", foreignKey: "channel_id"});
  whatsapp_channels.hasMany(templates, { as: "templates", foreignKey: "channel_id"});
  whatsapp_broadcasts.belongsTo(whatsapp_channels, { as: "whatsapp_channel", foreignKey: "whatsapp_channel_id"});
  whatsapp_channels.hasMany(whatsapp_broadcasts, { as: "whatsapp_broadcasts", foreignKey: "whatsapp_channel_id"});

  return {
    auto_assign_setting,
    channels,
    contact_notes,
    contacts,
    contacts_imports,
    conversation_messages,
    conversation_messages_mentioned,
    conversation_messages_pin,
    conversation_messages_star,
    conversation_participants,
    conversations,
    email_channels,
    favorites,
    groups,
    inbox_assigned_user,
    inbox_email,
    inbox_labels,
    inbox_results,
    inboxes,
    labels,
    mentioned_inboxes,
    messages,
    messages_button,
    messages_email,
    messages_email_attachments,
    messages_template,
    notifications,
    replays,
    sessions,
    spam,
    team_channels,
    team_users,
    teams,
    template_buttons,
    template_header,
    templates,
    user_notifications,
    users,
    users_types,
    whatsapp_broadcasts,
    whatsapp_broadcasts_contacts,
    whatsapp_channels,
    whatsapp_template_cost,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
