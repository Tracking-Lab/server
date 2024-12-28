const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('team_channels', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    team_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'teams',
        key: 'id'
      }
    },
    channel_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'channels',
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
    tableName: 'team_channels',
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
        name: "team_id",
        using: "BTREE",
        fields: [
          { name: "team_id" },
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
