const TABLA_PROGRAMAS_AP =  document.querySelector('#programasAP tbody');
const BUSCADOR_INPUT = document.querySelector('#buscador');
const BUSCADOR_BUTTON = document.querySelector('#buscador-btn');
const SELECT_PROGRAMA = document.querySelector('#select-programa');
const SELECT_ADMISION = document.querySelector('#select-admision');
const ACORDION_SECCION = document.querySelector('#accordion-secciones');
const FILTER_TIPO = document.querySelector('#filterTipo');
const FILTER_ADMISION = document.querySelector('#filterAdmision');

const listarProgramasAP = ( PRO_AP = PROGRAMAS ) => {
    TABLA_PROGRAMAS_AP.innerHTML = '';

    if( PRO_AP.length )
        PRO_AP.forEach(programa => {
            let fila = createElement('tr');
            fila.appendChild( createElement('td', programa.tipo, [{field: 'scope', value: 'row'}]) );
            fila.appendChild( createElement('td', programa.nombre) );
            fila.appendChild( createElement('td', programa.secciones.map( s => s.nombre ).join(' - ')) );
            fila.appendChild( createElement('td', programa.admision) );
            
            let campo = createElement('td');
            campo.appendChild( createElement('a', '<i class="fa-solid fa-folder-open"></i>', [
                { field: 'href', value: `/gui/programas/${programa.id}/cursos?pref=${programa.tipo}&nombre=${programa.nombre}&admision=${programa.admision}` },
                { field: 'title', value: "Ver cursos" }
            ]))
            campo.appendChild( createElement('i','',[{field: 'class', value: ''}]) );
            fila.appendChild( campo );

            TABLA_PROGRAMAS_AP.appendChild( fila );
        });
    else cargarTablaVacia(TABLA_PROGRAMAS_AP,5, '60vh');
}

const filtrarProgramasAP = () => {
    let programasFiltrados = PROGRAMAS;

    if(FILTER_TIPO.value != 'Todos')
        programasFiltrados = programasFiltrados.filter(pg => pg.tipo == FILTER_TIPO.value);

    if(FILTER_ADMISION.value != 'Todos')
        programasFiltrados = programasFiltrados.filter(pg => pg.admision == FILTER_ADMISION.value);
    
    programasFiltrados = programasFiltrados.filter(programa => 
        programa.nombre.toLocaleUpperCase().includes( BUSCADOR_INPUT.value.toLocaleUpperCase() )
    );

    listarProgramasAP( programasFiltrados );
}

const crearFormSeccion = () => {
    let nombreSeccion = ACORDION_SECCION.querySelectorAll('.accordion-item').length + 97;
    nombreSeccion = String.fromCharCode( nombreSeccion );
    
    let newForm = createElement('div', 
        `<div class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#seccion-${nombreSeccion}" aria-expanded="true" aria-controls="collapseOne">Sección ${nombreSeccion.toLocaleUpperCase()}</button>
        </div>
        <div class="accordion-collapse collapse" id="seccion-${nombreSeccion}" style="">
            <div class="accordion-collapse collapse show p-3 pb-1">
                <input type="hidden" value="${nombreSeccion.toLocaleUpperCase()}" name="nombre">
                
                <div class="form-floating mb-3">
                    <input class="form-control" id="input-seccion-correo" type="email" placeholder="espg-11@unjbg.edu.pe" name="correo">
                    <label class="form-label" for="input-seccion-correo">Correo Electrónico</label>
                </div>
            
                <div class="form-floating mb-3">
                    <input class="form-control" id="input-seccion-contrasenia" type="text" placeholder="espg-11@unjbg.edu.pe" name="contrasenia">
                    <label class="form-label" for="input-seccion-correo">Contrasenia</label>
                </div>
                <div class="form-floating mb-3">
                    <input class="form-control" id="input-seccion-aula" type="text" placeholder="Enlace o número" name="aula">
                    <label class="form-label" for="input-seccion-correo">Aula</label>
                </div>
            </div>
        </div>`,
        [{field: 'class', value: 'accordion-item'}]
    )

    ACORDION_SECCION.insertBefore(newForm, ACORDION_SECCION.querySelector('.btn-group'));
}

const eliminarFormSeccion = () => {
    let toDelete = ACORDION_SECCION.querySelectorAll('.accordion-item');
    if(toDelete.length > 1){
        toDelete = toDelete[toDelete.length - 1];

        ACORDION_SECCION.removeChild(toDelete);
    }
}

const registrarPrograma = () => {
    let [band, msg] = validateForm('form-registro');
    
    if( band ) {
        let programaAP = {};

        programaAP.programa = SELECT_PROGRAMA.value;
        programaAP.admision = SELECT_ADMISION.value;

        let secciones = ACORDION_SECCION.querySelectorAll('.accordion-item');
        programaAP.secciones = [];
        secciones.forEach( seccion => {
            let campos = {};
            seccion.querySelectorAll('input').forEach( input => campos[input.name] = input.value );
            programaAP.secciones.push(campos);
        });

        postPrograma(programaAP)
        .then( programa => {
            console.log(programa);
            getProgramas().then( () => {
                listarProgramasAP(); 
                filtrarProgramasAP();} 
            );
        })
        .catch( err => console.log(err) );
    } else console.error(msg);
}

getProgramas().then( () => listarProgramasAP() );
cargarSelectProgramas(SELECT_PROGRAMA);
cargarSelectAdmision(SELECT_ADMISION);
cargarSelectAdmision(FILTER_ADMISION, false);

BUSCADOR_INPUT.addEventListener('keydown', filtrarProgramasAP);
BUSCADOR_BUTTON.onclick = filtrarProgramasAP;
ACORDION_SECCION.querySelector('.btn-group .add').onclick = crearFormSeccion;
ACORDION_SECCION.querySelector('.btn-group .remove').onclick = eliminarFormSeccion;
document.querySelector('#form-registro .modal-footer #btn-registro').onclick = registrarPrograma;
FILTER_TIPO.onchange = filtrarProgramasAP;
FILTER_ADMISION.onchange = filtrarProgramasAP;