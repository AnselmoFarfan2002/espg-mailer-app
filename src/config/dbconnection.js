const mysql = require('mysql2');

const mysqlConnection = mysql.createConnection( require('./dbconfig') );

mysqlConnection.connect( err => {
    if(err) console.log(err);
    else console.log('Base de datos conectada');
} )

module.exports = mysqlConnection;