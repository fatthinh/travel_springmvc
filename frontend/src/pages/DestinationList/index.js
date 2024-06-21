import React from 'react';
import PageBanner from '~/components/PageBanner';
import { destination } from '~/data/destination';
import { Col, Container, Row } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

const DestinationList = () => {
      return (
            <div>
                  <PageBanner title="Destinations Your May Like" />

                  <section className="des__home__sec pb-5 pt-4">
                        <Container>
                              <Row>
                                    {destination.map((item, index) => (
                                          <LinkContainer key={index} to={`/destination/${item.id}`}>
                                                <Col md={4} className="des__card my-4">
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
                  </section>
            </div>
      );
};

export default DestinationList;
