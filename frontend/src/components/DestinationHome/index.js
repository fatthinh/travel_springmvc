import React from 'react';
import './destinationhome.scss';
import { Button, Col, Container, Row } from 'react-bootstrap';
import { destination } from '~/data/destination';
import { LinkContainer } from 'react-router-bootstrap';

const DestinationHome = () => {
      const fourdestination = destination.slice(0, 4);

      return (
            <section className="des__home__sec pb-5 pt-4">
                  <Container>
                        <Row>
                              {fourdestination.map((item, index) => (
                                    <LinkContainer key={index} to={`/destination/${item.id}`}>
                                          <Col lg={3} md={6} className="des__card">
                                                <img className="w-100" src={item.thumbnail} />
                                                <div className="overlay"></div>
                                                <div className="title">
                                                      <h5>{item.name}</h5>
                                                </div>
                                          </Col>
                                    </LinkContainer>
                              ))}
                        </Row>
                  </Container>
                  <Container className="btn__con__des">
                        <LinkContainer to={'/destinations'}>
                              <Button className="find__now mt-4 py-2">
                                    <div>
                                          <span className="transition" />
                                          <span className="label">All Destination</span>
                                    </div>
                              </Button>
                        </LinkContainer>
                  </Container>
            </section>
      );
};

export default DestinationHome;
