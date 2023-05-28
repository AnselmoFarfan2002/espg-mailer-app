const mysqlConnection = require("../config/dbconnection");
const mySQLanswer = require("../global_functions/mysqlAnswer");

const ADMISION = {};

ADMISION.listarNombres = () => new Promise((rs, rj) => {
    mysqlConnection.query('call listarAdmision',
        (err, gotten) => mySQLanswer.listado(err, gotten, rs, rj)
    );
})

module.exports = ADMISION;