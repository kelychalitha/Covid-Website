const mongoose = require('mongoose');


const PhiSchema = mongoose.Schema({
    fname: {
        type: String,

    },
    lname: {
        type: String,

    },
    nic: {
        type: String,

    },
    email: {
        type: String,

    },

    phone: {
        type: String,


    },
    address: {
        type: String,

    },
    location: {
        type: String,

    },
    password: {
        type: String,

    },
    image: {
        type: String,

    },


});

module.exports = mongoose.model('Phi', PhiSchema)