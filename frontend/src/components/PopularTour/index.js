import React from 'react';
import './populartour.scss';
import { Col, Container, Row } from 'react-bootstrap';

const PopularTour = () => {
      return (
            <section className="popular__tour">
                  <Container>
                        <div className="content">
                              <Row className="">
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/adventure.svg" />
                                                </div>
                                                <p>Adventure</p>
                                          </div>
                                    </Col>
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/city-tour.svg" />
                                                </div>
                                                <p>City</p>
                                          </div>
                                    </Col>
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/sheep.svg" />
                                                </div>
                                                <p>Cruises</p>
                                          </div>
                                    </Col>
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/sea-tour.svg" />
                                                </div>
                                                <p>Sea</p>
                                          </div>
                                    </Col>
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/travel.svg" />
                                                </div>
                                                <p>Travel</p>
                                          </div>
                                    </Col>
                                    <Col xl={2} md={6} className="col__con">
                                          <div className="inner__con">
                                                <div className="svg__con">
                                                      <img src="/assets/images/wedding.svg" />
                                                </div>
                                                <p>Wedding</p>
                                          </div>
                                    </Col>
                              </Row>
                        </div>
                  </Container>
            </section>
      );
};

export default PopularTour;
