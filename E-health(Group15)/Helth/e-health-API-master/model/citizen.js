const mongoose = require('mongoose');
let todayDate = new Date().toISOString().slice(0, 10);

const CitizenSchema = mongoose.Schema({
    id: {
        type: String
    },
    fname: {
        type: String,
        required: true
    },
    lname: {
        type: String,
        required: true
    },
    age: {
        type: String,
        required: true
    },
    nic: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    profeson: {
        type: String,
        required: true
    },
    affilication: {
        type: String,
        required: true
    },
    phone: {
        type: String,
        required: true

    },
    address: {
        type: String,
        required: true
    },
    location: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },

    image: {
        type: String
    },
    date: {
        type: String,
        default: todayDate
    },
    test: {
        type: String,
        default: "Not Set"
    },
    results: {
        type: String,
        default: "Not Set"
    },
    status: {
        type: String,
        default: "Live"
    }

});

module.exports = mongoose.model('Citizen', CitizenSchema)