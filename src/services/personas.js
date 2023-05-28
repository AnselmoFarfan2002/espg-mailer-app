const mysqlConnection = require('../config/dbconnection');
const http = require('../global_functions/httpStatus');
const mySQLanswer = require('../global_functions/mysqlAnswer');
const PERSONA = {};

PERSONA.obtenerCorreoDe = id => new Promise((resolve, reject) => {
    mysqlConnection.query('call obtenerCorreoDe(?)', id, (err, res) => {
        if(err){ 
            console.log(err.sqlMessage);
            reject({log:'Cayó la base de datos al obtener el recurso', status: 500});
        } else  {
            resolve(res[0].map( a => a.DIRECCION ));
        }
    })
})

PERSONA.listarUno = id => new Promise((resolve, reject) => {
    mysqlConnection.query('call listarPersona(?)', id, (err, res) => {
        if(err){ 
            console.log(err.sqlMessage);
            reject({log:'Cayó la base de datos al obtener al docente', status: 500});
        } else  {
            if( res[0].length == 0 ) reject({log:'No se encontró la persona', status: 404});
            else {
                PERSONA.obtenerCorreoDe(id)
                .then( correos => {
                    res[0][0].correos = correos;
                    resolve(res[0][0]);
                }).catch( failure => reject(failure) );
            }
        }
    })
})

PERSONA.filtrarPorNombre = nombre => new Promise((resolve, reject) => {
    mysqlConnection.query('call filtrarPersonasPorNombre(?)', nombre, 
        (err, res) => new Promise((resolve, reject) => mySQLanswer.listado(err, res, resolve, reject))
        .then( personas => {
            Promise.all( personas.map( p => PERSONA.obtenerCorreoDe(p.id) ))
            .then( listaDeCorreos => {
                listaDeCorreos.forEach( (correos, i) => personas[i].correos = correos );
                resolve(personas);
            }).catch( failureOnEmails => reject(failureOnEmails) );
        })
        .catch( failureOnPeople => reject(failureOnPeople) )
    );
})

PERSONA.filtrarDocentesPorNombre = nombre => new Promise((resolve, reject) => {
    mysqlConnection.query('call filtrarDocentesPorNombre(?)', nombre, 
        (err, res) => new Promise((resolve, reject) => mySQLanswer.listado(err, res, resolve, reject))
        .then( personas => {
            Promise.all( personas.map( p => PERSONA.obtenerCorreoDe(p.id) ))
            .then( listaDeCorreos => {
                listaDeCorreos.forEach( (correos, i) => personas[i].correos = correos );
                resolve(personas);
            }).catch( failureOnEmails => reject(failureOnEmails) );
        })
        .catch( failureOnPeople => reject(failureOnPeople) )
    );
})

PERSONA.registrarEstudiantes = estudiantes => new Promise( (resolve, reject) =>{
    mysqlConnection.beginTransaction( () => {
        Promise.all( estudiantes.map(estudiante => new Promise((resolve, reject) => {
            mysqlConnection.query('select registrarEstudiante(?,?,?) as status', estudiante, (err, rows) => {
                mySQLanswer.registro(err, rows, resolve, reject, estudiante);
            })
        }))).then( res => mysqlConnection.commit( () => resolve(http['201']) ) )
        .catch( err => {
            console.log(err);
            mysqlConnection.rollback( () => reject(http['500']) ) 
        })
    })
})

PERSONA.registrarDocentes = docentes => new Promise( (resolve, reject) =>{
    mysqlConnection.beginTransaction( () => {
        Promise.all( docentes.map(docente => new Promise((resolve, reject) => {
            mysqlConnection.query('select registrarDocente(?,?,?) as status', docente, (err, rows) => {
                mySQLanswer.registro(err, rows, resolve, reject, docente);
            })
        }))).then( res => mysqlConnection.commit( () => resolve(http['201']) ) )
        .catch( err => {
            console.log(err);
            mysqlConnection.rollback( () => reject(http['500']) ) 
        })
    })
})


module.exports = PERSONA;