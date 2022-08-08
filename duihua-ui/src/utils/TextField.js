import React from "react";

const TextField = props => {
    return(
        <div>
            <input
                type="text"
                value={props.value}
            />
            <p>// place for errors</p>
        </div>
    );
}

export default TextField;