const { DataTypes, Model } = require('sequelize');

const PROTECTED_ATTRIBUTES = ['password']

// We export a function that defines the model.
// This function will automatically receive as parameter the Sequelize connection object.


class User extends Model {
    toJSON() {
        // hide protected fields
        let attributes = Object.assign({}, this.get())
        for (let a of PROTECTED_ATTRIBUTES) {
            delete attributes[a]
        }
        return attributes
    }
}


module.exports = (sequelize) => {
    User.init({

        // The following specification of the 'id' attribute could be omitted
        // since it is the default.
        username: {
            allowNull: false,
            type: DataTypes.STRING(36),
            unique: true,
            set() {
                return
            }
        },
        name: {
            allowNull: false,
            type: DataTypes.TEXT
        },
        phone: {
            allowNull: false,
            type: DataTypes.STRING(20)
        },
        email: {
            allowNull: false,
            type: DataTypes.TEXT,
        },
        created_at: {
            type: DataTypes.DATE
        },
        username: {
            allowNull: false,
            type: DataTypes.TEXT,
        },
        password: {
            allowNull: false,
            type: DataTypes.TEXT
        },
        rate: {
            allowNull: true,
            type: DataTypes.REAL,
        },
        languages: {
            allowNull: false,
            type: DataTypes.JSON,
        },
        picture: {
            allowNull: true,
            type: DataTypes.TEXT,
        }
    },
        {
            sequelize,
            tableName: "user",
            createdAt: "created_at",
            updatedAt: false,
            modelName: 'user'
        })

};