const mysqlConnection = require('../config/dbconnection');
const http = require('../global_functions/httpStatus');
const mysqlAnswer = require('../global_functions/mysqlAnswer');
const PERSONA = require('./personas');
const CURSO = {};

CURSO.listarNombres = () => new Promise((rs, rj) => {
    mysqlConnection.query('call listarCursos',
        (err, res) => mysqlAnswer.listado(err, res, rs, rj)
    );
})

CURSO.listarTodos = () => new Promise((resolve, reject) => {
    mysqlConnection.query('call listarCursosDictados', 
    (err, res) => new Promise((resolve, reject) => {
        if(err) reject({log:'Cayó la base de datos al listar cursos dictados', status: 500});
        else resolve(res[0]);
    }).then( success => resolve(success) )
    .catch( failure => reject(failure) ));
})

CURSO.filtrarPorFechas = (inicio, fin) => new Promise((resolve, reject) => {
    mysqlConnection.query('call filtrarCursoPorFecha(?,?)', [inicio,fin],
    (err, res) => new Promise((resolve, reject) => mysqlAnswer.listado(err,res, resolve,reject))
    .then( success => resolve(success) )
    .catch( failure => reject(failure) ));
})

CURSO.listarUno = id => new Promise((resolve, reject) => {
    mysqlConnection.query('call listarCursoDictado(?)', id, 
    (err, res) => new Promise((resolve, reject) => {
        if(err) {
            console.log(err.sqlMessage);
            reject({log: 'Cayó la base de datos al listar cursos dictados', status: 500});
        }
        else if(res[0].length == 0) reject({log: 'No se encontró data', status: 404});
        else resolve(res[0]);
    }).then( success => resolve(success) )
    .catch( failure => reject(failure) ));
})

CURSO.listarMatriculados = id => new Promise((resolve, reject) => {
    mysqlConnection.query('call listarMatriculados(?)', id,
    (err, res) => new Promise((resolve, reject) => {
        if(err) reject({log:'Cayó la base de datos al listar los matriculados', status: 500});
        else if(res[0].length == 0) reject({log: 'No se encontró data', status: 404});
        else resolve(res[0]);
    }).then( personas => {
        Promise.all( personas.map( persona => PERSONA.obtenerCorreoDe(persona.id) ) )
        .then( resultados => {
            resultados.forEach( (correos, i) => {
                personas[i].correos = correos;
            })

            resolve(personas);
        }).catch( failure => reject(failure) );
    })
    .catch( failure => reject(failure) ));
})

CURSO.registrarUno = CA => new Promise((resolve, reject) => {
    let { idSeccion, idDocente, idCurso, inicio, fin } = CA;
    let query = mysqlConnection.format('select aperturarCurso(?,?,?,?,?) as status', [
        idCurso, idSeccion, idDocente, inicio, fin
    ]);

    mysqlConnection.beginTransaction(() => {
        mysqlConnection.query(query, (err, res) => new Promise((rs, rj) => mysqlAnswer.registro(err,res,rs, rj))
        .then( () => { mysqlConnection.query('select max(ID) as id from CURSO_APERTURADO', (err, rows) => {
            if(err) mysqlConnection.rollback( () => reject(http["500"]) )
            else mysqlConnection.commit( () => {
                CURSO.listarUno(rows[0].id)
                .then( curso => resolve(curso[0]) )
                .catch( failure => reject(failure) );
            });
        })} ).catch( failure => reject(failure) ))
    });
})

CURSO.matricularVarios = (idCursoAperturado, codigos) => new Promise((resolve, reject) => {
    let codigosNoExistentes = [];
    
    Promise.allSettled(
        codigos.map( codigo => new Promise((resolve, reject) => {
            mysqlConnection.query('select listarEstudiantePorCodigo(?) as id', codigo, (err, res) => 
                mysqlAnswer.existencia(err, res, resolve, reject, 'id')
            );
        }))
    ).then( responses => Promise.allSettled(
        responses.map( (res, i) => new Promise((resolve, reject) => {
            if(res.status == "fulfilled") 
                mysqlConnection.query('select matricularPersona(?, ?) as status', [res.value, idCursoAperturado], (err, res) => 
                    mysqlAnswer.registro(err, res, resolve, reject, 'status')
                );
            else {
                codigosNoExistentes.push( codigos[i] );
                reject();
            }
        })))
    ).then( responses => {
        resolve(codigosNoExistentes);
    })
    .catch( err => reject(err) );
})

CURSO.editarFechas = (cronograma) => new Promise((resolve, reject) => {
    const {id, inicio, fin} = cronograma;
    console.log(cronograma)
    mysqlConnection.query(
        'call editarCursoFechas(?,?,?)', 
        [id, inicio, fin], 
        (err, rows) => mysqlAnswer.errorHandle(err, resolve, reject)
    )
})

CURSO.editarDocente = ({idDocente, id}) => new Promise((resolve, reject) => {
    console.log(idDocente, id)
    mysqlConnection.query(
        'call editarCursoDocente(?,?)', 
        [id, idDocente], 
        (err, rows) => mysqlAnswer.errorHandle(err, resolve, reject)
    )
})

module.exports = CURSO;