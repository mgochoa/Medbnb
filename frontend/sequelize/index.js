const { Sequelize } = require('sequelize');
//const { applyExtraSetup } = require('./extra-setup');

// In a real app, you should keep the database connection URL as an environment variable.
// But for this example, we will just use a local SQLite database.
// const sequelize = new Sequelize(process.env.DB_CONNECTION_URL);


//TODO: 
const sequelize = new Sequelize({
	dialect: 'mysql',
	host: process.env.DB_HOST,
	port: process.env.DB_PORT || 3306,
	username: process.env.DB_USERNAME,
	password: process.env.DB_PWD,
	database: process.env.DB_NAME
});

const modelDefiners = [
	require('./models/user.model')
	// Add more models here...
	// require('./models/item'),
];

// We define all models according to their files.
for (const modelDefiner of modelDefiners) {
	modelDefiner(sequelize);
}

// We execute any extra setup after the models are defined, such as adding associations.
//applyExtraSetup(sequelize);

// We export the sequelize connection instance to be used around our app.
module.exports = sequelize;