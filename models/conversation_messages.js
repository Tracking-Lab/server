const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('conversation_messages', {
    id: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    conversation_id: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'conversations',
        key: 'id'
      }
    },
    parent_id: {
      type: DataTypes.BIGINT,
      allowNull: true,
      references: {
        model: 'conversation_messages',
        key: 'id'
      }
    },
    sender_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    message: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    media_link: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    type: {
      type: DataTypes.BLOB,
      allowNull: true,
      defaultValue: "text"
    },
    created: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    }
  }, {
    sequelize,
    tableName: 'conversation_messages',
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
        name: "conversation_messages_fk1",
        using: "BTREE",
        fields: [
          { name: "conversation_id" },
        ]
      },
      {
        name: "sender_id",
        using: "BTREE",
        fields: [
          { name: "sender_id" },
        ]
      },
      {
        name: "parent_id",
        using: "BTREE",
        fields: [
          { name: "parent_id" },
        ]
      },
    ]
  });
};
