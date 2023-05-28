const TEXT_AREA = document.querySelector('#idDataRaw');

const postPersonas = (recurso, data) => 
    fetch('/'+recurso, {
        method: 'POST',
        body: JSON.stringify(data),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then( res => {
        if(res.status == 201) window.location.reload();
        else {
            document.querySelector('.text-danger').classList.remove('d-none')
        }
    })

function registrarPersonas(){
    let aux = TEXT_AREA.value;
    let personas = aux.split('\n').map(a => a.split('\t'));

    if ( isNaN(personas[0][0].split('-')[0]) ) {
        postPersonas('docentes', personas)
        console.log('docentes')
    } else{ 
        postPersonas('estudiantes', personas)
        console.log('estudiantes')
    }
}