const LINKS = require("../global_functions/linksGenerator");
const ADMISION = require("../services/admision");
const CURSO = require("../services/cursos");
const PROGRAMA = require("../services/programas");

const CTRLS_OPCIONES = {};

const opciones = {
    "programas": PROGRAMA.listarNombres,
    "cursos": CURSO.listarNombres,
    "admision": ADMISION.listarNombres,
    "malla": PROGRAMA.listarMalla
};

CTRLS_OPCIONES.listar = (req, res) => {
    if( opciones[req.params.source] != undefined )
        opciones[req.params.source]((req.query.id ? req.query.id : ''))
        .then( opciones => {
            res.send({
                listaOpciones: opciones,
                links: [
                    LINKS.src('self', 'opciones/' + req.params.source)
                ]
            })
        })
        .catch( failure => res.status( failure.status ).send( failure.log ) );
    else res.status( 400 ).send( 'Recurso especificado no hallado.' )
}

module.exports = CTRLS_OPCIONES;