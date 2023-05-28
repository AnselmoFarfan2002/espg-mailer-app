const today = new Date();
const nextSaturday = new Date(today.getTime() + (6 - today.getDay()) * 24 * 60 * 60 * 1000);
const nextSunday = new Date(today.getTime() + (7 - today.getDay()) * 24 * 60 * 60 * 1000);
const beforeSaturday = new Date(nextSaturday.getTime() - 7 * 24 * 60 * 60 * 1000);
const beforeSunday = new Date(nextSunday.getTime() - 7 * 24 * 60 * 60 * 1000);
var useSunday = beforeSaturday;
var useSaturday = beforeSunday;
const TABLA_CURSOS_AP = document.querySelector('#cursosAP tbody')

const typeColors = {'Inicio': 'text-danger', 'No hay clases': 'text-primary', 'Continua': 'text-dark'}

const setContinua = (element, id) => { alterType(element.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.typeMail'), 'Continua', id) }
const setInicio = (element, id) => { alterType(element.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.typeMail'), 'Inicio', id) }
const setNoClases = (element, id) => { alterType(element.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.typeMail'), 'No hay clases', id) }

const alterType = (box, tipo, id) => { 
    box.classList.remove(typeColors[box.innerHTML]); 
    box.innerHTML = tipo;  box.classList.add(typeColors[tipo]);
    box.parentNode.querySelector('.triggerTemplate').setAttribute('data-bs-target','#template-'+tipo.split(' ')[0]) 

    let curso = CURSOS.find(e => e.id == id)
    curso.tipoCorreo = tipo;
}

const loadModal = (element, mail) => {
    fetch(mail.links[2].href)
    .then(res => res.json())
    .then(({listaMatriculados}) => {
        destinatarios = 'jhuapaya@unjbg.edu.pe;   ';
        destinatarios += listaMatriculados.map(m => m.correos.join(';')).join('; ');
        element.parentNode.querySelectorAll('.destinatarios').forEach(c => c.innerHTML = destinatarios);
    });
    
    element.querySelectorAll('semestre').forEach(c => c.innerHTML = 'Semestre ' + mail.semestre);
    element.querySelectorAll('admision').forEach(c => c.innerHTML = 'Admisión ' + mail.admision);
    element.querySelectorAll('programa').forEach(c => c.innerHTML = mail.tipo +' en '+ mail.programa +' (Sección '+mail.seccion+')');
    element.querySelectorAll('modalidad').forEach(c => c.innerHTML = mail.aula.includes('meet.google.com') ? 'a distancia' : 'presencial');
    element.querySelectorAll('docente').forEach(c => c.innerHTML = mail.docente);
    element.querySelectorAll('curso').forEach(c => c.innerHTML = mail.curso);
    element.querySelectorAll('aula').forEach(c => c.innerHTML = mail.aula);
    element.querySelectorAll('sabado').forEach(c => c.innerHTML = useSaturday.toLocaleDateString());
    element.querySelectorAll('domingo').forEach(c => c.innerHTML = useSunday.toLocaleDateString());
}

const loadTemplate = (id) => {
    let curso = CURSOS.find(e => e.id == id)
    let template = document.querySelector('#template-' + curso.tipoCorreo.split(' ')[0]);

    loadModal(template, curso);    
}

const printCourses = (data = CURSOS) => {
    if( data.length > 0 ) {
        let fila, tipo, ntipo = ['Inicio', 'Continua'];
        TABLA_CURSOS_AP.innerHTML = '';
        data.forEach((mail, i) => {
            tipo = new Date(mail.inicio).toLocaleDateString() == useSaturday.toLocaleDateString() ? 0 : 1;
            mail.tipoCorreo = ntipo[tipo];
            fila = createElement('tr','', [{field: 'class', value: 'align-middle '}]);
            fila.append( createElement('td', mail.admision ) )
            fila.append( createElement('td', `${mail.tipo} en ${mail.programa} (Sección ${mail.seccion})` ) )
            fila.append( createElement('td', mail.docente ) )
            fila.append( createElement('td', mail.curso ) )

            fila.append( createElement('td', new Date(mail.inicio).toLocaleDateString() ) )
            fila.append( createElement('td', new Date(mail.fin).toLocaleDateString() ) )
            fila.append( createElement('td', ntipo[tipo], [{field: 'class', value: 'typeMail fw-bold ' + (tipo ? '' : 'text-danger')}] ) )

            fila.append( createElement('td', mail.aula ) )
            fila.append( createElement('td', `
                <div class="btn-group">
                    <button class="btn btn-light border triggerTemplate" onclick="loadTemplate(${mail.id})" title="Previsualizar correo" data-bs-toggle="modal" data-bs-target="#template-${ntipo[tipo]}">
                        <i class="fa-solid fa-eye"></i>
                    </button>
                    
                    <a class="btn btn-light border" title="Ver ficha de curso" href="/gui/cursos/${mail.id}/matriculados?curso=${mail.curso}&&semestre=${mail.semestre}&&admision=${mail.admision}&&programa=${mail.programa}&&seccion=${mail.seccion}">
                        <i class="fa-solid fa-file-edit" style="margin-top: 4px"></i>
                    </a>

                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle border border-start-0 rounded-0 rounded-end" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Cambiar tipo">
                            <i class="fa-solid fa-arrows-rotate"></i>
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" onclick="setInicio(this, ${mail.id})">Inicio</a></li>
                            <li><a class="dropdown-item" onclick="setContinua(this, ${mail.id})">Continua</a></li>
                            <li><a class="dropdown-item" onclick="setNoClases(this, ${mail.id})">No hay clases</a></li>
                        </ul>
                    </div>
                </div>
            `) )

            TABLA_CURSOS_AP.append(fila);
        });
    } else cargarTablaVacia(TABLA_CURSOS_AP, 9, '50vh', 'Nada pendiente.')
}

const listMails = (saturday, sunday) => {
    useSaturday = saturday;
    useSunday = sunday;
    
    document.querySelector('#fechas')
    .innerHTML = `Sábado ${useSaturday.toLocaleDateString()} - Domingo ${useSunday.toLocaleDateString()}`;

    getCursoByDate(useSunday.toJSON(), useSunday.toJSON())
    .then(printCourses)
    .catch(()=> cargarTablaVacia(TABLA_CURSOS_AP, 9, '50vh', 'Nada pendiente.'));
}

const changeWeek = (weeks, op = 1) => {
    useSaturday = new Date(nextSaturday.getTime() - 7 * weeks * op * 24 * 60 * 60 * 1000);
    useSunday = new Date(nextSunday.getTime() - 7 * weeks * op * 24 * 60 * 60 * 1000);

    listMails(useSaturday, useSunday);
}


function copyToClipBoard(element) {
    navigator.clipboard.writeText(element.innerText);
}

listMails(nextSaturday, nextSunday);
// listMails(beforeSaturday, beforeSunday);

document.querySelector('#template-No .modal-header').onclick = () => {navigator.clipboard.writeText(document.querySelector('#template-No .modal-header').innerText);}
document.querySelector('#template-No .destinatarios').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-No .destinatarios').innerText);
document.querySelector('#template-No .contenidoCorreo').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-No .contenidoCorreo').innerText);

document.querySelector('#template-Continua .modal-header').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Continua .modal-header').innerText);
document.querySelector('#template-Continua .destinatarios').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Continua .destinatarios').innerText);
document.querySelector('#template-Continua .contenidoCorreo').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Continua .contenidoCorreo').innerText);

document.querySelector('#template-Inicio .modal-header').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Inicio .modal-header').innerText);
document.querySelector('#template-Inicio .destinatarios').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Inicio .destinatarios').innerText);
document.querySelector('#template-Inicio .contenidoCorreo').onclick = () => navigator.clipboard.writeText(document.querySelector('#template-Inicio .contenidoCorreo').innerText);