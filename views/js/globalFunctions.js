const REGEXP_GROUPS = /(^\/)(.*)\/([giusmy]+$)/;

const createElement = (nombre, content = '', attr = []) => {
    let element = document.createElement(nombre);
    attr.forEach( e => { element.setAttribute( e.field , e.value ); });
    element.innerHTML = content;

    return element;
}

const validateForm = (idContenedor) => {
    let inputs = document.querySelectorAll(`#${idContenedor} input`);
    let band = true, msg = [], pattern;
    inputs.forEach( input => {
        if( input.pattern ) {
            pattern = new RegExp(input.pattern.replace(REGEXP_GROUPS, '$2'), input.pattern.replace(REGEXP_GROUPS, '$3'));
            band = pattern.test(input.value);
            if(!band) msg.push('failed in field ' + input.name);
        }
    });

    return [band, msg];
}

/* PROGRAMAS 🤾*/

const getProgramas = () => new Promise((resolve, reject) => {
    fetch('/programas').then( res => res.json() )
    .then( dataServe => { 
        PROGRAMAS = dataServe.listaProgramas; 
        resolve();

    }).catch(err => {
        console.error('No se pudo obtener los programas')
        reject();
    });
})

const postPrograma = programa => new Promise((resolve, reject) => {
    fetch('/programas', {
        method: 'POST',
        body: JSON.stringify(programa),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then( res => {
        if( res.ok ) res.json().then( programa => resolve(programa) );
        else res.text().then( msg => reject(msg) )
    })
})

const getNombresProgramas = () => new Promise((resolve, reject) => {
    fetch('/opciones/programas').then( res => res.json() )
    .then( dataServe => { 
        PROGRAMAS_OPCIONES = dataServe.listaOpciones;
        resolve( dataServe.listaOpciones );
    }).catch(err => {
        console.error('No se pudo obtener los programas', err)
        reject();
    });
})

const cargarSelectProgramas = SELECT_PROGRAMA => {
    getNombresProgramas()
    .then( programas => {
        programas.forEach( programa => {
            SELECT_PROGRAMA.appendChild( 
                createElement('option', programa.tipo + ' en ' + programa.nombre, [{field: 'value', value: programa.id}]) 
            );
        })
    })
}

const fillSelectSecciones = (idPrograma, SELECT_SECCION) => {
    let [programa] = PROGRAMAS.filter( p => p.id == idPrograma );
    programa.secciones.forEach( seccion => {
        SELECT_SECCION.appendChild( 
            createElement('option', seccion.nombre, [{field: 'value', value: seccion.id}]) 
        );
    }); 
}

const cargarSelectSecciones = (idPrograma, SELECT_SECCION) => {
    if(PROGRAMAS.length > 0) fillSelectSecciones(idPrograma, SELECT_SECCION);
    else getProgramas().then( () => fillSelectSecciones(idPrograma, SELECT_SECCION) );
}

/* ADMISION */

const getNombresAdmision = () => new Promise((resolve, reject) => {
    fetch('/opciones/admision').then( res => res.json() )
    .then( dataServe => { 
        resolve( dataServe.listaOpciones );
    }).catch(err => {
        console.error('No se pudo obtener los programas', err)
        reject();
    });
})

const cargarSelectAdmision = (SELECT_ADMISION, value_eq_id = true) => {
    getNombresAdmision()
    .then( procesos => {
        ADMISION_OPCIONES = procesos;
        procesos.forEach( proceso => {
            SELECT_ADMISION.appendChild( 
                createElement('option', proceso.nombre, [{field: 'value', value: value_eq_id ? proceso.id : proceso.nombre}]) 
            );
        })
    })
}

/* CURSOS */
const getCursos = id => new Promise((resolve, reject) => {
    fetch('/programas/'+id+'/cursos').then( res => {
        if(res.ok) return res.json();
        else res.text().then(a => reject(a));
    })
    .then( dataServe => {
        CURSOS = dataServe.listaCursos;
        resolve();
    }).catch(err => {
        console.error('No se pudo obtener los cursos', err)
        reject();
    });
})

const getCurso = id => new Promise((resolve, reject) => {
    fetch('/cursos/'+id).then( res => {
        if(res.ok) return res.json();
        else res.text().then(a => reject(a));
    })
    .then( dataServe => {
        resolve(dataServe.listaCursos[0]);
    }).catch(err => {
        // console.error('No se pudo obtener los cursos', err)
        reject();
    });
})

const getCursoByDate = (dateStart, dateEnd) => new Promise((resolve, reject) => {
    fetch(`/cursos?inicio=${dateStart}&&fin=${dateEnd}`).then( res => {
        if(res.ok) return res.json();
        else res.text().then(a => reject(a));
    })
    .then( dataServe => {
        CURSOS = dataServe.listaCursos;
        resolve(dataServe.listaCursos);
    }).catch(err => {
        // console.error('No se pudo obtener los cursos', err)
        reject();
    });
})

const cargarNombresCursos = programa => new Promise((resolve, reject) => {
    fetch('/opciones/malla?id='+programa).then( res => res.json() )
    .then( dataServe => { 
        CURSOS_OPCIONES = dataServe.listaOpciones;
        CURSOS_OPCIONES_SEMESTRES = new Set(CURSOS_OPCIONES.map(co => co.semestre));
        CURSOS_OPCIONES_SEMESTRES = [ ...CURSOS_OPCIONES_SEMESTRES ];
        
        resolve( dataServe.listaOpciones );
    }).catch(err => {
        console.error('No se pudo obtener los cursos', err);
        reject();
    });
})

const cargarSelectSemestres = SELECT_SEMESTRE => {
    CURSOS_OPCIONES_SEMESTRES.forEach( cos => {
        SELECT_SEMESTRE.appendChild( 
            createElement('option', cos, [{field: 'value', value: cos}]) 
        );
    })
}

const cargarSelectCursos = (SELECT_CURSO, idPrograma, semestre = 'I') => {
    cargarNombresCursos(idPrograma)
    .then( cursos => {
        cursos = cursos.filter( c => c.semestre == semestre );
        cursos.forEach( curso => {
            SELECT_CURSO.appendChild( 
                createElement('option', curso.curso, [{field: 'value', value: curso.id}]) 
            );
        })
    })
}

const cargarTablaVacia = (tBody, ncol, height = '70vh', msg='Sin registros. Pruebe realizar alguno') => {
    tBody.innerHTML = `
        <th colspan="${ncol}" style="height: ${height}" class="align-middle">
            <div  class="text-center">
                <i class="fa-solid fa-file-pen mb-3" style="font-size: 50px"></i>
                <br>
                ${msg}
            </div>            
        </th>
    `
}

const postCursoAperturado = CA => new Promise((resolve, reject) => {
    fetch('/cursos', { 
        method:'POST',
        body: JSON.stringify(CA),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then( res => {
        if(res.ok) return res.json();
        else res.text().then(a => reject(a));
    }).then( dataServe => resolve(dataServe) )
    .catch(err => {
        console.error('No se pudo registrar el curso', err)
        reject(err);
    });
})

/* PERSONAS */

const getPersonas = (query = '') => new Promise((resolve, reject) => {
    fetch('/personas'+query).then(res => new Promise((resolve, reject) => {
        if(res.ok) res.json().then(a => resolve(a));
        else res.text().then(a => reject(a));
    })).then( dataServe => {
        PERSONAS = dataServe.listaPersonas;
        resolve();
    }).catch(err => {
        console.error('Server: ', err)
        reject();
    });
})

/* PERSONAS */

const getMatriculados = (id) => new Promise((resolve, reject) => {
    fetch('/cursos/'+id+'/matriculados').then(res => new Promise((resolve, reject) => {
        if(res.ok) res.json().then(a => resolve(a));
        else res.text().then(a => reject(a));
    })).then( dataServe => {
        PERSONAS = dataServe.listaMatriculados;
        resolve();
    }).catch(err => {
        console.error('Server: ', err)
        reject();
    });
})

/**MODALS */
const showModalEditorSeccion = (id, nombre, correo, contrasenia, aula) => {
    const modal = document.querySelector('#form-editar');

    modal.querySelector('form').action = '/secciones/' + id;
    modal.querySelector('.nombre').value = nombre;
    modal.querySelector('.correo').value = correo;
    modal.querySelector('.contrasenia').value = contrasenia;
    modal.querySelector('.aula').value = aula;

    document.querySelector('#triggerEditarSeccion').click();
}

const showModalEditorCronograma = (idCurso, inico, fin) => {
    const modal = document.querySelector('#form-editar-cronograma');

    modal.querySelector('form').action = '/cursos/' + idCurso + '/fechas';
    modal.querySelector('.inicio').value = inico;
    modal.querySelector('.fin').value = fin;

    document.querySelector('#triggerEditarCronograma').click();
}

const showModalEditorDocente = (idCurso, inico, fin) => {
    const modal = document.querySelector('#form-editar-docente');


    document.querySelector('#triggerEditarDocente').click();
}
