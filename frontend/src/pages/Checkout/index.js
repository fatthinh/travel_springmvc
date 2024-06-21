import { Card, Col, Container, Row } from 'react-bootstrap';
import PageBanner from '~/components/PageBanner';
import './checkout.scss';
import { useLocation, useNavigate } from 'react-router-dom';
import images from '~/assets/images';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLocationDot } from '@fortawesome/free-solid-svg-icons';

function Checkout() {
      const location = useLocation();
      const navigate = useNavigate();

      console.log(location.state);

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
                                                      <h5 className="card-title mb-3">Guest checkout</h5>
                                                      <Row>
                                                            <Col lg={6}>
                                                                  <p className="mb-0">First name</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="text"
                                                                              id="typeText"
                                                                              placeholder="Type here"
                                                                              className="form-control"
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
                                                                        />
                                                                  </div>
                                                            </Col>

                                                            <Col lg={6}>
                                                                  <p className="mb-0">Phone</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="tel"
                                                                              id="typePhone"
                                                                              //   value="+84"
                                                                              className="form-control"
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
                                                                        />
                                                                  </div>
                                                            </Col>
                                                      </Row>

                                                      <Row>
                                                            <div className="col-sm-8 mb-3">
                                                                  <p className="mb-0">Address</p>
                                                                  <div className="form-outline">
                                                                        <input
                                                                              type="text"
                                                                              id="typeText"
                                                                              placeholder="Type here"
                                                                              className="form-control"
                                                                        />
                                                                  </div>
                                                            </div>

                                                            <div className="col-sm-4 mb-3">
                                                                  <p className="mb-0">City</p>
                                                                  <select className="form-select">
                                                                        <option value="1">New York</option>
                                                                        <option value="2">Moscow</option>
                                                                        <option value="3">Samarqand</option>
                                                                  </select>
                                                            </div>
                                                      </Row>
                                                      {/* 
                                                      <div className="form-check">
                                                            <input
                                                                  className="form-check-input"
                                                                  type="checkbox"
                                                                  value=""
                                                                  id="flexCheckDefault"
                                                            />
                                                            <label className="form-check-label" htmlFor="flexCheckDefault">
                                                                  Keep me up to date on news
                                                            </label>
                                                      </div> */}

                                                      <hr className="my-4" />

                                                      <h5 className="card-title mb-3">Other Extra Services</h5>

                                                      <Row>
                                                            <Col lg={4} className="mb-3">
                                                                  <div className="form-check h-100 border rounded-3">
                                                                        <div className="p-3">
                                                                              <input
                                                                                    className="form-check-input"
                                                                                    type="checkbox"
                                                                                    name="flexRadioDefault"
                                                                                    id="flexRadioDefault1"
                                                                              />
                                                                              <label
                                                                                    className="form-check-label"
                                                                                    htmlFor="flexRadioDefault1"
                                                                              >
                                                                                    Pick-up and drop-off <br />
                                                                                    <small className="text-muted">
                                                                                          $80
                                                                                    </small>
                                                                              </label>
                                                                        </div>
                                                                  </div>
                                                            </Col>
                                                      </Row>

                                                      <div className="mb-3">
                                                            <p className="mb-0">Note</p>
                                                            <div className="form-outline">
                                                                  <textarea
                                                                        className="form-control"
                                                                        id="textAreaExample1"
                                                                        rows="2"
                                                                  ></textarea>
                                                            </div>
                                                      </div>

                                                      <div className="float-end">
                                                            <button
                                                                  className="btn btn-light border"
                                                                  onClick={() => {
                                                                        navigate(-1);
                                                                  }}
                                                            >
                                                                  Cancel
                                                            </button>
                                                            <span className="mx-1"></span>
                                                            <button className="btn btn-success shadow-0 border">
                                                                  Place Order
                                                            </button>
                                                      </div>
                                                </div>
                                          </Card>
                                    </Col>
                                    <Col className="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
                                          <div className="ms-lg-4 mt-4 mt-lg-0" style={{ maxWidth: 320 }}>
                                                <h6 className="mb-3">Summary</h6>
                                                <div className="d-flex justify-content-between">
                                                      <p className="mb-2">Adults (x{location.state.adult}):</p>
                                                      <p className="mb-2">
                                                            ${location.state.adult * location.state.tourdetails.price}
                                                      </p>
                                                </div>
                                                <div className="d-flex justify-content-between">
                                                      <p className="mb-2">Children (x{location.state.child}):</p>
                                                      <p className="mb-2">
                                                            $
                                                            {location.state.child *
                                                                  location.state.tourdetails.price *
                                                                  0.3}
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
                                                                  src={images.logo}
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
