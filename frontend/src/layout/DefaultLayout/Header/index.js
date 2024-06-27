import React, { useState } from 'react';
import { Accordion, Button, Col, Container, Dropdown, span, Offcanvas, Row } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';
import './header.scss';
import images from '~/assets/images';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faChevronDown, faPhone } from '@fortawesome/free-solid-svg-icons';
import useFetch from '~/hooks/useFetch';
import config from '~/config';

const Header = () => {
      const [fix, setFix] = useState(false);
      const [selectedTravel, setSelectedTravel] = useState('');
      const [show, setShow] = useState(false);
      const { data: categories } = useFetch(`${config.BASE_URL}/${config.endpoints.categories}`);
      const { data: tour } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail']}`);

      const handleClose = () => setShow(false);
      const handleShow = () => setShow(true);

      const navigate = useNavigate();

      const capitalizedtour = categories.map((cat) => cat.name);

      const stayFixed = () => {
            if (window.scrollY >= 300) {
                  setFix(true);
            } else {
                  setFix(false);
            }
      };

      window.addEventListener('scroll', stayFixed);

      const handleTravel = (e) => {
            setSelectedTravel(e.target.innerText);
            const filteredTour = tour.filter((item) => {
                  return item.categoryCollection.some((cat) =>
                        cat.name.toLowerCase().includes(selectedTravel.toLowerCase()),
                  );
            });

            navigate('/tour-filter', {
                  state: { filteredTour: filteredTour, type: selectedTravel },
            });
      };

      return (
            <header className={`${fix ? 'header__sec fixed__top' : 'header__sec'}`}>
                  <Container>
                        <Row className="align-items-center">
                              <Col xl={2} className="col-2">
                                    <Link to="/">
                                          <img src={images.logo} />
                                    </Link>
                              </Col>
                              <Col
                                    xl={8}
                                    className="col-10 d-flex justify-content-end justify-content-xl-center gap-5 align-items-center"
                              >
                                    <ul className=" menu d-none d-lg-flex justify-content-end justify-content-xl-center gap-4 align-items-center">
                                          <li>
                                                <Link to="/">
                                                      <span>Home</span>
                                                </Link>
                                          </li>
                                          <li>
                                                <span className="d-flex gap-2 align-items-center">
                                                      Tour
                                                      <FontAwesomeIcon icon={faChevronDown} />
                                                </span>
                                                <div className="tour__box">
                                                      <div className="white" />
                                                      <div className="sub__con">
                                                            <ul className="sub__menu">
                                                                  <Link to="/tours">
                                                                        <li>
                                                                              <span>All Tours</span>
                                                                        </li>
                                                                  </Link>
                                                                  {capitalizedtour.map((item, index) => (
                                                                        <li key={index}>
                                                                              <Dropdown.Item
                                                                                    onClick={(e) => handleTravel(e)}
                                                                              >
                                                                                    {item}
                                                                              </Dropdown.Item>
                                                                        </li>
                                                                  ))}
                                                            </ul>
                                                      </div>
                                                </div>
                                          </li>
                                          <li>
                                                <Link to="/destinations">
                                                      <span className="d-flex gap-2 align-items-center">
                                                            Destination
                                                      </span>
                                                </Link>
                                          </li>
                                          <li>
                                                <Link to="/blogs">
                                                      <span className="d-flex gap-2 align-items-center">Blog</span>
                                                </Link>
                                          </li>
                                          <li>
                                                <Link to="/about">
                                                      <span>About</span>
                                                </Link>
                                          </li>
                                          <li>
                                                <Link to="/contact">
                                                      <span>Contact</span>
                                                </Link>
                                          </li>
                                    </ul>
                                    <a onClick={handleShow}>
                                          <i className="bi bi-list d-lg-none d-block" />
                                    </a>
                                    <Offcanvas show={show} onHide={handleClose}>
                                          <Offcanvas.Header closeButton>
                                                <Offcanvas.Title>
                                                      <Link to="/">
                                                            <img src="/assets/images/logo.svg" />
                                                      </Link>
                                                </Offcanvas.Title>
                                          </Offcanvas.Header>
                                          <Offcanvas.Body className="d-flex justify-content-between flex-column">
                                                <ul className="top">
                                                      <li>
                                                            <Link to="/">
                                                                  <span>Home</span>
                                                            </Link>
                                                      </li>
                                                      <li>
                                                            <Accordion>
                                                                  <Accordion.Item eventKey="0">
                                                                        <Accordion.Header>Tour</Accordion.Header>
                                                                        <Accordion.Body>
                                                                              <ul className="sub__menu">
                                                                                    <Link to="/tour">
                                                                                          <li>
                                                                                                <span>All Tours</span>
                                                                                          </li>
                                                                                    </Link>
                                                                                    {capitalizedtour.map(
                                                                                          (item, index) => (
                                                                                                <li key={index}>
                                                                                                      <Dropdown.Item
                                                                                                            onClick={(
                                                                                                                  e,
                                                                                                            ) =>
                                                                                                                  handleTravel(
                                                                                                                        e,
                                                                                                                  )
                                                                                                            }
                                                                                                      >
                                                                                                            {item}
                                                                                                      </Dropdown.Item>
                                                                                                </li>
                                                                                          ),
                                                                                    )}
                                                                              </ul>
                                                                        </Accordion.Body>
                                                                  </Accordion.Item>
                                                            </Accordion>
                                                      </li>
                                                      <li className="mb-3">
                                                            <Link to="/destination">
                                                                  <span className="d-flex gap-2 align-items-center">
                                                                        Destination
                                                                  </span>
                                                            </Link>
                                                      </li>
                                                      <li className="mb-3">
                                                            <Link to="/blogs">
                                                                  <span className="d-flex gap-2 align-items-center">
                                                                        Blog
                                                                  </span>
                                                            </Link>
                                                      </li>
                                                      <li className="mb-3">
                                                            <Link to="/about">
                                                                  <span>About</span>
                                                            </Link>
                                                      </li>
                                                      <li className="mb-3">
                                                            <Link to="/contact">
                                                                  <span>Contact</span>
                                                            </Link>
                                                      </li>
                                                      <li className="call d-flex gap-2 align-items-center mb-4">
                                                            <FontAwesomeIcon icon={faPhone} />
                                                            <div>
                                                                  <p>Call Now</p>
                                                                  <p>+84 335 037 042</p>
                                                            </div>
                                                      </li>
                                                      <li>
                                                            <Button className="find__now">
                                                                  <div>
                                                                        <span className="transition" />
                                                                        <span className="label">Account</span>
                                                                  </div>
                                                            </Button>
                                                      </li>
                                                </ul>
                                                <ul className="foot">
                                                      <li>
                                                            <div className="d-flex gap-2  align-items-center">
                                                                  <i className="bi bi-stopwatch" />
                                                                  <p>Opening Hours: 8am - 6pm</p>
                                                            </div>
                                                      </li>
                                                      <li>
                                                            <div className="d-flex gap-2  align-items-center">
                                                                  <i className="bi bi-geo-alt" />
                                                                  <p>Dhulikhel, Kavre</p>
                                                            </div>
                                                      </li>
                                                </ul>
                                          </Offcanvas.Body>
                                    </Offcanvas>
                              </Col>
                              <Col xl={2} className="d-none d-xl-flex gap-2 justify-content-end align-items-center">
                                    <FontAwesomeIcon icon={faPhone} />
                                    <div>
                                          <p>Call Now</p>
                                          <p>+84 335 037 042</p>
                                    </div>
                              </Col>
                        </Row>
                  </Container>
            </header>
      );
};

export default Header;
