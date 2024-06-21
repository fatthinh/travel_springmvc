import React from 'react';
import { Button, Container } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

const Parralax = () => {
      return (
            <div className="parallax">
                  <div className="overlay">
                        <Container className="text__con">
                              <div className="text ">
                                    <p>Feel the vibe</p>
                                    <h4>Life Begins at The End of Your Comfort Zone.</h4>
                                    <p>
                                          Lorem ipsum dolor sit amet, consectetur adi- piscing elit. sed do eiusmod
                                          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                                          Exercitation ullam laboris nisi ut aliquip ex ea commodo consequat.
                                    </p>
                                    <LinkContainer to={'/tours'}>
                                          <Button className="find__now ">
                                                <div>
                                                      <span className="transition" />
                                                      <span className="label">Find Now</span>
                                                </div>
                                          </Button>
                                    </LinkContainer>
                              </div>
                        </Container>
                  </div>
            </div>
      );
};

export default Parralax;
