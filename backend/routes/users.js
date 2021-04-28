import express from 'express'
const router = express.Router();
const { models, model } = require('../sequelize');
const sha1 = require('sha1');

/* GET users listing. */
router.get('/', async (req, res, next) => {

  const users = await models.user.findAll();

  res.status(200).json(users);
});


router.post('/', async (req, res, next) => {

  const user = req.body;
  console.log(user);
  //validation 

  user.password = sha1(user.password)

  const newUser = await models.user.create(user);

  res.status(201).json({ status: "Sucess", message: "New user id: "+ newUser.id })

})


router.post('/login', async (req, res, next) => {


})

router.post('/signup', async (req, res, next) => {


})

module.exports = router;
