const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const Phi = require('../model/phi');
const jwt = require('jsonwebtoken');
const Citizen = require('../model/citizen');
const Admin = require('../model/admin');





//phi signup route 
router.post('/phi/signup', (req, res, next) => {
    Phi.find({ email: req.body.email })
        .exec()
        .then(phi => { //check if the email is allready taken
            if (phi.length >= 1) {
                return res.status(409).json({
                    message: 'Email Not Available. '
                });
            } else {
                bcrypt.hash(req.body.password, 10, (err, hash) => { //hash the password using bcrypt
                    if (err) {
                        return res.status(500).json({
                            error: err
                        });
                    } else {
                        const phi = new Phi({
                            _id: new mongoose.Types.ObjectId(),
                            fname: req.body.fname,
                            lname: req.body.lname,
                            nic: req.body.nic,
                            email: req.body.email,
                            phone: req.body.phone,
                            address: req.body.address,
                            location: req.body.location,
                            image: req.body.image,
                            password: hash
                        });
                        phi.save()
                            .then(result => {
                                console.log(result);
                                res.status(201).json({
                                    message: "Sign up Sucessfully",
                                    createdUser: result
                                });

                            })
                            .catch(err => {
                                console.log(err);
                                res.status(500).json({
                                    error: err
                                });
                            })
                    }
                })

            }
        })
});

//login PHI
router.post('/philogin', async(req, res) => {
    const phi = await Phi.findOne({ email: req.body.email });
    if (!phi) return res.status(400).send({ message: 'Email does Not Exist' });

    const validPass = await bcrypt.compare(req.body.password, phi.password);

    if (!validPass) return res.status(400).send({ message: 'Password is Wrong' });

    const token = jwt.sign({ _id: phi._id }, process.env.JWT_KEY);


    res.header('auth-token').send({
        id: phi._id,
        fname: phi.fname,
        lname: phi.lname,
        email: phi.email,
        phone: phi.phone,
        nic: phi.nic,
        image: phi.image,
        token: token,
        message: phi.fname,
    });
});

//citizen signup route 
router.post('/citizen/signup', (req, res, next) => {
    Citizen.find({ email: req.body.email })
        .exec()
        .then(citizen => { //check if the email is allready taken
            if (citizen.length >= 1) {
                return res.status(409).json({
                    message: 'Email Allready taken. '
                });
            } else {
                bcrypt.hash(req.body.password, 10, (err, hash) => { //hash the password using bcrypt
                    if (err) {
                        return res.status(500).json({
                            error: err
                        });
                    } else {
                        const citizen = new Citizen({
                            _id: new mongoose.Types.ObjectId(),
                            fname: req.body.fname,
                            lname: req.body.lname,
                            nic: req.body.nic,
                            age: req.body.age,
                            email: req.body.email,
                            phone: req.body.phone,
                            address: req.body.address,
                            location: req.body.location,
                            affilication: req.body.affilication,
                            profeson: req.body.profeson,
                            image: req.body.image,
                            date: req.body.date,
                            test: req.body.test,
                            results: req.body.results,
                            password: hash
                        });
                        citizen.save()
                            .then(result => {
                                console.log(result);
                                res.status(201).json({
                                    message: "Sign up Sucessfully",
                                    createdUser: result
                                });

                            })
                            .catch(err => {
                                console.log(err);
                                res.status(500).json({
                                    error: err
                                });
                            })
                    }
                })

            }
        })
});

//login Citizen
router.post('/citizenlogin', async(req, res) => {
    const citizen = await Citizen.findOne({ email: req.body.email });
    if (!citizen) return res.status(400).send({ message: 'Email does Not Exist' });

    const validPass = await bcrypt.compare(req.body.password, citizen.password);

    if (!validPass) return res.status(400).send({ message: 'Password is Wrong' });

    const token = jwt.sign({ _id: citizen._id }, process.env.JWT_KEY);


    res.header('auth-token').send({
        id: citizen._id,
        fname: citizen.fname,
        email: citizen.email,
        nic: citizen.nic,
        image: citizen.image,
        token: token,
        lname: citizen.lname,
        phone: citizen.phone,
        age: citizen.age,
        affilication: citizen.affilication,
        profeson: citizen.profeson,
        address: citizen.address,
        message: citizen.fname,
        status: citizen.status
    });
});


//update phi 
router.put("/updatePhi", async(req, res, next) => {
    const hashPass = await bcrypt.hash(req.body.password, 10); //hash the password using bcrypt


    try {
        const phi = await Phi.findByIdAndUpdate({ _id: req.body.id }, {
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            phone: req.body.phone,
            password: hashPass,

        }, {
            new: true,
            useFindAndModify: false,
            upsert: true
        })

        res.json(phi).status(200)
    } catch (e) {
        next(e)
    }
})

//update citizen 
router.put("/updateCitizen", async(req, res, next) => {
    const hashPass = await bcrypt.hash(req.body.password, 10); //hash the password using bcrypt


    try {
        const citizen = await Citizen.findByIdAndUpdate({ _id: req.body.id }, {
            fname: req.body.fname,
            lname: req.body.lname,
            age: req.body.age,
            email: req.body.email,
            phone: req.body.phone,
            affilication: req.body.affilication,
            profeson: req.body.profeson,
            image: req.body.image,
            password: hashPass

        }, {
            new: true,
            useFindAndModify: false,
            upsert: true
        })

        res.json(citizen).status(200)
    } catch (e) {
        next(e)
    }
});


// add the admin
router.post('/addAdmin', (req, res, next) => {
    Admin.find({ email: req.body.email })
        .exec()
        .then(admin => { //check if the email is allready taken
            if (admin.length >= 1) {
                return res.status(409).json({
                    message: 'Email Already Taken. '
                });
            } else {
                bcrypt.hash("12345678", 10, (err, hash) => { //hash the password using bcrypt
                    if (err) {
                        return res.status(500).json({
                            error: err
                        });
                    } else {
                        const admin = new Admin({
                            _id: new mongoose.Types.ObjectId(), //create id in mongodb 
                            email: "admin@helth.lk",
                            password: hash,
                            type: req.body.type,
                        });
                        admin.save()
                            .then(result => {
                                console.log(result);
                                res.status(201).json({
                                    message: "Admin Added Successfully!!",
                                    createdAdmin: result
                                });

                            })
                            .catch(err => {
                                console.log(err);
                                res.status(500).json({
                                    error: err
                                });
                            })
                    }
                })

            }
        })
});

//login Admin
router.post('/adminlogin', async(req, res) => {
    const admin = await Admin.findOne({ email: req.body.email });
    if (!admin) return res.status(400).send({ message: 'Email does Not Exist' });

    const validPass = await bcrypt.compare(req.body.password, admin.password);

    if (!validPass) return res.status(400).send({ message: 'Password is Wrong' });

    const token = jwt.sign({ _id: admin._id }, process.env.JWT_KEY);


    res.header('auth-token').send({
        id: admin._id,
        email: admin.email,
        token: token
    });
});
module.exports = router;