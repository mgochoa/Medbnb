
const { DataTypes, Model, Sequelize } = require('sequelize');



class Property extends Model { }

module.exports = (sequelize) => {
    Property.init({
        id: {
            allowNull: false,
            type: DataTypes.UUIDV4,
            defaultValue: Sequelize.UUIDV4,
            primaryKey: true,
            unique: true,
        },
        status: {
            allowNull: false,
            type: DataTypes.STRING,
            unique: true,
        },
        location: {
            allowNull: false,
            type: DataTypes.GEOMETRY("POINT")
        },
        amenities: {
            allowNull: false,
            type: DataTypes.JSON,
        },
        photos: {
            allowNull: false,
            type: DataTypes.JSON,
        },
        owner: {
            allowNull: false,
            type: DataTypes.UUIDV4,
        },
        max_guests: {
            allowNull: true,
            type: DataTypes.INTEGER, //hace parte de amenities? 
        },
        beds: {
            allowNull: false,
            type: DataTypes.JSON,
        },
        description: {
            allowNull: true,
            type: DataTypes.TEXT,

        },
    },
        {
            sequelize,
            tableName: "property",
            createdAt: false,
            updatedAt: false,
            modelName: 'property'
        })

}










