import React from 'react';
import './footer.scss';
import { Col, Container, Row } from 'react-bootstrap';
import { destcat } from '~/data/category';
import images from '~/assets/images';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLocationDot, faPhone } from '@fortawesome/free-solid-svg-icons';
import { faCopyright, faEnvelope } from '@fortawesome/free-regular-svg-icons';
import { faFacebook, faInstagram, faPinterest, faTwitter } from '@fortawesome/free-brands-svg-icons';

const Footer = () => {
      const capitalizedcat = destcat.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));

      return (
            <section className="footer__sec pt-5">
                  <Container className="pt-5 pb-4">
                        <Row className="mb-5">
                              <Col
                                    lg={3}
                                    sm={6}
                                    className="circle__con mb-5 mb-lg-0 justify-content-start justify-content-lg-center"
                              >
                                    <div className="footer__circle">
                                          <img src={images.logo} />
                                          <p>Since: 2024</p>
                                    </div>
                              </Col>
                              <Col
                                    lg={3}
                                    sm={6}
                                    className="footer__info__con mb-5 mb-lg-0 justify-content-start justify-content-lg-center"
                              >
                                    <div>
                                          <p className="footer__title">Information</p>
                                          <ul>
                                                <li>
                                                      <a>About Company</a>
                                                </li>
                                                <li>
                                                      <a>Online Query</a>
                                                </li>
                                                <li>
                                                      <a>Become Partner</a>
                                                </li>
                                                <li>
                                                      <a>Help & Support</a>
                                                </li>
                                                <li>
                                                      <a>Contact</a>
                                                </li>
                                          </ul>
                                    </div>
                              </Col>
                              <Col
                                    lg={3}
                                    sm={6}
                                    className="footer__info__con mb-5 mb-lg-0 justify-content-start justify-content-lg-center"
                              >
                                    <div>
                                          <p className="footer__title">Destination</p>
                                          <ul>
                                                {capitalizedcat.map((item, index) => (
                                                      <li key={index}>
                                                            <a>{item}</a>
                                                      </li>
                                                ))}
                                          </ul>
                                    </div>
                              </Col>
                              <Col
                                    lg={3}
                                    sm={6}
                                    className="footer__info__con mb-5 mb-lg-0 justify-content-start justify-content-lg-center"
                              >
                                    <div>
                                          <p className="footer__title">Reach Us</p>
                                          <ul>
                                                <li className="d-flex gap-3 align-items-center">
                                                      <FontAwesomeIcon icon={faPhone} />
                                                      <div className="d-flex flex-column gap-2">
                                                            <a>+84 335 037 042</a>
                                                      </div>
                                                </li>
                                                <li className="d-flex gap-3 align-items-center">
                                                      <FontAwesomeIcon icon={faEnvelope} />
                                                      <div className="d-flex flex-column gap-2">
                                                            <a>fatthinhtravel@gmail.com</a>
                                                      </div>
                                                </li>
                                                <li className="d-flex gap-3 align-items-center">
                                                      <FontAwesomeIcon icon={faLocationDot} />
                                                      <div className="d-flex flex-column gap-2">
                                                            <a>Go Vap, HCM - 7000</a>
                                                      </div>
                                                </li>
                                          </ul>
                                    </div>
                              </Col>
                        </Row>
                        <Row className="py-4 mb-5">
                              <Col
                                    lg={6}
                                    className="col-12 footer__middle d-flex gap-4 align-items-center mb-5 mb-xl-0"
                              >
                                    <p>Stay Connected:</p>
                                    <ul className="d-flex align-items-center gap-4 flex-wrap">
                                          <li>
                                                <a>
                                                      <FontAwesomeIcon icon={faFacebook} />
                                                </a>
                                          </li>
                                          <li>
                                                <a>
                                                      <FontAwesomeIcon icon={faTwitter} />
                                                </a>
                                          </li>
                                          <li>
                                                <a>
                                                      <FontAwesomeIcon icon={faInstagram} />
                                                </a>
                                          </li>
                                          <li>
                                                <a>
                                                      <FontAwesomeIcon icon={faPinterest} />
                                                </a>
                                          </li>
                                    </ul>
                              </Col>
                              <Col
                                    lg={6}
                                    className="col-12 footer__middle d-flex gap-4 align-items-center justify-content-start justify-content-lg-end"
                              >
                                    <p>Pay Safely With Us!</p>
                                    <ul className="d-flex align-items-center gap-4 flex-wrap">
                                          <li>
                                                <img src={images.momoLogo} />
                                          </li>
                                          <li>
                                                <img
                                                      src={images.zalopayLogo}
                                                      style={{
                                                            backgroundColor: '#fff',
                                                            borderRadius: 8,
                                                      }}
                                                />
                                          </li>
                                    </ul>
                              </Col>
                        </Row>
                        <Row className=" footer__low__con pt-4">
                              <Col lg={6} className="footer__lower mb-2 mb-lg-0">
                                    <p>
                                          <FontAwesomeIcon icon={faCopyright} /> fatthinh
                                    </p>
                              </Col>
                              <Col lg={6} className="footer__lower d-flex justify-content-lg-end justify-content-start">
                                    <ul className="d-flex gap-2">
                                          <li>
                                                <a>Privacy Policy</a>
                                          </li>
                                          <li> | </li>
                                          <li>
                                                <a>Terms of Use</a>
                                          </li>
                                    </ul>
                              </Col>
                        </Row>
                  </Container>
            </section>
      );
};

export default Footer;
