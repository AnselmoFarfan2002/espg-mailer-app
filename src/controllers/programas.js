const http = require("../global_functions/httpStatus");
const LINKS = require("../global_functions/linksGenerator");
const PROGRAMA = require("../services/programas");

const CTRLS_PROGRAMA = {};

CTRLS_PROGRAMA.listar = (req, res) => {
    PROGRAMA.listarTodos()
    .then( programas => {
        programas.forEach( programa => {
            programa.links = [
                LINKS.src('self', 'programas', programa.id),
                LINKS.subSrc('cursos', 'programas', programa.id, 'cursos')
            ]
        })

        res.send({
            listaProgramas : programas,
            links: [
                LINKS.src('self', 'programas'),
                LINKS.src('nuevo', 'programas', '', 'POST')
            ]
        })
    })
    .catch( failure => res.status( failure.status ).send( failure.log ) )
}

CTRLS_PROGRAMA.listarUno = (req, res) => {
    PROGRAMA.listarUno(req.params.id)
    .then( programa => {
        res.send({
            ...programa,
            links: [
                LINKS.src('self', 'programas', programa.id),
                LINKS.subSrc('cursos', 'programas', programa.id, 'cursos'),
                LINKS.src('programas', 'programas')
            ]
        })
    })
    .catch( failure => res.status( failure.status ).send( failure.log ) )
}

CTRLS_PROGRAMA.listarCursos = (req, res) => {
    PROGRAMA.listarCursos(req.params.id)
    .then( cursos => {
        cursos.forEach( curso => {
            curso.links = [
                LINKS.src('self', 'cursos', curso.id)
            ]
        })

        res.send({
            listaCursos : cursos,
            links: [
                LINKS.subSrc('self', 'programas', req.params.id, 'cursos'),
                LINKS.src('programa', 'programas', req.params.id)
            ]
        })
    })
    .catch( failure => res.status( failure.status ).send( failure.log ) )
}

CTRLS_PROGRAMA.crear = (req, res) =>{
    PROGRAMA.aperturarPrograma( req.body )
    .then( programaAperturado => {
        res.send({
            ...programaAperturado,
            links: [
                LINKS.src('self', 'programas', programaAperturado.id)
            ]
        })
    }).catch( failure => res.status( failure.status ).send( failure.log ) )
}

CTRLS_PROGRAMA.editar = (req, res) => {
    let seccion = {...req.body, ...req.params};
    
    PROGRAMA.editarSeccion(seccion)
    .then( httpRes => res.redirect(req.headers.referer) )
    .catch( httpRes => http.send(httpRes, res) )
}


module.exports =CTRLS_PROGRAMA;
