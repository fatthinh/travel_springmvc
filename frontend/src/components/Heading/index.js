import React from 'react';

const Heading = ({ title, subtitle }) => {
      return (
            <div>
                  <div className="headings text-center">
                        <p>{title}</p>
                        <h2>{subtitle}</h2>
                        <div className="heading__ribbon">
                              <img src="/assets/images/ribbon.png" />
                        </div>
                  </div>
            </div>
      );
};

export default Heading;
