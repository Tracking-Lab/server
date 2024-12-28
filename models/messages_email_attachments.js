const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('messages_email_attachments', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    messages_email_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'messages_email',
        key: 'id'
      }
    },
    attachment: {
      type: DataTypes.STRING(500),
      allowNull: false
    },
    size: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    mime_type: {
      type: DataTypes.STRING(100),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'messages_email_attachments',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "messages_email_id",
        using: "BTREE",
        fields: [
          { name: "messages_email_id" },
        ]
      },
    ]
  });
};
