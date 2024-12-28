const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('messages_template', {
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
      unique: "messages_template_fk1"
    },
    template_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'templates',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'messages_template',
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
        name: "template_id",
        using: "BTREE",
        fields: [
          { name: "template_id" },
        ]
      },
    ]
  });
};
