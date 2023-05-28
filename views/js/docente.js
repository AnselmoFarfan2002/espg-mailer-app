const cargarListaDocentes = () => {
    document.querySelector('#optDocentes').innerHTML = '';
    if( !PERSONAS.length ) document.querySelector('#msgBusquedaDocente').innerHTML = 'No se encontró ninguno.'
    else document.querySelector('#msgBusquedaDocente').innerHTML = ''

    PERSONAS.forEach( docente => {
        let li = createElement('div','',[{field: 'class', value: ''}]);
        li.appendChild( createElement('a', docente.nombre, [
            {field: 'class', value: 'dropdown-item docente-item'},
            {field: 'href', value: `javascript: cargarSelectDocente(${docente.id}, '${docente.nombre}')`}
        ]) );
        document.querySelector('#optDocentes').appendChild( li )
    });
}

const cargarSelectDocente = (id, nombre) =>{
    document.querySelector('#select-docente').innerHTML = '';
    document.querySelector('#select-docente').appendChild( createElement('option', nombre, [{field: 'value', value: id}]) );
}

const eventoInputDocente = e => {
    if(e.keyCode == 13) 
        getPersonas('?nombre='+e.target.value+'&tipo=docente')
        .then( cargarListaDocentes )
        .catch( () => {PERSONAS = []; cargarListaDocentes(); });
}

const actualizarDocente = () => {
    fetch('/cursos/'+document.getElementById('idCurso').innerHTML+'/docente', {
        method: 'POST',
        body: JSON.stringify({idDocente: document.querySelector('#select-docente').value}),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then( res => window.location.href = window.location.href )
}

document.querySelector('#nombreDocente').addEventListener('keydown', eventoInputDocente);
document.getElementById('findDocenteTrigger').onclick = () => {
    getPersonas('?nombre='+ document.getElementById('nombreDocente').value+'&tipo=docente')
    .then( cargarListaDocentes )
    .catch( () => {PERSONAS = []; cargarListaDocentes(); console.clear();});
}