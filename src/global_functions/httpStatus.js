const http = {
    "500": {log: "Error interno del servidor", status: 500},
    "400": {log: "Solicitud incorrecta", status: 400},
    "404": {log: "Recurso no encontrado", status: 404},
    "409": {log: "Recurso ya existente", status: 409},
    "206": {log: "Parcialmente aceptado", status: 206},
    "200": {log: "OK", status: 200},
    send: (http, res) => {res.status(http.status).send(http.log)}
}

module.exports = http;