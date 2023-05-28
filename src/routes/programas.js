const { Router } = require('express');
const CTRLS_PROGRAMA = require('../controllers/programas');
const router = Router();

router.route('/programas')
.get( CTRLS_PROGRAMA.listar )
.post( CTRLS_PROGRAMA.crear );

router.route('/programas/:id/cursos')
.get( CTRLS_PROGRAMA.listarCursos );

router.route('/programas/:id')
.get( CTRLS_PROGRAMA.listarUno );

router.route('/secciones/:id')
.post( CTRLS_PROGRAMA.editar );

module.exports = router;
