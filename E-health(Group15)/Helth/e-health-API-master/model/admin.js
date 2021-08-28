const mongoose = require('mongoose');

const adminSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    type: {
        type: String,
        default: "Admin",
    },
    email: {
        type: String,
        min: 7,
        required: true,
        unique: true,

    },
    password: {
        type: String,
        min: 8,
        required: true,
    },


});

module.exports = mongoose.model('Admin', adminSchema)