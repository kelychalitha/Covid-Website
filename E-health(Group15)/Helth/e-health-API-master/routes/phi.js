const express = require('express');
const router = express.Router();
const Phi = require('../model/phi');


//get all Phis
router.get("/phis", async(req, res, next) => {
    try {
        const phi = await Phi.find()
        if (phi == '') {
            return res.status(404).json({
                error: true,
                message: "No Phis Found .."
            })
        }
        res.json(phi)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }

});
// get  phi to their nic
router.get("/phi/:nic", async(req, res, next) => {
    try {
        const _nic = req.params.nic;
        const phi = await Phi.find({ nic: _nic })
        if (phi == '') {
            return res.status(404).json({
                error: true,
                message: "No report phi on that NIC .."
            })
        }
        res.json(phi)
    } catch (e) {
        res.status(500).json({
            error: true,
            message: e.message
        })
    }
});


module.exports = router;