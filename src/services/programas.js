const mysqlConnection = require("../config/dbconnection");
const http = require("../global_functions/httpStatus");
const mysqlAnswer = require("../global_functions/mysqlAnswer");

const PROGRAMA = {};

PROGRAMA.listarNombres = () => new Promise((rs, rj) => {
    mysqlConnection.query('call listarProgramas',
        (err, res) => mysqlAnswer.listado(err, res, rs, rj)
    );
})

PROGRAMA.aperturarSeccion = seccion => new Promise((resolve, reject) => {
    let query = mysqlConnection.format('select aperturarSeccion(?, ?, ?, ?, ?) as status', 
    [ seccion.programa, seccion.nombre, seccion.correo, seccion.contrasenia, seccion.aula ]);

    mysqlConnection.query( query, (err, rows) => mysqlAnswer.registro(err, rows, resolve, reject));
});

/*
    PA: programa aperturado
*/
PROGRAMA.aperturarPrograma = PA => new Promise((rs, rj) => {
    mysqlConnection.beginTransaction( () => {
        mysqlConnection.query('select aperturarPrograma(?, ?) as idPrograma', [PA.programa, PA.admision],
            (err, res) => new Promise((resolve, reject) => {
                if( err ) reject([err, '500'])
                else if( res[0].idPrograma == 0 ) reject([null, '409']);  
                else resolve( res[0].idPrograma ); 
            }).then( idPrograma => { 
                Promise.all(
                    PA.secciones.map( seccion => {
                        seccion.programa = idPrograma;
                        return PROGRAMA.aperturarSeccion(seccion);
                    })                    
                ).then( success => mysqlConnection.commit( () => {
                    PA.secciones.forEach( (s, i) => {delete s.idPrograma; s.id = success[i]});
                    PA.id = idPrograma;
                    
                    rs(PA);
                }))
                .catch( failure => { mysqlConnection.rollback( () => rj(failure) ) } )
            }).catch( ([err, code]) => { console.log(err, code); mysqlConnection.rollback( () => rj(http[code]) ) })
        );
    });
})

PROGRAMA.listarTodos = () => new Promise((resolve, reject) => {
    mysqlConnection.query('call listarProgramasAperturados', 
    (err, res) => new Promise((rs, rj) => mysqlAnswer.listado(err, res, rs, rj))
    .then( programas => {
        Promise.all( 
            programas.map( programa => new Promise((rs, rj) => {
                mysqlConnection.query(`call listarSeccionesDe(?)`, programa.id,
                (err, res) => mysqlAnswer.listado(err, res, rs, rj))
            }))
        ).then( secciones => {
            Promise.all( 
                programas.map( (programa, i) => new Promise((rs, rj) => {
                    programa.secciones = secciones[i];
                    rs(programa);
                }) )
            ).then( programas => resolve(programas) )
            .catch( () => reject(http["500"]));
        }).catch( failure => reject(failure) );
    }));
})

PROGRAMA.listarCursos = idPrograma => new Promise((rs, rj) => {
    mysqlConnection.query('call listarCursosDictadosEn(?)', idPrograma,
        (err, res) => new Promise((resolve, reject) => mysqlAnswer.listado(err, res, resolve, reject))
        .then( cursos => {
            Promise.all(
                cursos.map( curso => new Promise((resolve, reject) => {
                    mysqlConnection.query('SELECT COUNT(ID) as cantidad FROM MATRICULA WHERE CURSO_AP = ?', curso.id, 
                    (err, res) => { if(err) reject(http["500"]); else resolve(res[0].cantidad) })
                }))
            ).then( cantidades => {
                cantidades.forEach((c, i) => cursos[i].matriculados = c );
                rs(cursos);
            }).catch(failure => rj(failure));
        }).catch( err => {console.log(err); rj(http["500"])} )
    );
})

PROGRAMA.listarMalla = idPrograma => new Promise((rs, rj) => {
    mysqlConnection.query('call listarMallaCurricularDe(?)', idPrograma,
        (err, res) => mysqlAnswer.listado(err, res, rs, rj)
    );
})

PROGRAMA.listarUno = idPrograma => new Promise((rs, rj) => {
    mysqlConnection.query('call listarProgramaAperturado(?)', idPrograma,
    (err, res) => new Promise((rs, rj) => mysqlAnswer.listado(err, res, rs, rj))
    .then( programa => {
        programa = programa[0];

        (new Promise((rs, rj) => {
            mysqlConnection.query(`call listarSeccionesDe(?)`, programa.id, 
                (err, res) => mysqlAnswer.listado(err, res, rs, rj))
            })
        ).then( secciones => rs({...programa, secciones}))
        .catch( failure => rj(failure) );
    }).catch( failure => rj(failure) ));
})

PROGRAMA.editarSeccion = seccion => new Promise((resolve, reject) => {
    const {id, nombre, correo, contrasenia, aula} = seccion;
    mysqlConnection.query(
        'call editarSeccion(?,?,?,?,?)', 
        [id, nombre, correo, contrasenia, aula], 
        (err,rows) => mysqlAnswer.errorHandle(err, resolve, reject)
    )
})

module.exports = PROGRAMA;