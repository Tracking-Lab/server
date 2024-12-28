const { conn, sequelize } = require("../../db/conn");
const { Sequelize, Op, Model, DataTypes, where } = require("sequelize");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

exports.login = async (req, res) => {
  try {
    console.log(req.body);
    var user = await conn.users.findOne({
      where: { email: req.body.email, is_deleted: 0 },
    });
    console.log(" the logd user is  ", user);
    if (user) {
      console.log("valied user");
      bcrypt.compare(req.body.pass, user.password, async function (err, resp) {
        console.log("the resp ", resp);
        console.log("the pass from table ", user.password);
        console.log("the request password is ", req.body.pass);
        if (resp) {
          delete user.password;
          var token = jwt
            .sign(
              {
                _id: user.id,
                access: "auth",
              },
              "atcsmart"
            )
            .toString();
          console.log("the token ", token);
          user.setDataValue("token", token);

          res.header("x-auth", token).send({ status: true, data: user });
        } else {
          res.send({
            status: 0,
            message: "خطأ في الإيميل او كلمة السر",
          });
        }
      });
    } else
      res.send({
        status: 0,
        message: "الرجاء المحاولة لاحقا",
      });
  } catch (error) {
    console.log(error);
  }
};

exports.changePassword = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const salt = await bcrypt.genSalt(10);
      const hashedPassword = await bcrypt.hash(req.body.new_password, salt);
      req.body.password = hashedPassword;
      const user = await conn.users.findOne({
        where: { id: userId },
      });

      bcrypt.compare(
        req.body.current_password,
        user.password,
        async function (err, resp) {
          if (resp) {
            await conn.users.update(
              { password: req.body.password },
              { where: { id: userId } }
            );
            res.send({
              status: true,
              message: null,
            });
          } else {
            res.send({
              status: false,
              message: "خطأ في كلمة السر",
            });
          }
        }
      );
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.notifications = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const notifications = await conn.user_notifications.findAll({
        where: { user_id: userId, viewed: 0 },
        order: [["id", "DESC"]],
      });
      if (notifications) {
        res.send({
          status: true,
          data: notifications,
        });
      } else {
        res.send({
          status: false,
          message: "no labels",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};

exports.clearNotifications = async (req, res) => {
  if (req.headers && req.headers.authorization) {
    var authorization = req.headers.authorization,
      decoded;

    try {
      decoded = jwt.verify(authorization, "atcsmart");
    } catch (e) {
      return res
        .status(401)
        .json({ status: false, message: "unauthorized", id: authorization });
    }
    var userId = decoded._id;
    try {
      const notifications = await conn.user_notifications.update(
        { viewed: 1 },
        {
          where: { user_id: userId, viewed: 0 },
        }
      );
      if (notifications) {
        res.send({
          status: true,
          data: notifications,
        });
      } else {
        res.send({
          status: false,
          message: "no labels",
        });
      }
    } catch (e) {
      console.log(e);
      return res.status(500).json({ status: false, message: "server error" });
    }
  } else {
    return res.status(401).json({ status: false, message: "unauthorized" });
  }
};
