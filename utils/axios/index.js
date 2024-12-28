const axios = require("axios");
// const xml = require("../xml")

exports.post = (data, url, bearerToken) => {
  return new Promise((resolve, reject) => {
    const headers = {
      Authorization: `Bearer ${bearerToken}`,
      "Content-Type": "application/json",
    };

    axios
      .post(url, data, { headers })
      .then((response) => resolve(response.data))
      .catch((error) => {
        console.error("Error sending data:", error);
        reject(error);
      });
  });
};

// exports.postXml = (data, url, bearerToken) => {
//     return new Promise((resolve, reject) => {
//         const headers = {
//             'Content-Type': 'text/xml'
//         };
//         axios.post(url, data, { headers })
//             .then((response) => resolve(xml.convertToJson(response.data)))
//             .catch((error) => {
//                 console.error('Error sending data:', error);
//                 reject(error);
//             });
//     });
// }

exports.get = (url, bearerToken) => {
  console.log(bearerToken);
  console.log(url);
  return new Promise((resolve, reject) => {
    const headers = {
      Authorization: `Bearer ${bearerToken}`,
      "Content-Type": "application/json",
    };
    axios
      .get(url, { headers })
      .then((response) => resolve(response.data))
      .catch((error) => {
        console.error("Error sending data:", error);
        reject(error);
      });
  });
};

exports.download = (url, bearerToken) => {
  console.log(bearerToken);
  console.log(url);

  return new Promise((resolve, reject) => {
    const headers = {
      Authorization: `Bearer ${bearerToken}`,
      "Content-Type": "application/json",
    };

    axios
      .get(url, { headers: headers, responseType: "arraybuffer" })
      .then((response) => resolve(response.data))
      .catch((error) => {
        console.error("Error sending data:", error);
        reject(error);
      });

    // axios({
    //   method: "get",
    //   url: url,
    //   headers: headers,
    //   responseType: "stream",
    // })
    //   .then((response) => resolve(response.data))
    //   .catch((error) => {
    //     console.error("Error sending data:", error);
    //     reject(error);
    //   });
  });
};
