const {Router} = require('express');
const CTRLS_PERSONA = require('../controllers/personas');
const router = Router();

router.route( '/personas' )
.get( CTRLS_PERSONA.listarVarios );

router.route( '/docentes' )
.post( CTRLS_PERSONA.registrarDocentes );

router.route( '/estudiantes' )
.post( CTRLS_PERSONA.registrarEstudiantes );

router.route( '/personas/:id' )
.get( CTRLS_PERSONA.listarUno );

module.exports = router;