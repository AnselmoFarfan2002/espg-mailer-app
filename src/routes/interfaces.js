const { Router } = require('express');
const CTRLS_OPCIONES = require('../controllers/opciones');
const router = Router();

router.route('/opciones/:source')
.get( CTRLS_OPCIONES.listar );

router.route('/gui/programas/:id/cursos')
.get( (req, res) => res.render('pug/panel.cursos.pug', { ...req.query, ...req.params }) );

router.route('/gui/programas')
.get( (req, res) => res.render('pug/panel.programas.pug') );

router.route('/gui/personas')
.get( (req, res) => res.render('pug/panel.personas.pug') );

router.route('/gui/mailer')
.get( (req, res) => res.render('pug/panel.correos.pug') );

router.route('/gui/cursos/:id/matriculados')
.get( (req, res) => res.render('pug/panel.matriculados.pug', { ...req.query, ...req.params }) );

router.route('*')
.get( (req, res) => res.redirect('/gui/programas') );

module.exports = router;