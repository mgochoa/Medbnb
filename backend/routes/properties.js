const express = require('express');
const router = express.Router();
//const Post = require('../models/property.model')
const { models } = require('../sequelize');
const { property } = models;

router.get('/', async (req, res, next) => {

    const properties = await property.findAll();

    res.status(200).json(properties);

})


router.post('/', async (req, res, next) => {


    const inCommingProperty = req.body;

    try {
        const newProperty = await property.create(inCommingProperty);

        //console.log(req.body);

        res.status(201).json(newProperty);

    } catch (err) {

        res.status(400).json({ message: "Bad request" })

    }

});


module.exports = router;
