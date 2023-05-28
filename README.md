# espg-mailer-app
Una aplicación que facilitó el proceso de envío de correos en la espg, UNJBG

Requisitos:
- Necesario NodeJS v14+
- MySQL server v8+ (en algún ordenador de la red)
- Correr el fichero 'db_empty.sql' (crea la base de datos a utilizar)

Configuraciones: (.env)
- PORT: puerto de aplicación (por defecto, 80)
- DIR_SERVIDOR: IP del ordenador donde corre la app (por defecto, 'http://localhost')
- DB_HOST: ip del ordenador que hostea la base de datos (por defecto, localhost)
- DB_PORT: puerto de la base de datos (por defecto, 3306)
- DB_USER: nombre de usuario en la base de datos (por defecto, root)
- DB_PASSWORD: contraseña de usuario en la base de datos (por defecto, 123123)
- DB_DATABASE: nombre de la base de datos, (por defecto, 'espg_mailer' - el fichero sql genera la db con el nombre 'espg_mailer')

Corrida rápida (solo windows):
- Ejecutar primero el fichero 'dependencies.bat' (**instala dependencias**)
- Ejecutar fichero 'MailerApp.bat' (**inicia la aplicación**, no cerrar la shell que se abra)

Tecnologías usadas:
- JavaScript
- NodeJS
- Pug
- Bootstrap
