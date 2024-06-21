import React from 'react';
import './hero.scss';
import { Button } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

const Hero = () => {
      return (
            <section className="hero__sec">
                  <div className="banner__plane">
                        <img src="/assets/images/banner-plane.svg" />
                  </div>
                  <img className="cloud__one" src="/assets/images/cloud1.svg" />
                  <img className="cloud__two" src="/assets/images/cloud2.svg" />
                  <div className="left__hero">
                        <img src="/assets/images/banner-1.png" />
                  </div>
                  <div className="content">
                        <p>LETS FEEL A YACHT TRIP</p>
                        <h1>The Best Way to Plan Your Trip Around The World.</h1>
                        <p>Treat yourself with a journey to your inner self.</p>
                        <Button>
                              <LinkContainer to={'/tours'}>
                                    <div>
                                          <span className="transition" />
                                          <span className="label">Discover More</span>
                                    </div>
                              </LinkContainer>
                        </Button>
                  </div>
                  <div className="right__hero">
                        <img src="/assets/images/banner-2.png" />
                        <img className="round" src="/assets/images/banner-inner-img.jpg" />
                  </div>
            </section>
      );
};

export default Hero;
