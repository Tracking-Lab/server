const configs = require("../../configs/messages")


exports.sendOtpMessage = async (phone, message) => {
    const result = await http.get(`${configs.url}?bearerTokens=${configs.token}&
    sender=${configs.brand_name}&
    recipients=${phone}&
    body=${message}`)
    if (result.statusCode == 201) {
        return true
    }
    else {
        return false;
    }
}