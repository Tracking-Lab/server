const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('whatsapp_channels', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    channel_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'channels',
        key: 'id'
      },
      unique: "whatsapp_channels_fk1"
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    phone_id: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    phone_number: {
      type: DataTypes.STRING(20),
      allowNull: false
    },
    account_id: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    app_id: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    secret_key: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    token: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    is_deleted: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
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
    tableName: 'whatsapp_channels',
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
        unique: true,
        using: "BTREE",
        fields: [
          { name: "channel_id" },
        ]
      },
    ]
  });
};
