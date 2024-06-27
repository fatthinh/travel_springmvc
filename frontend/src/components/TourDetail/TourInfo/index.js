import { faClock, faMap, faUserGroup, faCheck } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React from 'react';
import { Col, Row } from 'react-bootstrap';

const TourInfo = ({ tourdetails, tourplan, tourGallery }) => {
      return (
            <main className="tour__info">
                  <section className="price d-flex align-items-center gap-2 py-2">
                        <h2>${tourdetails.price}</h2>
                        <p>(Per Person)</p>
                  </section>
                  <section className="day__time d-md-flex gap-5 py-2">
                        <p>
                              <i>
                                    <FontAwesomeIcon icon={faClock} />
                              </i>
                              {tourplan.length} Days / {tourplan.length + 1} Night
                        </p>
                        <p>
                              <i>
                                    <FontAwesomeIcon icon={faUserGroup} />
                              </i>
                              Max People {tourdetails.capacity}
                        </p>
                        <p>
                              <i>
                                    <FontAwesomeIcon icon={faMap} />
                              </i>
                              {tourdetails.destination?.name}
                        </p>
                  </section>
                  <section className="desc py-2 d-flex flex-column gap-3 ">
                        <p>{tourdetails.description}</p>
                  </section>
                  <section className="image pb-5 pt-4">
                        <Row>
                              {tourGallery.slice(0, 3).map((item, index) => (
                                    <Col key={index} lg={4}>
                                          <img className="w-100" src={item.src} />
                                    </Col>
                              ))}
                        </Row>
                  </section>
                  <section className="short__list">
                        <ul>
                              <li className="d-md-flex align-items-center">
                                    <h4>Destination</h4>
                                    <p>{tourdetails.destination?.name}</p>
                              </li>
                        </ul>
                  </section>
                  <section className="include d-md-flex">
                        <h4>Included Package Facility:</h4>
                        <div className="include__items">
                              <ul className="d-md-flex flex-md-wrap">
                                    <li>
                                          <i style={{ padding: 8 }}>
                                                <FontAwesomeIcon icon={faCheck} />
                                          </i>
                                          Free Best Tour Guided
                                    </li>
                                    <li>
                                          <i style={{ padding: 8 }}>
                                                <FontAwesomeIcon icon={faCheck} />
                                          </i>
                                          No Booking Charge
                                    </li>
                                    <li>
                                          <i style={{ padding: 8 }}>
                                                <FontAwesomeIcon icon={faCheck} />
                                          </i>
                                          Best Rate Gurantee
                                    </li>
                              </ul>
                        </div>
                  </section>
            </main>
      );
};

export default TourInfo;
