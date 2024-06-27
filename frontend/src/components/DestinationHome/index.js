import React from 'react';
import './destinationhome.scss';
import { Button, Col, Container, Row } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import useFetch from '~/hooks/useFetch';
import config from '~/config';

const DestinationHome = () => {
      const { data: destinations } = useFetch(`${config.BASE_URL}/${config.endpoints.destinations}`);

      const fourdestination = destinations.slice(0, 4);

      return (
            <section className="des__home__sec pb-5 pt-4">
                  <Container>
                        <Row>
                              {fourdestination.map((item, index) => (
                                    <Col key={index} lg={3} md={6} className="des__card">
                                          <Link key={index} to={`/destination/${item.id}`}>
                                                <img className="w-100" src={item.thumbnail} />
                                                <div className="overlay"></div>
                                                <div className="title">
                                                      <h5>{item.name}</h5>
                                                </div>
                                          </Link>
                                    </Col>
                              ))}
                        </Row>
                  </Container>
                  <Container className="btn__con__des">
                        <Link to={'/destinations'}>
                              <Button className="find__now mt-4 py-2">
                                    <div>
                                          <span className="transition" />
                                          <span className="label">All Destination</span>
                                    </div>
                              </Button>
                        </Link>
                  </Container>
            </section>
      );
};

export default DestinationHome;
