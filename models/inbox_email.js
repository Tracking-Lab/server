const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('inbox_email', {
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
      },
      unique: "inbox_email_fk1"
    },
    sender: {
      type: DataTypes.STRING(500),
      allowNull: false
    },
    thread_id: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    message_id: {
      type: DataTypes.STRING(500),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'inbox_email',
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
        name: "inbox_id",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "inbox_id" },
        ]
      },
    ]
  });
};
