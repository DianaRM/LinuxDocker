
import React from "react";
//import React, {Fragmment} from 'react';
import PropTypes from 'prop-types';

//FC

const PrimeraApp = ({saludo, subtitulo})=>{
    //const saludo = 'Hola Mundo';
    /*
    const persona = {
        nombre: 'Diana',
        edad: 23
    };
    */

    return (
        <>
        <h1>{saludo}</h1>
        {/*<pre>{ JSON.stringify(persona, null, 3) }</pre>*/}
        <p>{subtitulo}</p>
        </>
    );
    

}

PrimeraApp.propTypes = {
    saludo: PropTypes.string.isRequired
}

PrimeraApp.defaultProps ={
    subtitulo:'Soy un subtitulo'
}
export default PrimeraApp;