const fileEasyUpload = require("express-easy-fileuploader");
// const { path } = require("../server");
const file_handler = async (req, res, next) => {
  try {
    const fileName = ["media", "attachments"];

    // console.log(req);
    // console.log("req.files");
    // console.log(req.files);

    var directoryPath = "public/" + req.originalUrl.split("/").pop();
    // console.log(directoryPath);
    if (req.originalUrl.split("/templates/")[1]) {
      directoryPath = "public/templates";
    }
    if (req.originalUrl.split("/communication/")[1]) {
      directoryPath = "public/communication";
    }
    // } else if (req.originalUrl.split("/app_api/")[1]) {
    //   directoryPath = "public/" + req.originalUrl.split("/app_api/")[1];
    // } else if (req.originalUrl.split("/vendors/")[1]) {
    //   directoryPath = "public/" + req.originalUrl.split("/vendors/")[1];
    // }

    if (req.files) {
      console.log("req.files");
      for (var i = 0; i < fileName.length; i++) {
        console.log("fileName.length");
        if (Array.isArray(req.files[fileName[i]])) {
          var paths = [];
          if (req.files[fileName[i]]) {
            console.log("req.files[fileName[i]]");
            // console.log(req.files[fileName[i]].length);
            for (var j = 0; j < req.files[fileName[i]].length; j++) {
              console.log("req.files[fileName[i]].length");
              paths.push(await req[fileName[i]][j].save(directoryPath));
            }
            req.body[fileName[i]] = paths;
          }
        } else {
          console.log("ddddd");
          if (req.files[fileName[i]]) {
            // console.log(req.files[fileName[i]]);
            req.body[fileName[i]] = await req[fileName[i]].save(directoryPath);
            // console.log(req.body);
          } else {
            console.log("bbbbbb");
          }
        }
      }
    } else {
      console.log("ooooooooo");
    }
    // return {};
    next();
  } catch (error) {
    console.log("error");
    // console.log(error);
  }
};

module.exports = file_handler;
// const fileEasyUpload = require('express-easy-fileuploader');
// const { path } = require('../server');

// const fileHandler = async (req, res, next) => {
//     try {
//         const fileName = ["image", "file"];
//         const directoryPath = "public/" + req.originalUrl.split("/api/")[1];

//         if (req.files) {
//             for (const fieldName of fileName) {
//                 const files = req.files[fieldName];
//                 if (Array.isArray(files)) {
//                     const paths = [];
//                     for (const file of files) {
//                         if (!file.processed) { // Check if the file has been processed
//                             paths.push(await file.save(directoryPath));
//                             file.processed = true; // Mark the file as processed
//                         }
//                     }
//                     req.body[fieldName] = JSON.stringify(paths);
//                 } else if (files && !files.processed) {
//                     req.body[fieldName] = await files.save(directoryPath);
//                     files.processed = true;
//                 }
//             }
//         }

//         next();
//     } catch (error) {
//         console.error(error);
//         next(error);
//     }
// };

// module.exports = fileHandler;
