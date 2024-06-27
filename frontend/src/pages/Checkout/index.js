import { Card, Col, Container, Row } from 'react-bootstrap';
import PageBanner from '~/components/PageBanner';
import './checkout.scss';
import { useLocation, useNavigate } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLocationDot, faTrash } from '@fortawesome/free-solid-svg-icons';
import { useState, useEffect } from 'react';
import { faTrashAlt } from '@fortawesome/free-regular-svg-icons';

function Checkout() {
      const location = useLocation();
      const navigate = useNavigate();
      const [bookingInfo, setBookingInfo] = useState({
            firstName: '',
            lastName: '',
            phone: '',
            email: '',
            address: '',
            notes: '',
      });
      const [adult, setAdult] = useState(location.state.adult);
      const [child, setChild] = useState(location.state.child);
      const [tickets, setTickets] = useState([]);

      const onChangeBookingInfo = (event, field) => {
            setBookingInfo((current) => {
                  return { ...current, [field]: event.target.value };
            });
      };

      const onBook = () => {
            const tourId = location.state.selectedTour.id;
            const booking = { ...bookingInfo, tickets, tourId };
            console.log(booking);
      };

      const onChangeTicketInfo = (e, index, field) => {
            const currentTickets = [...tickets];
            currentTickets[index][field] = e.target.value;
            setTickets(currentTickets);

            console.log(tickets);
      };

      useEffect(() => {
            const items = [];
            for (let i = 0; i < adult; i++) {
                  items.push({ name: '', dob: '', type: 1 });
            }
            for (let i = 0; i < child; i++) {
                  items.push({ name: '', dob: '', type: 2 });
            }
            setTickets(items);
      }, [adult, child]);

      const renderAdults = () => {
            let adults = [];
            for (let i = 0; i < adult; i++) {
                  adults.push(
                        <Row key={i} className="mb-4">
                              <Col lg={6}>
                                    <div className="form-outline">
                                          <input
                                                type="text"
                                                placeholder="Name"
                                                className="form-control"
                                                value={tickets[i]?.['name']}
                                                onChange={(e) => onChangeTicketInfo(e, i, 'name')}
                                          />
                                    </div>
                              </Col>
                              <Col lg={5}>
                                    <div className="form-outline">
                                          <input
                                                type="date"
                                                placeholder="Date of birth"
                                                className="form-control"
                                                value={tickets[i]?.['dob']}
                                                onChange={(e) => onChangeTicketInfo(e, i, 'dob')}
                                          />
                                    </div>
                              </Col>
                              <Col lg={1} className="p-0">
                                    <button
                                          className="btn w-100 btn-danger"
                                          onClick={() =>
                                                setAdult((current) => {
                                                      return current === 1 ? current : current - 1;
                                                })
                                          }
                                    >
                                          <FontAwesomeIcon icon={faTrash} />
                                    </button>
                              </Col>
                        </Row>,
                  );
            }

            return adults;
      };

      const renderChildren = () => {
            let children = [];
            for (let i = adult; i < child + adult; i++) {
                  children.push(
                        <Row key={i} className="mb-4">
                              <Col lg={6}>
                                    <div className="form-outline">
                                          <input
                                                type="text"
                                                placeholder="Name"
                                                className="form-control"
                                                value={tickets[i]?.['name']}
                                                onChange={(e) => onChangeTicketInfo(e, i, 'name')}
                                          />
                                    </div>
                              </Col>
                              <Col lg={5}>
                                    <div className="form-outline">
                                          <input
                                                type="date"
                                                placeholder="Date of birth"
                                                className="form-control"
                                                value={tickets[i]?.['dob']}
                                                onChange={(e) => onChangeTicketInfo(e, i, 'dob')}
                                          />
                                    </div>
                              </Col>
                              <Col lg={1} className="p-0">
                                    <button
                                          className="btn w-100 btn-danger"
                                          onClick={() =>
                                                setChild((current) => {
                                                      return current === 1 ? current : current - 1;
                                                })
                                          }
                                    >
                                          <FontAwesomeIcon icon={faTrash} />
                                    </button>
                              </Col>
                        </Row>,
                  );
            }

            return children;
      };

      return (
            <>
                  <PageBanner title="Check out" />
                  <section className="bg-light py-5">
                        <Container>
                              <Row>
                                    <Col>
                                          <Card className="mb-4 border shadow-0">
                                                <div className="p-4 d-flex justify-content-between">
                                                      <div className="">
                                                            <h5>Have an account?</h5>
                                                            <p className="text-wrap">Log in for Exclusive Vouchers! </p>
                                                      </div>
                                                      <div className="d-flex align-items-center justify-content-center flex-column flex-md-row">
                                                            <a
                                                                  href="#"
                                                                  className="btn btn-outline-primary me-0 me-md-2 mb-2 mb-md-0 w-100"
                                                            >
                                                                  Register
                                                            </a>
                                                            <a
                                                                  href="#"
                                                                  className="btn btn-primary shadow-0 text-nowrap w-100"
                                                            >
                                                                  Sign in
                                                            </a>
                                                      </div>
                                                </div>
                                          </Card>

                                          <Card className="shadow-0 border">
                                                <div className="p-4">
                                                      <h5 className="card-title mb-3">Booking information</h5>
                                                      <Row>
                                                            <Col lg={6}>
                                                                  <p className="mb-0">First name</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="text"
                                                                              id="typeText"
                                                                              placeholder="Type here"
                                                                              className="form-control"
                                                                              value={bookingInfo['firstName']}
                                                                              onChange={(e) =>
                                                                                    onChangeBookingInfo(e, 'firstName')
                                                                              }
                                                                        />
                                                                  </div>
                                                            </Col>

                                                            <Col lg={6}>
                                                                  <p className="mb-0">Last name</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="text"
                                                                              id="typeText"
                                                                              placeholder="Type here"
                                                                              className="form-control"
                                                                              value={bookingInfo['lastName']}
                                                                              onChange={(e) =>
                                                                                    onChangeBookingInfo(e, 'lastName')
                                                                              }
                                                                        />
                                                                  </div>
                                                            </Col>

                                                            <Col lg={6}>
                                                                  <p className="mb-0">Phone</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="tel"
                                                                              id="typePhone"
                                                                              className="form-control"
                                                                              placeholder="Phone number"
                                                                              value={bookingInfo['phone']}
                                                                              onChange={(e) =>
                                                                                    onChangeBookingInfo(e, 'phone')
                                                                              }
                                                                        />
                                                                  </div>
                                                            </Col>

                                                            <Col lg={6}>
                                                                  <p className="mb-0">Email</p>

                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="email"
                                                                              id="typeEmail"
                                                                              placeholder="example@gmail.com"
                                                                              className="form-control"
                                                                              value={bookingInfo['email']}
                                                                              onChange={(e) =>
                                                                                    onChangeBookingInfo(e, 'email')
                                                                              }
                                                                        />
                                                                  </div>
                                                            </Col>
                                                      </Row>

                                                      <Row>
                                                            <div className="mb-3">
                                                                  <p className="mb-0">Address</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="text"
                                                                              id="typeText"
                                                                              placeholder="Type here"
                                                                              className="form-control"
                                                                              value={bookingInfo['address']}
                                                                              onChange={(e) =>
                                                                                    onChangeBookingInfo(e, 'address')
                                                                              }
                                                                        />
                                                                  </div>
                                                            </div>
                                                      </Row>

                                                      <hr className="my-4" />

                                                      <div className="mb-3">
                                                            <p className="mb-0">Note</p>
                                                            <div className="form-outline">
                                                                  <textarea
                                                                        className="form-control"
                                                                        id="textAreaExample1"
                                                                        rows="2"
                                                                        placeholder="Note here...."
                                                                        value={bookingInfo['notes']}
                                                                        onChange={(e) =>
                                                                              onChangeBookingInfo(e, 'notes')
                                                                        }
                                                                  ></textarea>
                                                            </div>
                                                      </div>

                                                      <h6 className="card-title mb-3">Adults</h6>
                                                      {renderAdults()}
                                                      <h6 className="card-title mb-3">Children</h6>
                                                      {renderChildren()}

                                                      <div className="float-end">
                                                            <button
                                                                  className="btn btn-light border px-4 py-2"
                                                                  onClick={() => {
                                                                        navigate(-1);
                                                                  }}
                                                            >
                                                                  Cancel
                                                            </button>
                                                            <span className="mx-1"></span>
                                                            <button
                                                                  className="btn btn-primary shadow-0 border px-4 py-2"
                                                                  onClick={onBook}
                                                            >
                                                                  Book
                                                            </button>
                                                      </div>
                                                </div>
                                          </Card>
                                    </Col>
                                    <Col className="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
                                          <div className="ms-lg-4 mt-4 mt-lg-0" style={{ maxWidth: 320 }}>
                                                <h6 className="mb-3">Summary</h6>
                                                <div className="d-flex justify-content-between">
                                                      <p className="mb-2">Adults (x{adult}):</p>
                                                      <p className="mb-2">
                                                            ${adult * location.state.tourdetails.price}
                                                      </p>
                                                </div>
                                                <div className="d-flex justify-content-between">
                                                      <p className="mb-2">Children (x{child}):</p>
                                                      <p className="mb-2">
                                                            $
                                                            {location.state.child *
                                                                  location.state.tourdetails.price *
                                                                  (1 - location.state.ticketTypes[1].deduction)}
                                                      </p>
                                                </div>

                                                <hr />
                                                <div className="d-flex justify-content-between">
                                                      <p className="mb-2">Total price:</p>
                                                      <p className="mb-2 fw-bold">${location.state.totalPrice}</p>
                                                </div>

                                                <div>
                                                      <div className="payment" role="document">
                                                            <div className="payment-content">
                                                                  <div className="payment-header pt-1 pl-2">
                                                                        <h6 className="payment-title">
                                                                              Payement methods
                                                                        </h6>
                                                                  </div>
                                                                  <div className="payment-body">
                                                                        <div className="form-check pt-4">
                                                                              <input
                                                                                    className="form-check-input"
                                                                                    type="radio"
                                                                                    name="paymentMethod"
                                                                                    id="paymentMethod1"
                                                                                    value="cash"
                                                                                    defaultChecked
                                                                              />
                                                                              <label
                                                                                    className="form-check-label"
                                                                                    htmlFor="paymentMethod1"
                                                                              >
                                                                                    <h6>Cash on delivery</h6>
                                                                              </label>
                                                                              <p className="justify">Pay with cash.</p>
                                                                        </div>
                                                                        <div className="form-check pt-4">
                                                                              <input
                                                                                    className="form-check-input"
                                                                                    type="radio"
                                                                                    name="paymentMethod"
                                                                                    id="paymentMethod2"
                                                                                    value="momo"
                                                                              />
                                                                              <label
                                                                                    className="form-check-label"
                                                                                    htmlFor="paymentMethod2"
                                                                              >
                                                                                    <h6>Momo</h6>
                                                                              </label>
                                                                              <p className="justify">
                                                                                    Pay with Momo banking.
                                                                              </p>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>

                                                <hr />

                                                <div className="d-flex align-items-center mb-4">
                                                      <div className="me-3 position-relative">
                                                            <img
                                                                  src={location.state.tourdetails.thumbnail}
                                                                  style={{ height: 96, width: 96 }}
                                                                  className="img-sm rounded border"
                                                            />
                                                      </div>
                                                      <div className="">
                                                            <a
                                                                  href={`/tour-detail/${location.state.tourdetails.id}/`}
                                                                  className="nav-link"
                                                            >
                                                                  {location.state.tourdetails.name}
                                                            </a>
                                                            <div className="price text-muted">
                                                                  <span className="p-2">
                                                                        <FontAwesomeIcon icon={faLocationDot} />
                                                                  </span>
                                                                  {location.state.tourdetails.destination.name}
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                    </Col>
                              </Row>
                        </Container>
                  </section>
            </>
      );
}

export default Checkout;
