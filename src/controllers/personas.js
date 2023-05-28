const LINKS = require("../global_functions/linksGenerator");
const PERSONA = require("../services/personas");

const CTRLS_PERSONA = {};

const manyPrepareNsend = (req, res, personas) => {
    personas.forEach( persona => {
        persona.links = [
            LINKS.src('self', 'personas', persona.id)
        ]
    })

    res.send({
        listaPersonas : personas,
        links: [
            LINKS.query('self', 'personas', req.query)
        ]
    })
}

CTRLS_PERSONA.listarVarios = (req, res) => {
    if(!req.query.nombre) { req.query.nombre = '';}

    if(!req.query.tipo) 
        PERSONA.filtrarPorNombre(req.query.nombre)
        .then( personas => manyPrepareNsend(req, res, personas) )
        .catch( failure => res.status(failure.status).send(failure.log) );

    else if( 'docente'.match(new RegExp(`^${req.query.tipo}`) )) 
        PERSONA.filtrarDocentesPorNombre(req.query.nombre)
        .then( personas => manyPrepareNsend(req, res, personas) )
        .catch( failure => res.status(failure.status).send(failure.log) );

    else res.status(400).send('tipo de persona no admitido');
}

CTRLS_PERSONA.listarUno = (req, res) => {
    if( !isNaN( req.params.id ) )
        PERSONA.listarUno(req.params.id)
        .then( persona => {
            res.status(201).send({
                persona,
                links: [
                    LINKS.src('self', 'personas', persona.id)
                ]
            });
        }).catch( failure => res.send(failure) );
    else res.sendStatus(400);
}

CTRLS_PERSONA.registrarEstudiantes = (req, res) => {
    PERSONA.registrarEstudiantes(req.body)
    .then( A => res.sendStatus(201) )
    .catch( A => res.sendStatus(500) )
}

CTRLS_PERSONA.registrarDocentes = (req, res) => {
    PERSONA.registrarDocentes(req.body)
    .then( A => res.sendStatus(201) )
    .catch( A => res.sendStatus(500) )
}

module.exports = CTRLS_PERSONA;