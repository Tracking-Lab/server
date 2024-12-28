const client = require('./index')
async function test() {
    try {
        let result = await client.getAddress(-33.8688, 151.2093)
        console.log(result);

    } catch (error) {
        console.error('An error occurred:', error);
    }

};

test()
