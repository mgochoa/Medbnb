import { withBinaryUUID } from "sequelize-binary-uuid";

const { DataTypes, Model } = require('sequelize');

const PROTECTED_ATTRIBUTES = ['password', 'id']

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
    User.init(withBinaryUUID({

        // The following specification of the 'id' attribute could be omitted
        // since it is the default.
        username: {
            allowNull: false,
            type: DataTypes.STRING,
            unique: true,
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
            allowNull: false,
            type: DataTypes.REAL,
        },
        languages: {
            allowNull: false,
            type: DataTypes.JSON,
        },
        picture: {
            allowNull: false,
            type: DataTypes.TEXT,
        }
    },
        {
            primaryID: "id", // default
            virtualID: "uuid", // default
            field: {
                // optionally provide extra parameters to the
                // `primaryID` binary field
                primaryKey: true
                // primaryKey: true is required to make it a
                // primaryKey!
            }
        })
        , {
            sequelize,
            tableName: "user",
            createdAt: "created_at",
            updatedAt: false,
            modelName: 'user'
        })

};








