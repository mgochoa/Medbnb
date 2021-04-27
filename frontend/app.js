import express from 'express'
import morgan from 'morgan'

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
//var propertiesRouter = require('./routes/properties');


const PORT = 3000


var app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/', indexRouter);
app.use('/users', usersRouter);

//app.use('/properties', propertiesRouter)


module.exports = app;

