const mongoose = require('mongoose');
let todayDate = new Date().toISOString().slice(0, 10);

const CitizenReportSchema = mongoose.Schema({
    cid: {
        type: String,
        required: true
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
    nic: {
        type: String
    }


});

module.exports = mongoose.model('CitizenReport', CitizenReportSchema)