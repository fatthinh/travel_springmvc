import React, { useState } from 'react';
import './tourlist.scss';
import { tourcat, destination } from '~/data/category';
import { Accordion, Button, Col, Container, Dropdown, Form, Row } from 'react-bootstrap';
import PageBanner from '~/components/PageBanner';
import Slider from '@mui/material/Slider';
import Drop from '~/components/Drop';
import { LinkContainer } from 'react-router-bootstrap';
import useFetch from '~/hooks/useFetch';
import config from '~/config';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheck } from '@fortawesome/free-solid-svg-icons';

const TourList = () => {
      const { data: tour, loading, error } = useFetch(`${config.BASE_URL}/tour-detail/`);
      const [searchTerm, setSearchTerm] = useState('');
      const [value, setValue] = useState([0, 1000]);
      const [selectedDest, setSelectedDest] = useState({
            status: false,
            dest: 'Where To',
      });

      const [checked, setChecked] = useState([]);

      const capitalizedcat = tourcat.map((cat) => cat.charAt(0).toUpperCase() + cat.slice(1));

      const handleChange = (event, newValue) => {
            setValue(newValue);
      };

      const afterdiscount = (item) => {
            const discountAmount = (item.discount / 100) * item.price;
            return item.price - discountAmount;
      };

      const handleSearchTermChange = (event) => {
            setSearchTerm(event.target.value);
      };

      const filtereddest = tour.filter((item) => {
            if (selectedDest.dest === 'Where To') {
                  return item;
            } else {
                  return item.Destination.toLowerCase().includes(selectedDest.dest.toLowerCase());
            }
      });

      const pricerange = filtereddest.filter((item) => {
            return item.price > value[0] && item.price < value[1];
      });

      const filtered = tour.filter((item) => {
            return item.name.toLowerCase().includes(searchTerm.toLowerCase());
      });

      const callback = (dest) => {
            setSelectedDest({
                  status: true,
                  dest: dest,
            });
      };
      const handleClick = (e) => {
            // console.log(e.target.innerText)
            callback(e.target.innerText);
      };

      const handleCheckChange = (event) => {
            const value = event.target.value;
            if (event.target.checked) {
                  setChecked([...checked, value]);
            } else {
                  setChecked(checked.filter((item) => item !== value));
            }
      };
      const filterCheck = filtereddest.filter((item) => {
            return checked.every((category) => {
                  return item.category.some((itemCategory) => {
                        return itemCategory.toLowerCase() === category.toLowerCase();
                  });
            });
      });

      const handleReset = () => {
            setSearchTerm('');
            setValue([0, 1000]);
            setSelectedDest({
                  status: false,
                  dest: 'Where To',
            });
            setChecked([]);
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach((checkbox) => (checkbox.checked = false));
      };

      const toursToDisplay = searchTerm
            ? filtered
            : checked.length > 0
            ? filterCheck
            : pricerange.length > 0
            ? pricerange
            : filtereddest;

      console.log(`tours: ${toursToDisplay}`);

      return (
            <section className="tour__page">
                  <PageBanner title="Package For Your Choice" />
                  <section className="tour__body">
                        <Container>
                              <Row>
                                    <Col lg={4} className="pt-5 pb-0">
                                          <section className="tour__left d-flex flex-column gap-5">
                                                <div className="form__con">
                                                      <form className="form">
                                                            <button>
                                                                  <svg
                                                                        width={17}
                                                                        height={20}
                                                                        fill="none"
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        role="img"
                                                                        viewBox="0 0 15 18"
                                                                        aria-labelledby="search"
                                                                  >
                                                                        <path
                                                                              d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
                                                                              stroke="currentColor"
                                                                              strokeWidth="1.333"
                                                                              strokeLinecap="round"
                                                                              strokeLinejoin="round"
                                                                        />
                                                                  </svg>
                                                            </button>
                                                            <input
                                                                  className="input"
                                                                  placeholder="Search"
                                                                  required
                                                                  type="text"
                                                                  value={searchTerm}
                                                                  onChange={handleSearchTermChange}
                                                            />
                                                            <button className="reset" type="reset">
                                                                  <svg
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        className="h-6 w-6"
                                                                        fill="none"
                                                                        viewBox="0 0 20 28"
                                                                        stroke="currentColor"
                                                                        strokeWidth={2}
                                                                  >
                                                                        <path
                                                                              strokeLinecap="round"
                                                                              strokeLinejoin="round"
                                                                              d="M6 18L18 6M6 6l12 12"
                                                                        />
                                                                  </svg>
                                                            </button>
                                                      </form>
                                                </div>
                                                <div className="d-none d-lg-block">
                                                      <div className="select__desc mb-4">
                                                            <h2>Select Destination</h2>
                                                            <div className="selection">
                                                                  <Dropdown>
                                                                        <Dropdown.Toggle
                                                                              variant="success"
                                                                              id="dropdown-basic"
                                                                        >
                                                                              {selectedDest.dest}
                                                                        </Dropdown.Toggle>

                                                                        <Dropdown.Menu>
                                                                              <Dropdown.Item
                                                                                    onClick={(e) => handleClick(e)}
                                                                              >
                                                                                    Where To
                                                                              </Dropdown.Item>

                                                                              <Drop
                                                                                    category={destination}
                                                                                    callback={callback}
                                                                              />
                                                                        </Dropdown.Menu>
                                                                  </Dropdown>
                                                            </div>
                                                      </div>
                                                      <div className="price__range mb-4">
                                                            <h2>Price Range</h2>
                                                            <div className="price__slider">
                                                                  <Slider
                                                                        getAriaLabel={() => 'Temperature range'}
                                                                        value={value}
                                                                        onChange={handleChange}
                                                                        valueLabelDisplay="auto"
                                                                        // getAriaValueText={valuetext}
                                                                        min={1}
                                                                        max={1000}
                                                                        step={50}
                                                                  />
                                                            </div>
                                                      </div>
                                                      <div className="tour__type mb-4">
                                                            <h2>Tour Type</h2>
                                                            <div>
                                                                  <Form>
                                                                        {capitalizedcat.map((item, index) => (
                                                                              <div className="mb-3" key={index}>
                                                                                    <Form.Check
                                                                                          type="checkbox"
                                                                                          id={`checkbox-${index}`}
                                                                                    >
                                                                                          <Form.Check.Input
                                                                                                type="checkbox"
                                                                                                isValid
                                                                                                onChange={
                                                                                                      handleCheckChange
                                                                                                }
                                                                                                value={item}
                                                                                          />
                                                                                          <Form.Check.Label>
                                                                                                {item}
                                                                                          </Form.Check.Label>
                                                                                    </Form.Check>
                                                                              </div>
                                                                        ))}
                                                                  </Form>
                                                            </div>
                                                      </div>
                                                      <div className="reset__filter">
                                                            <Button className="find__now" onClick={handleReset}>
                                                                  <div>
                                                                        <span className="transition" />
                                                                        <span className="label">Reset Filter</span>
                                                                  </div>
                                                            </Button>
                                                      </div>
                                                </div>
                                                <div className="d-lg-none filter__mobile">
                                                      <Accordion>
                                                            <Accordion.Item eventKey="0">
                                                                  <Accordion.Header>Filter Tour</Accordion.Header>
                                                                  <Accordion.Body>
                                                                        <div className="select__desc mb-4">
                                                                              <h2>Select Destination</h2>
                                                                              <div className="selection">
                                                                                    <Dropdown>
                                                                                          <Dropdown.Toggle
                                                                                                variant="success"
                                                                                                id="dropdown-basic"
                                                                                          >
                                                                                                {selectedDest.dest}
                                                                                          </Dropdown.Toggle>

                                                                                          <Dropdown.Menu>
                                                                                                <Dropdown.Item
                                                                                                      onClick={(e) =>
                                                                                                            handleClick(
                                                                                                                  e,
                                                                                                            )
                                                                                                      }
                                                                                                >
                                                                                                      Where To
                                                                                                </Dropdown.Item>

                                                                                                <Drop
                                                                                                      category={
                                                                                                            destination
                                                                                                      }
                                                                                                      callback={
                                                                                                            callback
                                                                                                      }
                                                                                                />
                                                                                          </Dropdown.Menu>
                                                                                    </Dropdown>
                                                                              </div>
                                                                        </div>
                                                                        <div className="price__range mb-4">
                                                                              <h2>Price Range</h2>
                                                                              <div className="price__slider">
                                                                                    <Slider
                                                                                          getAriaLabel={() =>
                                                                                                'Temperature range'
                                                                                          }
                                                                                          value={value}
                                                                                          onChange={handleChange}
                                                                                          valueLabelDisplay="auto"
                                                                                          // getAriaValueText={valuetext}
                                                                                          min={1}
                                                                                          max={1000}
                                                                                          step={50}
                                                                                    />
                                                                              </div>
                                                                        </div>
                                                                        <div className="tour__type mb-4">
                                                                              <h2>Tour Type</h2>
                                                                              <div>
                                                                                    <Form>
                                                                                          {capitalizedcat.map(
                                                                                                (item, index) => (
                                                                                                      <div
                                                                                                            className="mb-3"
                                                                                                            key={index}
                                                                                                      >
                                                                                                            <Form.Check
                                                                                                                  type="checkbox"
                                                                                                                  id={`checkbox-${index}`}
                                                                                                            >
                                                                                                                  <Form.Check.Input
                                                                                                                        type="checkbox"
                                                                                                                        isValid
                                                                                                                        onChange={
                                                                                                                              handleCheckChange
                                                                                                                        }
                                                                                                                        value={
                                                                                                                              item
                                                                                                                        }
                                                                                                                  />
                                                                                                                  <Form.Check.Label>
                                                                                                                        {
                                                                                                                              item
                                                                                                                        }
                                                                                                                  </Form.Check.Label>
                                                                                                            </Form.Check>
                                                                                                      </div>
                                                                                                ),
                                                                                          )}
                                                                                    </Form>
                                                                              </div>
                                                                        </div>
                                                                        <div className="reset__filter">
                                                                              <Button
                                                                                    className="find__now"
                                                                                    onClick={handleReset}
                                                                              >
                                                                                    <div>
                                                                                          <span className="transition" />
                                                                                          <span className="label">
                                                                                                Reset Filter
                                                                                          </span>
                                                                                    </div>
                                                                              </Button>
                                                                        </div>
                                                                  </Accordion.Body>
                                                            </Accordion.Item>
                                                      </Accordion>
                                                </div>
                                          </section>
                                    </Col>
                                    <Col lg={8} className="py-5">
                                          <section className="tour__right d-flex flex-column gap-4">
                                                {(checked && !filterCheck.length) ||
                                                filtered.length == 0 ||
                                                !filtereddest ||
                                                pricerange.length == 0 ? (
                                                      <h1>Not Found</h1>
                                                ) : (
                                                      toursToDisplay.map((item, index) => (
                                                            <Row key={index} className="card__con p-3">
                                                                  <Col lg={6} className="left__card">
                                                                        <img className="w-100" src={item.thumbnail} />
                                                                  </Col>
                                                                  <Col lg={6} className="right__card">
                                                                        <h2>{item.name}</h2>
                                                                        {item.discount ? (
                                                                              <p>
                                                                                    From ${afterdiscount(item)} /{' '}
                                                                                    <del>${item.price}</del>
                                                                              </p>
                                                                        ) : (
                                                                              <p>${item.price}</p>
                                                                        )}
                                                                        <div>
                                                                              <h5>Free Package Facility</h5>
                                                                              <ul>
                                                                                    {/* {item.included.map(
                                                                                          (item, index) => (
                                                                                                <li key={index}>
                                                                                                      <i className="bi bi-check-lg" />
                                                                                                      {item}
                                                                                                </li>
                                                                                          ),
                                                                                    )} */}
                                                                                    <li>
                                                                                          <FontAwesomeIcon
                                                                                                icon={faCheck}
                                                                                          />
                                                                                          Free Best Tour Guided
                                                                                    </li>
                                                                                    <li>
                                                                                          <FontAwesomeIcon
                                                                                                icon={faCheck}
                                                                                          />
                                                                                          No Booking Charge
                                                                                    </li>
                                                                                    <li>
                                                                                          <FontAwesomeIcon
                                                                                                icon={faCheck}
                                                                                          />
                                                                                          Best Rate Gurantee
                                                                                    </li>
                                                                              </ul>
                                                                        </div>
                                                                        <LinkContainer to={`/tour-detail/${item.id}`}>
                                                                              <Button className="find__now mt-4">
                                                                                    <div>
                                                                                          <span className="transition" />
                                                                                          <span className="label">
                                                                                                Explore Now
                                                                                          </span>
                                                                                    </div>
                                                                              </Button>
                                                                        </LinkContainer>
                                                                  </Col>
                                                            </Row>
                                                      ))
                                                )}
                                          </section>
                                    </Col>
                              </Row>
                        </Container>
                  </section>
            </section>
      );
};

export default TourList;
