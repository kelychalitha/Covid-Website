const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const Contact = require('../model/contact');
const xml = require('xml');

// add message

router.post("/AddMessage", async(req, res, next) => {
    try {
        const message = await Contact.create({
            _id: new mongoose.Types.ObjectId(),
            name: req.body.name,
            email: req.body.email,
            message: req.body.message


        })

        res.json(message)
    } catch (e) {
        next(e)
    }
});

//get all messages
router.get("/messages", async(req, res, next) => {
    try {
        const message = await Contact.find()
        if (message == '') {
            return res.status(404).json({
                error: true,
                message: "No message Found .."
            })
        }
        res.json(message)

    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }

});

//get all messages to XML format
router.get("/messagesToXml", async(req, res, next) => {
    try {
        const message = await Contact.find()
        if (message == '') {
            return res.status(404).json({
                error: true,
                message: "No message Found .."
            })
        }
        res.set('Content-Type', 'text/xml');
        res.send(xml(message));

    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }

});





//get  messages to email
router.get("/messagesToEmail/:email", async(req, res, next) => {
    try {
        const _email = req.params.email;
        const message = await Contact.find({ email: _email })
        if (message == '') {
            return res.status(404).json({
                error: true,
                message: "No message Found .."
            })
        }
        res.json(message)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});

module.exports = router;