const express = require('express');
const app = express();
const mongoose = require('mongoose');
let multer = require('multer');
const port = process.env.PORT || 8000;
cors = require('cors')
const corsOptions = {
    origin: true,
    credentials: true
};

app.options('*', cors(corsOptions));
//set access to all  connect to this api
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, Origin, Content-Type, Accept, Authorization');
    if (req.method === 'OPTIONS') {
        Response.header('Access-Control-Allow-Methods', 'PUT, POST, DELETE, GET');
        return res.status(200).json({});
    }
    next();
});

require('dotenv').config()

//connect to db
mongoose.connect(
    process.env.DATABASE_URL, { useNewUrlParser: true, useUnifiedTopology: true },
    () => console.log('Connected to db'));

//middleware
app.use(express.json());


const authRouter = require('./routes/auth');
const citizenRoute = require('./routes/citizen');
const phiRoute = require('./routes/phi');
const contactRoute = require('./routes/contact');
const placeRoute = require('./routes/visit');


app.use('/auth', authRouter);
app.use('/citizen', citizenRoute);
app.use('/phi', phiRoute);
app.use('/contact', contactRoute);
app.use('/place', placeRoute);



app.listen(port, () => {
    console.log("App is running on port " + port);
});