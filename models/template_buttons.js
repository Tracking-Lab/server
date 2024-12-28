const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('template_buttons', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    template_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'templates',
        key: 'id'
      }
    },
    type: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(25),
      allowNull: false
    },
    value: {
      type: DataTypes.STRING(50),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'template_buttons',
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
        name: "template_id",
        using: "BTREE",
        fields: [
          { name: "template_id" },
        ]
      },
    ]
  });
};
