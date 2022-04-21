const mysql = require('mysql');

const dbConnection = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        password: "",
        database: "donteur"
    }
);

dbConnection.connect((error) => {
        if (error) {
            throw error;
        }
        else {
            console.log("Database Connected Successfully!");
        }
    }
);

module.exports = dbConnection;