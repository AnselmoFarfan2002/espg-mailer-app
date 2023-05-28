const express = require('express')
const app = express();

app.use(require('./programas'));
app.use(require('./cursos'));
app.use(require('./personas'));
app.use(require('./interfaces'));

module.exports = app;