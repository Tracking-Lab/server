const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('inbox_labels', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    inbox_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'inboxes',
        key: 'id'
      }
    },
    label_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'labels',
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
    tableName: 'inbox_labels',
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
        name: "label_id",
        using: "BTREE",
        fields: [
          { name: "label_id" },
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
