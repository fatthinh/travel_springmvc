import React from 'react';
import PageBanner from '~/components/PageBanner';
import { Col, Container, Row } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { commonSelector } from '~/redux/selectors';

const DestinationList = () => {
      const { destinations } = useSelector(commonSelector);

      return (
            <div>
                  <PageBanner title="Destinations Your May Like" />

                  <section className="des__home__sec pb-5 pt-4">
                        <Container>
                              <Row>
                                    {destinations.map((item, index) => (
                                          <Col key={index} md={4} className="des__card my-4">
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
                  </section>
            </div>
      );
};

export default DestinationList;
