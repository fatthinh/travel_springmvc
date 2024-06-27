import React, { useState } from 'react';
import './filter.scss';
import { Button, Col, Container, Dropdown, Row } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import useFetch from '~/hooks/useFetch';
import config from '~/config';
import { useSelector } from 'react-redux';
import { commonSelector } from '~/redux/selectors';

const Filter = () => {
      const { tours, destinationsFilter, categories } = useSelector(commonSelector);

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

      // const capitalizedtour = categories.map((cat) => cat.name);
      // const capitalizeddest = destinations.map((cat) => cat.name);
      // const capitalizedMonth = month.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));

      const handleDestination = (e) => {
            setSelectedDest(e.target.innerText);
      };

      const handleMonth = (e) => {
            setSelectedMonth(e.target.innerText);
      };

      const handleTravel = (e) => {
            setSelectedTravel(e.target.innerText);
      };

      const filteredTour = tours.filter((item) => {
            return (
                  item.name.toLowerCase().includes(selectedDest.toLowerCase()) ||
                  item.categoryCollection.some((cat) => cat.name.toLowerCase().includes(selectedTravel.toLowerCase()))
            );
      });

      const handleClick = () => {
            navigate('/tour-filter', {
                  state: {
                        filteredTour: filteredTour,
                        destination: selectedDest,
                        // month: selectedMonth,
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
                                          {destinationsFilter.map((item, index) => (
                                                <Dropdown.Item key={index} onClick={(e) => handleDestination(e)}>
                                                      {item}
                                                </Dropdown.Item>
                                          ))}
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
                                          <Dropdown.Item onClick={(e) => handleTravel(e)}>Travel Type</Dropdown.Item>
                                          {categories.map((item, index) => (
                                                <Dropdown.Item key={index} onClick={(e) => handleTravel(e)}>
                                                      {item}
                                                </Dropdown.Item>
                                          ))}
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
