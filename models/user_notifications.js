const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user_notifications', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    inbox_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'inboxes',
        key: 'id'
      }
    },
    title: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    title_en: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    body: {
      type: DataTypes.STRING(500),
      allowNull: false
    },
    body_en: {
      type: DataTypes.STRING(500),
      allowNull: false
    },
    viewed: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    created: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    }
  }, {
    sequelize,
    tableName: 'user_notifications',
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
        name: "user_id",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
      {
        name: "inbox_id",
        using: "BTREE",
        fields: [
          { name: "inbox_id" },
        ]
      },
    ]
  });
};
