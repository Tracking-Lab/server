const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('messages', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    from_phone: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    inbox_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'inboxes',
        key: 'id'
      }
    },
    message_id: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    timestamp: {
      type: DataTypes.BIGINT,
      allowNull: false
    },
    message: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    media_link: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    viewed: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    type: {
      type: DataTypes.STRING(50),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'messages',
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
        name: "channel_id",
        using: "BTREE",
        fields: [
          { name: "inbox_id" },
        ]
      },
      {
        name: "user_id",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
    ]
  });
};
