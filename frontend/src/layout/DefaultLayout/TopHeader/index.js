import React from 'react';
import './topheader.scss';
import { Col, Container, Row } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClock } from '@fortawesome/free-regular-svg-icons';
import { faLocationDot } from '@fortawesome/free-solid-svg-icons';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { authSelector } from '~/redux/selectors';

const TopHeader = () => {
      const currentUser = useSelector(authSelector);

      return (
            <section className="top__header__sec d-none d-xl-block">
                  <Container>
                        <Row className="align-items-center">
                              <Col xl={10} className="d-flex gap-5  align-items-center">
                                    <div className="d-flex gap-2  align-items-center">
                                          <FontAwesomeIcon icon={faClock} /> <p>Opening Hours: 8am - 6pm</p>
                                    </div>
                                    <div className="d-flex gap-2  align-items-center">
                                          <FontAwesomeIcon icon={faLocationDot} /> <p>Ho Chi Minh, Viet Nam</p>
                                    </div>
                              </Col>
                              <Col xl={2} className="d-flex justify-content-end">
                                    {currentUser ? (
                                          <Link to="/profile">My account</Link>
                                    ) : (
                                          <Link to="/login">Login</Link>
                                    )}
                              </Col>
                        </Row>
                  </Container>
            </section>
      );
};

export default TopHeader;
