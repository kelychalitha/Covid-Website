const mongoose = require('mongoose');

const contactSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: {
        type: String,
    },
    email: {
        type: String,


    },
    message: {
        type: String
    },


});

module.exports = mongoose.model('Contact', contactSchema)