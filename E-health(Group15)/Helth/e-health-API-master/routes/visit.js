const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const Visit = require('../model/visit');




//get all place visits
router.get("/visits", async(req, res, next) => {
    try {
        const visit = await Visit.find()
        if (visit == '') {
            return res.status(404).json({
                error: true,
                message: "No Visits Found .."
            })
        }
        res.json(visit)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }

});

//get all place visits by nic
router.get("/visit/:nic", async(req, res, next) => {
    try {
        const _nic = req.params.nic;
        const visit = await Visit.find({ nic: _nic })
        if (visit == '') {
            return res.status(404).json({
                error: true,
                message: "No Visits to this.."
            })
        }
        res.json(visit)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});


// add new visit

router.post("/AddVisit", async(req, res, next) => {
    try {
        const visit = await Visit.create({
            _id: new mongoose.Types.ObjectId(),
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            address: req.body.address,
            phone: req.body.phone,
            nic: req.body.nic,
            location: req.body.location,
            date: req.body.date,
            cTime: req.body.cTime


        })

        res.json(visit)
    } catch (e) {
        next(e)
    }
});


module.exports = router;