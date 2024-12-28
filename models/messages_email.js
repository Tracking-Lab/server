const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('messages_email', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    message_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'messages',
        key: 'id'
      },
      unique: "messages_email_fk1"
    },
    subject: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    sender: {
      type: DataTypes.STRING(500),
      allowNull: false
    },
    body: {
      type: DataTypes.TEXT,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'messages_email',
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
        name: "message_id",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "message_id" },
        ]
      },
    ]
  });
};
