import express from 'express'
import morgan from 'morgan'
import propertiesRoutes from './routes/properties';
import indexRouter from './routes/index';
import usersRouter from './routes/users';


const app = express();


app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/properties', propertiesRoutes);



module.exports = app;

