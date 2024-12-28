const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('whatsapp_broadcasts', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    whatsapp_channel_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'whatsapp_channels',
        key: 'id'
      }
    },
    template_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'templates',
        key: 'id'
      }
    },
    send_time: {
      type: DataTypes.DATE,
      allowNull: false
    },
    cost: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    contacts_count: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    status: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    created: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    },
    updated: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    }
  }, {
    sequelize,
    tableName: 'whatsapp_broadcasts',
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
        name: "whatsapp_channel_id",
        using: "BTREE",
        fields: [
          { name: "whatsapp_channel_id" },
        ]
      },
      {
        name: "template_id",
        using: "BTREE",
        fields: [
          { name: "template_id" },
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
