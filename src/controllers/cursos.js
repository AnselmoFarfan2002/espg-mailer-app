const CTRLS_CURSO = {};

const LINKS = require('../global_functions/linksGenerator');
const CURSO = require('../services/cursos');

const ENVIA_CURSOS = (res, cursos) => {
    cursos.forEach( curso => {
        curso.links = [
            LINKS.src('self', 'cursos', curso.id), 
            LINKS.src('docente', 'personas', curso.idDocente), 
            LINKS.subSrc('matriculados', 'cursos', curso.id, 'matriculados')
        ];

        delete curso.idDocente;
    });

    res.send( {
        listaCursos: cursos,
        links: [
            LINKS.src('self', 'cursos')
        ]
    } )
}

CTRLS_CURSO.listarVarios = (req, res) => {
    if( req.query.inicio ) {
        let {inicio, fin} = req.query;
        [inicio, fin] = [new Date(inicio), new Date(fin)];

        CURSO.filtrarPorFechas( inicio, fin )
        .then( cursos => ENVIA_CURSOS(res, cursos))
        .catch( failure => res.status(failure.status).send(failure.log) );
    } 
    else if( req.query.open == 'false' )
        CURSO.listarNombres()
        .then( cursos => {
            res.send({
                listaCursos : cursos,
                links: [
                    LINKS.src('self', 'cursos?open=false')
                ]
            })
        })
        .catch( failure => res.status( failure.status ).send( failure.log ) )
    else 
        CURSO.listarTodos()
        .then( cursos => ENVIA_CURSOS(res, cursos))
        .catch( failure => res.status(failure.status).send(failure.log) );        
}

CTRLS_CURSO.listarUno = (req, res) => {
    CURSO.listarUno( req.params.id )
    .then( curso => {
        let idDocente = curso[0].idDocente;
        delete curso[0].idDocente;
        
        res.send( {
            listaCursos: curso,
            links: [
                LINKS.src('self', 'cursos', curso[0].id),
                LINKS.src('docente', 'personas', idDocente), 
                LINKS.subSrc('matriculados', 'cursos', req.params.id, 'matriculados'),
            ]
        } )
    })
    .catch( failure => res.status(failure.status).send(failure.log) )
}

CTRLS_CURSO.listarMatriculados = (req, res) => {
    CURSO.listarMatriculados( req.params.id )
    .then( personas => {
        res.send({
            listaMatriculados: personas.map( persona => {
                return {
                    ...persona, 
                    links: [
                        LINKS.src('self', 'personas', persona.id)
                    ]
                }
            }),
            links: [
                LINKS.subSrc('self', 'cursos', req.params.id, 'matriculados'),
                LINKS.src('cursos', 'cursos')
            ]
        })
    })
    .catch( failure => res.status(failure.status).send(failure.log) )
}

CTRLS_CURSO.registrarUno = (req, res) => {
    CURSO.registrarUno(req.body)
    .then( curso => {
        delete curso.idDocente;
        res.send( {
            ...curso,
            links: [
                LINKS.src('self', 'cursos', '', 'POST')
            ]
        } )
    }).catch( failure => res.status(failure.status).send(failure.log) )
}

CTRLS_CURSO.matricular = (req, res) => {
    req.body.codigos = req.body.codigos.split('\n');

    CURSO.matricularVarios(req.params.id, req.body.codigos)
    .then( noEncontrados => {
        noEncontrados = noEncontrados[0] != '' ? noEncontrados : [];
        res.status( noEncontrados.length ? 206 : 201 ).send({
            rechazados: noEncontrados,
            links: [
                LINKS.subSrc('self','cursos',req.params.id,'matriculados','POST')
            ]
        });
    } )
}

CTRLS_CURSO.editarFechas = (req, res) => {
    CURSO.editarFechas({...req.params, ...req.body})
    .then( httpRes => res.redirect(req.headers.referer) )
    .catch( httpRes => http.send(httpRes, res) )
}

CTRLS_CURSO.editarDocente = (req, res) => {
    CURSO.editarDocente({...req.params, ...req.body})
    .then( httpRes => res.redirect(req.headers.referer) )
    .catch( httpRes => http.send(httpRes, res) )
}

module.exports = CTRLS_CURSO;