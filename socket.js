const { sequelize, conn } = require("./db/conn");
const { Sequelize, Op, Model, DataTypes } = require("sequelize");

exports.initSocket = () => {
  global.io.on("connect_error", () => {
    // revert to classic upgrade
    socket.io.opts.transports = ["polling", "websocket"];
  });
  global.io.on("connection", (socket) => {
    console.log(socket.handshake.query); // prints { x: "42", EIO: "4", transport: "polling" }
  });

  global.io.on("connect", async (socket) => {
    console.log("clint connected"); // f
    //handle the notifications for the actors
    socket.on("update_socket_session", async (session_data) => {
      console.log(session_data.user_id);

      try {
        let session_user_data = await sequelize.query(
          `select id from sessions where user_id=${session_data.user_id} and finish_time is null`
        );
        console.log(session_user_data[0].length);
        if (
          session_user_data[0].length == 0 ||
          session_user_data[0].length == undefined
        ) {
          await conn.sessions.create({
            user_id: session_data.user_id,
            socket_id: socket.id,
          });
        }
        if (session_user_data[0][0]) {
          const session_user_data = await sequelize.query(
            `update sessions set sessions.socket_id='${socket.id}' where user_id=${session_data.user_id}`
          );
          console.log(
            `session updated for the user with id = ${session_data.user_id}`
          );
        }
      } catch (e) {
        console.log(e);
      }
    });
  });
};
