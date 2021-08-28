const mongoose = require('mongoose');
let todayDate = new Date().toISOString().slice(0, 10);

let today = new Date();
let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();


const VisitSchema = mongoose.Schema({
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
    nic: {
        type: String,
        required: true
    },
    email: {
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
    date: {
        type: String,
        default: todayDate
    },
    cTime: {
        type: String,
        default: time
    },



});

module.exports = mongoose.model('VisitPlace', VisitSchema)