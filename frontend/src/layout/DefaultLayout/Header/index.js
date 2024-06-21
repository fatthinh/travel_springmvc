import React, { useState } from 'react';
import { Accordion, Button, Col, Container, Dropdown, NavLink, Offcanvas, Row } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import { tourcat } from '~/data/category';
import { tour } from '~/data/tour';
import { useNavigate } from 'react-router-dom';
import './header.scss';
import images from '~/assets/images';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faChevronDown, faPhone } from '@fortawesome/free-solid-svg-icons';

const Header = () => {
      const [fix, setFix] = useState(false);
      const [selectedTravel, setSelectedTravel] = useState('');
      const [show, setShow] = useState(false);

      const handleClose = () => setShow(false);
      const handleShow = () => setShow(true);

      const navigate = useNavigate();

      const capitalizedtour = tourcat.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));

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
                  return item.category.some((cat) => cat.toLowerCase().includes(selectedTravel.toLowerCase()));
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
                                    <LinkContainer to={'/'}>
                                          <img src={images.logo} />
                                    </LinkContainer>
                              </Col>
                              <Col
                                    xl={8}
                                    className="col-10 d-flex justify-content-end justify-content-xl-center gap-5 align-items-center"
                              >
                                    <ul className=" menu d-none d-lg-flex justify-content-end justify-content-xl-center gap-4 align-items-center">
                                          <li>
                                                <LinkContainer to={'/'}>
                                                      <NavLink>Home</NavLink>
                                                </LinkContainer>
                                          </li>
                                          <li>
                                                <NavLink className="d-flex gap-2 align-items-center">
                                                      Tour
                                                      <FontAwesomeIcon icon={faChevronDown} />
                                                </NavLink>
                                                <div className="tour__box">
                                                      <div className="white" />
                                                      <div className="sub__con">
                                                            <ul className="sub__menu">
                                                                  <LinkContainer to={'/tours'}>
                                                                        <li>
                                                                              <a>All Tours</a>
                                                                        </li>
                                                                  </LinkContainer>
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
                                                <LinkContainer to={'/destinations'}>
                                                      <NavLink className="d-flex gap-2 align-items-center">
                                                            Destination
                                                      </NavLink>
                                                </LinkContainer>
                                          </li>
                                          <li>
                                                <LinkContainer to={'/blogs'}>
                                                      <NavLink className="d-flex gap-2 align-items-center">
                                                            Blog
                                                      </NavLink>
                                                </LinkContainer>
                                          </li>
                                          <li>
                                                <LinkContainer to={'/about'}>
                                                      <a>About</a>
                                                </LinkContainer>
                                          </li>
                                          <li>
                                                <LinkContainer to={'/contact'}>
                                                      <a>Contact</a>
                                                </LinkContainer>
                                          </li>
                                    </ul>
                                    <a onClick={handleShow}>
                                          <i className="bi bi-list d-lg-none d-block" />
                                    </a>
                                    <Offcanvas show={show} onHide={handleClose}>
                                          <Offcanvas.Header closeButton>
                                                <Offcanvas.Title>
                                                      <LinkContainer to={'/'}>
                                                            <img src="/assets/images/logo.svg" />
                                                      </LinkContainer>
                                                </Offcanvas.Title>
                                          </Offcanvas.Header>
                                          <Offcanvas.Body className="d-flex justify-content-between flex-column">
                                                <ul className="top">
                                                      <li>
                                                            <LinkContainer to={'/'}>
                                                                  <NavLink>Home</NavLink>
                                                            </LinkContainer>
                                                      </li>
                                                      <li>
                                                            <Accordion>
                                                                  <Accordion.Item eventKey="0">
                                                                        <Accordion.Header>Tour</Accordion.Header>
                                                                        <Accordion.Body>
                                                                              <ul className="sub__menu">
                                                                                    <LinkContainer to={'/tour'}>
                                                                                          <li>
                                                                                                <a>All Tours</a>
                                                                                          </li>
                                                                                    </LinkContainer>
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
                                                            <LinkContainer to={'/destination'}>
                                                                  <NavLink className="d-flex gap-2 align-items-center">
                                                                        Destination
                                                                  </NavLink>
                                                            </LinkContainer>
                                                      </li>
                                                      <li className="mb-3">
                                                            <LinkContainer to={'/blogs'}>
                                                                  <NavLink className="d-flex gap-2 align-items-center">
                                                                        Blog
                                                                  </NavLink>
                                                            </LinkContainer>
                                                      </li>
                                                      <li className="mb-3">
                                                            <LinkContainer to={'/about'}>
                                                                  <NavLink>About</NavLink>
                                                            </LinkContainer>
                                                      </li>
                                                      <li className="mb-3">
                                                            <LinkContainer to={'/contact'}>
                                                                  <NavLink>Contact</NavLink>
                                                            </LinkContainer>
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
