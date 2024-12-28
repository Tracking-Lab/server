const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('conversation_participants', {
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
    participant_id: {
      type: DataTypes.BIGINT,
      allowNull: false
    },
    participant_type: {
      type: DataTypes.ENUM('user','team'),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'conversation_participants',
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
        name: "conversation_participants_fk1",
        using: "BTREE",
        fields: [
          { name: "conversation_id" },
        ]
      },
    ]
  });
};
