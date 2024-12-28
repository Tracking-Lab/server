const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const api = require("./routes/Api/index");
const appApiV1 = require("./routes/AppApi/v1/index");
const dashboard = require("./routes/Dashboard/index");
const fileEasyUpload = require("express-easy-fileuploader");
const file_upload = require("./middleware/media_upload");

const session = require("express-session");

const socket = require("./socket");
require("./controllers/corn_job/index");

const PORT = process.env.PORT || 8000;
server = app.listen(PORT, async () => {
  console.log(`server is running on port is ${PORT} !! `);
});

global.io = require("socket.io")(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE"],
    transports: ["polling", "websocket"],
    allowEI03: true,
    rejectUnauthorized: false,
  },
});

socket.initSocket();
app.use(
  session({
    secret: "your_secure_secret_key", // Replace with a strong secret
    resave: false,
    saveUninitialized: false,
  })
);
app.use(cors());
app.use(bodyParser.json());
app.use(
  fileEasyUpload({
    app,
    fileUploadOptions: {
      // limits: { fileSize: 500 * 1024 * 1024 },
    },
  })
);
app.use(file_upload);
app.use(express.static("public"));
app.use("/bot/public", express.static("public"));
app.use("/bot/api", api);
app.use("/app/api/v1", appApiV1); // only for applications routs
app.use("/bot/dashboard", dashboard);

app.use((req, res, next) => {
  console.log(req.method);
  console.log(req.path);
  res.status(404).json({ message: "Path not found!" });
});

module.exports = app;
