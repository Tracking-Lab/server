const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('templates', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    template_id: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    channel_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'whatsapp_channels',
        key: 'id'
      }
    },
    category: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    language: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    body: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    body_inputs: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    header: {
      type: DataTypes.STRING(60),
      allowNull: true
    },
    footer_text: {
      type: DataTypes.STRING(60),
      allowNull: true
    },
    status: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    status_note: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    is_default: {
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
    tableName: 'templates',
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
          { name: "channel_id" },
        ]
      },
    ]
  });
};
