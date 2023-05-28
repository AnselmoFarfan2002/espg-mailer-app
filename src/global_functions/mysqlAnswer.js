const http = require("./httpStatus");

const mySQLanswer = {};

mySQLanswer.listado = (err, gotten, cs, cf) => {
    if(err) {
        console.log(err.sqlMessage);
        cf(http["500"]);
    } else {
        if( gotten[0].length == 0 ) cf(http["404"]);
        else cs(gotten[0]);
    }
}

mySQLanswer.existencia = (err, gotten, cs, cf, attr = "exists") => {
    if(err) {
        console.log(err.sqlMessage);
        cf(http["500"]);
    } else {
        if( gotten[0][attr] == 0 ) cf(http["404"]);
        else cs(gotten[0][attr]);
    }
}


mySQLanswer.registro = (err, gotten, cs, cf, attr = "status", anything) => {
    if(anything) console.log(anything);
    
    if(err) {
        console.log(err.sqlMessage);
        cf(http["500"]);
    } else {
        if( gotten[0][attr] == 0 ) cf(http["409"]);
        else cs();
    }
}

mySQLanswer.errorHandle = (err, cs, cf) => {
    if(err) {
        console.log(err.sqlMessage);
        cf(http["500"]);
    } else cs(http["200"]);
}

module.exports = mySQLanswer;