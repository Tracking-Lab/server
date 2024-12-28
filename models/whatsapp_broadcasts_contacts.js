const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('whatsapp_broadcasts_contacts', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    whatsapp_broadcast_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'whatsapp_broadcasts',
        key: 'id'
      }
    },
    contact_phone: {
      type: DataTypes.STRING(20),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'whatsapp_broadcasts_contacts',
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
        name: "whatsapp_broadcast_id",
        using: "BTREE",
        fields: [
          { name: "whatsapp_broadcast_id" },
        ]
      },
    ]
  });
};
