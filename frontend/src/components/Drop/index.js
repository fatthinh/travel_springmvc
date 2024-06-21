import React from 'react';
import { Dropdown } from 'react-bootstrap';

const Drop = ({ category, callback }) => {
      // const [value, setValue] = useState("");
      const capitalizedcat = category.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));
      const handleClick = (e) => {
            // console.log(e.target.innerText)
            callback(e.target.innerText);
      };
      return (
            <>
                  {capitalizedcat.map((item, index) => (
                        <Dropdown.Item key={index} onClick={(e) => handleClick(e)}>
                              {item}
                        </Dropdown.Item>
                  ))}
            </>
      );
};

export default Drop;
