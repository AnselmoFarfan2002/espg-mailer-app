require('dotenv').config();

const express = require('express');
const morgan = require('morgan');
const pug = require('pug');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser')

//settings
app.set( 'view engine', 'pug' );

//middlewares
app.use( express.json() )
app.use( bodyParser.urlencoded({extended: false}) )
app.use( morgan('dev') )
app.use( cors({origin: '*'}) )

//views and routes
app.use( express.static('views') )
app.use( require('./routes/route.index.js') )

//settings
app.set('port', process.env.PORT || 777)
app.set('view engine', 'pug') 

app.listen( app.get('port'), () => {
    console.log("It's alive!! Find us on", app.get('port'))
})