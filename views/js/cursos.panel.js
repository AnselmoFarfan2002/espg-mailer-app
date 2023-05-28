const ID_PROGRAMA_AP = Number(document.querySelector('#idPrograma').innerHTML);
var ID_PROGRAMA;
const TABLA_CURSOS_AP = document.querySelector('#cursosAP tbody')
const SELECT_PROGRAMA = document.querySelector('#select-programa');
const SELECT_CURSO = document.querySelector('#select-curso');
const SELECT_SEMESTRE = document.querySelector('#select-semestre');
const SELECT_SECCION = document.querySelector('#select-seccion');
const SELECT_DOCENTE = document.querySelector('#select-docente');
const BTN_DOCENTE = document.querySelector('#btn-docente');
const DROPDOWN_DOCENTE = document.querySelector('#optDocentes');
const INPUT_NOMBRE_DOCENTE = document.querySelector('#nombreDocente');
const FORM_REGISTRO = document.querySelector('#form-registro');
const BUSCADOR_INPUT = document.querySelector('#buscador');
const BUSCADOR_BUTTON = document.querySelector('#buscador-btn');

var emptyCursos = () => {cargarTablaVacia(TABLA_CURSOS_AP, 9, '49vh'); console.clear()};

const secciones = {};

const listarCursosAP = ( CRS = CURSOS ) => {
    if(CRS.length > 0){
        TABLA_CURSOS_AP.innerHTML = '';

        CRS.forEach(curso => {
            let fila = createElement('tr');
            fila.appendChild( createElement('td', curso.id, [{field: 'scope', value: 'row'}]) );
            fila.appendChild( createElement('td', curso.semestre) );
            fila.appendChild( createElement('td', curso.curso) );
            fila.appendChild( createElement('td', curso.seccion) );
            fila.appendChild( createElement('td', curso.matriculados) );
            fila.appendChild( createElement('td', curso.inicio) );
            fila.appendChild( createElement('td', curso.fin) );

            let controlOpt = createElement('a', "<span class='emojiControl border'>&#128064;</span>", [
                {field: 'href', value: `/gui/cursos/${curso.id}/matriculados?curso=${curso.curso}&&semestre=${curso.semestre}&&admision=${document.getElementById('admisionPrograma').innerHTML}&&programa=${document.getElementById('nombreLargoPrograma').innerHTML}&&seccion=${curso.seccion}&&ids=${secciones[curso.seccion]}&&docente=${curso.docente}`},
                {field: 'title', value: `ver más`}
            ]);

            let row = createElement('td','',[{field: 'class', value: 'text-center'}]);
            row.appendChild(controlOpt);

            
            fila.appendChild(row);
            TABLA_CURSOS_AP.appendChild( fila );
        });
    } else emptyCursos();
}

const actualizaCursos = () => {
    SELECT_CURSO.innerHTML = '';
    cargarSelectCursos(SELECT_CURSO, ID_PROGRAMA, CURSOS_OPCIONES_SEMESTRES[ SELECT_SEMESTRE.selectedIndex ]);
}

const listarSecciones = () => {
    let container = document.querySelector('#cursosAP thead');
    
    [PROGRAMA] = PROGRAMAS.filter(p => p.id == ID_PROGRAMA_AP);
    let fila;

    PROGRAMA.secciones.forEach( seccion => {
        let {id, nombre, correo, contrasenia, aula} = seccion;
        let button, aux;

        fila = createElement('tr', '', [{field: 'class', value: '.bg-light-subtle tbody align-middle'}]);
        fila.appendChild( createElement('td', id, [{field: 'scope', value: 'row'}]) );
        fila.appendChild( createElement('td', nombre) ); secciones[nombre] = id;
        fila.appendChild( createElement('td', aula) );
        fila.appendChild( createElement('td', correo, [{field: 'colspan', value: '2'}]) );
        fila.appendChild( createElement('td', contrasenia, [{field: 'colspan', value: '2'}]) );

        button = createElement('button','<i class="fa-solid fa-edit"></i>', [
            {field: 'class', value: 'btn btn-light border'},
            {field: 'title', value: 'editar sección'},
            {field: 'onclick', value: `showModalEditorSeccion(${id}, '${nombre}', '${correo}', '${contrasenia}', '${aula}')`}
        ]);
        aux = createElement('td','',[{field: 'class', value: 'text-center'}]);
        aux.appendChild(button);

        fila.appendChild( aux );
        container.appendChild( fila );
    })

    fila = createElement('tr','', [{field: 'class', value: 'table-secondary'}]);
    fila.appendChild( createElement('th', 'ID', [{field: 'scope', value: 'col'}]) );
    fila.appendChild( createElement('th', 'Semestre') );
    fila.appendChild( createElement('th', 'Nombre') );
    fila.appendChild( createElement('th', 'Sección') );
    fila.appendChild( createElement('th', 'Matriculados') );
    fila.appendChild( createElement('th', 'Inicio') );
    fila.appendChild( createElement('th', 'Fin') );
    fila.appendChild( createElement('th', '<i class="fa-solid fa-gears"></i>', [{field: 'class', value: 'text-center'}]) );
    container.appendChild( fila );
}

const aplicarFiltros = () => {
    let cursoFiltrados = CURSOS;

    cursoFiltrados = cursoFiltrados.filter(curso => 
        curso.curso.toLocaleUpperCase().includes( BUSCADOR_INPUT.value.toLocaleUpperCase() )
    );

    listarCursosAP( cursoFiltrados );
}

/* Loading data at form */

SELECT_PROGRAMA.appendChild( createElement('option', document.getElementById('nombrePrograma').innerHTML, [
    {field: 'value', value: document.getElementById('idPrograma').innerHTML}
]));

SELECT_PROGRAMA.setAttribute('disabled', 'true');

getProgramas().then( listarSecciones );
cargarSelectSecciones(ID_PROGRAMA_AP, SELECT_SECCION);

const fillTable = () => getNombresProgramas().then( () => {
    let nombre = document.getElementById('nombrePrograma').innerHTML;
    let nombresOP = PROGRAMAS_OPCIONES.map(po => po.nombre);
    ID_PROGRAMA = PROGRAMAS_OPCIONES[nombresOP.indexOf(nombre)].id;

    getCursos(ID_PROGRAMA_AP).then( listarCursosAP ).catch( emptyCursos );
    cargarSelectCursos(SELECT_CURSO, ID_PROGRAMA);
    cargarNombresCursos(ID_PROGRAMA).then( () => cargarSelectSemestres(SELECT_SEMESTRE) );
});

const crearObjetoCA = () => {
    return {
        idSeccion: FORM_REGISTRO.querySelector('#select-seccion').value,
        idCurso: FORM_REGISTRO.querySelector('#select-curso').value,
        idDocente: FORM_REGISTRO.querySelector('#select-docente').value,
        inicio: FORM_REGISTRO.querySelector('#input-inicio-curso').value,
        fin: FORM_REGISTRO.querySelector('#input-fin-curso').value
    }
}

const registrarCA = () =>  postCursoAperturado( crearObjetoCA() ).then( a => console.log(a) ).finally( fillTable );

/* events and others */
SELECT_SEMESTRE.onchange = actualizaCursos;
FORM_REGISTRO.querySelector('#btn-registro').onclick = registrarCA;

fillTable();
BUSCADOR_INPUT.addEventListener('keydown', aplicarFiltros);
BUSCADOR_BUTTON.onclick = aplicarFiltros;