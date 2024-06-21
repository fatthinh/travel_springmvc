import React, { useState } from 'react';
import './filter.scss';
import { Button, Col, Container, Dropdown, Row } from 'react-bootstrap';
import { tourcat, destination } from '~/data/category';
import { tour } from '~/data/tour';
import { useNavigate } from 'react-router-dom';

const Filter = () => {
      const [selectedDest, setSelectedDest] = useState('Where To');
      const [selectedMonth, setSelectedMonth] = useState('Select Month');
      const [selectedTravel, setSelectedTravel] = useState('Travel Type');

      // const [selectedMonth, setSelectedMonth] = useState()
      const month = [
            'january',
            'february',
            'march',
            'april',
            'may',
            'june',
            'july',
            'august',
            'september',
            'october',
            'november',
            'december',
      ];

      const navigate = useNavigate();

      const capitalizedtour = tourcat.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));
      const capitalizeddest = destination.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));
      const capitalizedMonth = month.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));

      const handleDestination = (e) => {
            setSelectedDest(e.target.innerText);
      };

      const handleMonth = (e) => {
            setSelectedMonth(e.target.innerText);
      };

      const handleTravel = (e) => {
            setSelectedTravel(e.target.innerText);
      };

      const filteredTour = tour.filter((item) => {
            const month = item.month.checkin.split(' ')[0];
            return (
                  item.name.toLowerCase().includes(selectedDest.toLowerCase()) ||
                  month.toLowerCase().includes(selectedMonth.toLowerCase()) ||
                  item.category.some((cat) => cat.toLowerCase().includes(selectedTravel.toLowerCase()))
            );
      });

      // console.log(filteredTour);
      const handleClick = () => {
            navigate('/tour-filter', {
                  state: {
                        filteredTour: filteredTour,
                        destination: selectedDest,
                        month: selectedMonth,
                        type: selectedTravel,
                  },
            });
      };

      return (
            <Container className="filter__sec py-4 px-5">
                  <Row className="py-2 gap-4">
                        <Col>
                              <i className="bi bi-geo-alt"></i>
                              <Dropdown>
                                    <Dropdown.Toggle variant="success" id="dropdown-basic">
                                          {selectedDest}
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu>
                                          <Dropdown.Item onClick={(e) => handleDestination(e)}>Where To</Dropdown.Item>
                                          {capitalizeddest.map((item, index) => (
                                                <Dropdown.Item key={index} onClick={(e) => handleDestination(e)}>
                                                      {item}
                                                </Dropdown.Item>
                                          ))}
                                    </Dropdown.Menu>
                              </Dropdown>
                        </Col>
                        <Col>
                              <i className="bi bi-calendar-week"></i>
                              <Dropdown>
                                    <Dropdown.Toggle variant="success" id="dropdown-basic">
                                          {selectedMonth}
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu>
                                          <Dropdown.Item onClick={(e) => handleMonth(e)}>Select Month</Dropdown.Item>
                                          {capitalizedMonth.map((item, index) => (
                                                <Dropdown.Item key={index} onClick={(e) => handleMonth(e)}>
                                                      {item}
                                                </Dropdown.Item>
                                          ))}

                                          {/* <Drop category={month} callbackMonth={callbackMonth}/> */}
                                    </Dropdown.Menu>
                              </Dropdown>
                        </Col>
                        <Col>
                              <i className="bi bi-airplane"></i>
                              <Dropdown>
                                    <Dropdown.Toggle variant="success" id="dropdown-basic">
                                          {selectedTravel}
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu>
                                          {/* <Dropdown.Item href="#/action-1">Travel Type</Dropdown.Item> */}
                                          <Dropdown.Item onClick={(e) => handleTravel(e)}>Travel Type</Dropdown.Item>
                                          {capitalizedtour.map((item, index) => (
                                                <Dropdown.Item key={index} onClick={(e) => handleTravel(e)}>
                                                      {item}
                                                </Dropdown.Item>
                                          ))}

                                          {/* <Drop category={tourcat}/> */}
                                    </Dropdown.Menu>
                              </Dropdown>
                        </Col>
                        <Col lg={2} className="d-flex justify-content-end">
                              <Button className="find__now" onClick={handleClick}>
                                    <div>
                                          <span className="transition" />
                                          <span className="label">Find Now</span>
                                    </div>
                              </Button>
                        </Col>
                  </Row>
            </Container>
      );
};

export default Filter;
