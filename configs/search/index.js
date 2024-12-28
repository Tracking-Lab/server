const obj = {}

exports.criteria = [{
    table: 'users',
    cols: ["name", "email", "tel"],
    includes: [{ 'alias': "branches" }]
}]
