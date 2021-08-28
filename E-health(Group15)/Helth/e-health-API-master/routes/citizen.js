const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const Citizen = require('../model/citizen');
const CitizenReport = require('../model/citizenReport');
let nodemailer = require('nodemailer');


//get all citizens
router.get("/citizens", async(req, res, next) => {
    try {
        const citizen = await Citizen.find({ status: 'Live' })
        if (citizen == '') {

        }
        res.json(citizen)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }

});
// get  citizen to their nic
router.get("/citizen/:nic", async(req, res, next) => {
    try {
        const _nic = req.params.nic;
        const citizen = await Citizen.find({ nic: _nic })
        if (citizen == '') {
            return res.status(404).json({
                error: true,
                message: "No report citizen on that NIC .."
            })
        }
        res.json(citizen)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});

//update test informations
router.put("/updateResults/:id", async(req, res, next) => {
    try {
        const citizen = await Citizen.findByIdAndUpdate({ _id: req.params.id }, {
            results: req.body.results,
            test: req.body.test,

        }, {
            new: true,
            useFindAndModify: false,
            upsert: true
        })

        res.json(citizen)
    } catch (e) {
        next(e)
    }
});



router.post("/addCitizenReport", async(req, res, next) => {
    try {
        const report = await CitizenReport.create({
            cid: req.body.id,
            date: req.body.date,
            test: req.body.test,
            results: req.body.results,
            nic: req.body.nic

        })


        const citizen = await Citizen.findByIdAndUpdate({ _id: req.body.id }, {
            results: req.body.results,
            test: req.body.test,

        }, {
            new: true,
            useFindAndModify: false,
            upsert: true
        })

        res.json(report).status(200)
    } catch (e) {
        next(e)
    }
})


// get  citizen roports to their nic
router.get("/citizenReportsNic/:nic", async(req, res, next) => {
    try {
        const _nic = req.params.nic;
        const report = await CitizenReport.find({ nic: _nic })
        if (report == '') {
            return res.status(404).json({
                error: true,
                message: "No report Found on that NIC .."
            })
        }
        res.json(report)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});


// citizenReports get to id
router.get("/citizenReports/:id", async(req, res, next) => {
    try {
        const id = req.params.id;
        const report = await CitizenReport.find({ cid: id })
        if (report == '') {

        }
        res.json(report)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});

// citizenReports get to positivity 

router.get("/positivecitizen", async(req, res, next) => {
    try {

        const citizen = await Citizen.find({ status: 'Deactivated' })
        if (citizen == '') {

        }
        res.json(citizen)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});


//citizen delete route
router.delete("/deleteCitizen/:id", async(req, res, next) => {
    try {
        const citizen = await Citizen.deleteOne({ _id: req.params.id })
        res.json(citizen).status(202)
    } catch (e) {
        next(e)
    }
});






//deactive account
router.put("/updatestate/:id", async(req, res, next) => {
    try {
        const citizen = await Citizen.findByIdAndUpdate({ _id: req.params.id }, {
            status: "Deactivated",

        }, {
            new: true,
            useFindAndModify: false,
            upsert: true
        })


        res.json(citizen)
    } catch (e) {
        next(e)
    }
});


//deactive account
router.put("/email/:email", async(req, res, next) => {
    let transporter = nodemailer.createTransport({
        service: 'Gmail',
        auth: {
            user: process.env.SCREAT_EMAIL,
            pass: process.env.SCREAT_EMAIL_PASS
        }
    });

    let mailOptions = {
        from: process.env.SCREAT_EMAIL,
        to: req.body.email,
        subject: "About Account Deactivation",
        text: 'Mr/Ms ' + req.body.email + "," + '\n \nYour Account has been Deactivated, \n because you are a covid-19 positive patient..\n Get well soon!!! \n\nBest Regrads,\nE-Helth.lk'
    };

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });

    res.json().status(200);
});



module.exports = router;