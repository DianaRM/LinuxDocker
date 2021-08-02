import React, {useState} from 'react';
import Proptypes from 'prop-types';

//rafcp

const CounterApp = ({value = 10})=>{

    const [counter, setCounter] = useState (value);

    const handleAdd = () => {

        //setCounter(counter + 1);

        setCounter((c)=> c+1);
    }

    const handleReset = () =>{
        setCounter((c)=> c=value);
    }

    const handleSubtract = () =>{
        setCounter((c)=> c-1);
    }
    //const handleSubtract = () => setCounter(counter-1);

    return(
        <>
        <h1>CounterApp</h1>
        <h2>{counter}</h2>

        <button onClick={handleAdd}>+1</button>
        <button onClick={handleReset}>Reset</button>
        <button onClick={handleSubtract}>-1</button>

        </>
    );

}

CounterApp.propTypes = {
    value: Proptypes.number
}

export default CounterApp;