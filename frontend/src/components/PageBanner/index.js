import React, { useEffect, useState } from 'react';
import { background } from '~/data/bg';
import './pagebanner.scss';

const PageBanner = ({ destination, month, type, title }) => {
      const [bg, setBg] = useState();
      const [isVideo, setVideo] = useState();

      useEffect(() => {
            const index = Math.ceil(Math.random() * background.length - 1);
            setBg(background[index]);
            if (background[index]?.endsWith('.mp4')) {
                  setVideo(true);
            } else {
                  setVideo(false);
            }
      }, []);
      return (
            <section className="tour__ban__con">
                  <section
                        className="tour__banner"
                        style={{
                              position: 'relative',
                              width: '100%',
                              height: '100%',
                              backgroundSize: 'cover',
                              backgroundPosition: 'center',
                              backgroundImage: isVideo ? null : `url(${bg})`,
                        }}
                  >
                        {isVideo && (
                              <video
                                    src={bg}
                                    autoPlay
                                    muted
                                    loop
                                    style={{
                                          position: 'absolute',
                                          top: 0,
                                          left: 0,
                                          width: '100%',
                                          height: '100%',
                                          objectFit: 'cover',
                                    }}
                              />
                        )}
                  </section>
                  <div className="banner__text">
                        <p>Welcome to fatthinh</p>
                        <h2>{title}</h2>
                        <ul className="d-flex justify-content-center gap-5">
                              {destination == 'Where To' || !destination ? (
                                    ''
                              ) : (
                                    <li>
                                          Destination: <span>{destination}</span>
                                    </li>
                              )}
                              {month == 'Select Month' || !month ? (
                                    ''
                              ) : (
                                    <li>
                                          Month: <span>{month}</span>
                                    </li>
                              )}
                              {type == 'Travel Type' || !type ? (
                                    ''
                              ) : (
                                    <li>
                                          Travel Type: <span>{type}</span>
                                    </li>
                              )}
                        </ul>
                  </div>
                  <div className="ban__border">
                        <img
                              className="w-100"
                              src="https://astrip-wp.b-cdn.net/wp-content/themes/astrip/assets/images/bg/inner-banner-vctr.png"
                        />
                  </div>
            </section>
      );
};

export default PageBanner;
