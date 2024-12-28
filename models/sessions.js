const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('sessions', {
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
    socket_id: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    token: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    language: {
      type: DataTypes.STRING(2),
      allowNull: false,
      defaultValue: "ar"
    },
    device_id: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    device_type: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    app_os: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    app_version: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    ip_address: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    start_time: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.fn('current_timestamp')
    },
    finish_time: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'sessions',
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
    ]
  });
};
