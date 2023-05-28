const loadSections = () => {
    selectSecciones.innerHTML = '';
    PROGRAMAS[ selectProgramas.selectedIndex ].secciones.forEach( secc => {
        selectSecciones.appendChild( 
            createElement('option', secc.nombre, [{field: 'value', value: secc.id}] ) 
        );
    });
}