const { Router } = require('express');
const CTRLS_CURSO = require('../controllers/cursos');
const router = Router();

router.route('/cursos')
.get( CTRLS_CURSO.listarVarios )
.post( CTRLS_CURSO.registrarUno );

router.route('/cursos/:id')
.get( CTRLS_CURSO.listarUno );

router.route('/cursos/:id/matriculados')
.get( CTRLS_CURSO.listarMatriculados )
.post( CTRLS_CURSO.matricular );

router.route('/cursos/:id/fechas')
.post( CTRLS_CURSO.editarFechas )

router.route('/cursos/:id/docente')
.post( CTRLS_CURSO.editarDocente );

module.exports = router;