const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('conversation_messages_pin', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    message_id: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'conversation_messages',
        key: 'id'
      },
      unique: "conversation_messages_pin_fk2"
    },
    conversation_id: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'conversations',
        key: 'id'
      }
    },
    created: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    }
  }, {
    sequelize,
    tableName: 'conversation_messages_pin',
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
      {
        name: "conversation_id",
        using: "BTREE",
        fields: [
          { name: "conversation_id" },
        ]
      },
    ]
  });
};
