const TABLA_MATRICULADOS = document.querySelector('#matriculados tbody');
const ID_CURSO = Number(document.querySelector('#idCurso').innerHTML);
const BUSCADOR_INPUT = document.querySelector('#buscador');
const BUSCADOR_BUTTON = document.querySelector('#buscador-btn');

const emptyTable = () =>{ cargarTablaVacia(TABLA_MATRICULADOS, 5); console.clear(); }

const aplicarFiltros = () => {
    let matriculadosFiltrados = PERSONAS;

    matriculadosFiltrados = matriculadosFiltrados.filter(persona => 
        persona.nombre.toLocaleUpperCase().includes( BUSCADOR_INPUT.value.toLocaleUpperCase() ) ||
        persona.codigo.toLocaleUpperCase().includes( BUSCADOR_INPUT.value.toLocaleUpperCase() )
    );

    listarMatriculados( matriculadosFiltrados );
}

const listarDatosGenerales = () => getCurso(ID_CURSO)
.then( curso => {
    const {id, docente, inicio, fin, nombre, correo, contrasenia, aula, seccion} = curso;
    let container = document.querySelector('#matriculados thead');
    let fila = createElement('tr', '', [{field: 'class', value: '.bg-light-subtle tbody align-middle'}]);
    
    let button, aux;
    fila.appendChild( createElement('td', id, [{field: 'scope', value: 'row'}]) );
    fila.appendChild( createElement('td', docente ) );
    fila.appendChild( createElement('td', inicio ) );
    fila.appendChild( createElement('td', fin) );

    aux = createElement('td','',[{field: 'class', value: 'text-center'}]);
    button = createElement('button','<i class="fa-solid fa-edit"></i>', [
        {field: 'class', value: 'btn btn-light border mx-1'},
        {field: 'title', value: 'editar sección'},
        {field: 'onclick', value: `showModalEditorSeccion(${document.getElementById('idSeccion').innerHTML}, '${seccion}', '${correo}', '${contrasenia}', '${aula}', '${seccion}')`}
    ]);
    aux.appendChild(button);
    button = createElement('button','<i class="fa-solid fa-clock"></i>', [
        {field: 'class', value: 'btn btn-light border mx-1'},
        {field: 'title', value: 'editar fechas'},
        {field: 'onclick', value: `showModalEditorCronograma(${id}, '${inicio.split('-').reverse().join('-')}', '${fin.split('-').reverse().join('-')}')`}
    ]);
    aux.appendChild(button);
    button = createElement('button','<i class="fa-solid fa-user-edit"></i>', [
        {field: 'class', value: 'btn btn-light border mx-1'},
        {field: 'title', value: 'cambiar docente'},
        {field: 'onclick', value: `showModalEditorDocente(${id}, '${seccion}', '${correo}', '${contrasenia}', '${aula}', '${seccion}')`}
    ]);
    aux.appendChild(button);

    fila.appendChild( aux );
    container.appendChild( fila );

    fila = createElement('tr','', [{field: 'class', value: 'table-secondary'}]);
    fila.appendChild( createElement('th', 'ID', [{field: 'scope', value: 'col'}]) );
    fila.appendChild( createElement('th', 'Estudiante', [{field: 'scope', value: 'col'}]) );
    fila.appendChild( createElement('th', 'Código', [{field: 'scope', value: 'col'}]) );
    fila.appendChild( createElement('th', 'Correos', [{field: 'scope', value: 'col'}]) );
    fila.appendChild( createElement('th', '<i class="fa-solid fa-gears"></i>', [{field: 'scope', value: 'col'}, {field: 'class', value: 'text-center'}]) );

    container.appendChild( fila );
})

const listarMatriculados = ( MTR = PERSONAS ) => {
    if(PERSONAS.length > 0){
        TABLA_MATRICULADOS.innerHTML = '';

        MTR.forEach(persona => {
            let fila = createElement('tr','',[{field:'class', value:'align-middle'}]);
            fila.appendChild( createElement('td', persona.id, [{field: 'scope', value: 'row'}]) );
            fila.appendChild( createElement('td', persona.nombre) );
            fila.appendChild( createElement('td', persona.codigo) );
            fila.appendChild( createElement('td', '<ul class="mb-0"><li>' + persona.correos.join('</li><li>') + '</li></ul>' ) );

            let controlOpt = createElement('button', '<i class="fa-solid fa-trash"></i>', [
                {field: 'class', value: `btn border btn-light`},
                {field: 'title', value: `Quitar matricula`},
                {field: 'disabled', value: `true`}
            ]);

            let row = createElement('td','',[{field: 'class', value: 'text-center'}]);
            row.appendChild(controlOpt);
            
            fila.appendChild(row);
            TABLA_MATRICULADOS.appendChild( fila );
        });

        updateCantidad();
    } else emptyTable();
}

const updateCantidad = () => { document.querySelector('#cantidadMTR').innerHTML = PERSONAS.length }

const postMatriculados = () => {
    let inputs = document.querySelectorAll('.form-control');
    let data = {};
    inputs.forEach( i => data[i.name] = i.value );

    fetch(`/cursos/${ID_CURSO}/matriculados`, {
        method: 'POST', body: JSON.stringify(data), headers: {'Content-Type':'application/json'}
    }).then( res => new Promise((resolve, reject) => {
        let txt = document.querySelector('#textarea-codigos');
        let alert = document.querySelector('#alert-matricula')
        
        if(res.status == 206) res.json().then( a => {
            txt.value = a.rechazados.join('\n');
            txt.classList.add('is-invalid')
            alert.classList.remove('d-none')
            resolve(a);
        });
        else if(res.status == 201) res.json().then( a => {
            txt.value = '';
            txt.classList.remove('is-invalid');
            alert.classList.add('d-none')
            resolve(a) 
        });
        else res.text().then( a => reject(a) )
    })).then( res => {
        console.log(res)
        fetchDataMatriculas()
    })
    .catch( res => console.error(res) );
}

listarDatosGenerales();

const fetchDataMatriculas = () => getMatriculados(ID_CURSO)
.then( listarMatriculados )
.catch( emptyTable )

fetchDataMatriculas();
document.getElementById('btn-matricular').onclick = postMatriculados;
BUSCADOR_INPUT.addEventListener('keydown', aplicarFiltros);
BUSCADOR_BUTTON.onclick = aplicarFiltros;

document.querySelector('#form-editar-docente #btn-registro').onclick = actualizarDocente;