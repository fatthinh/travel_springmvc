import { useState } from 'react';
import { Card, Col, Row } from 'react-bootstrap';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';
import config from '~/config';
import { bookingSelector } from '~/redux/selectors';

function Checkout() {
      const { adults, children, tourId } = useSelector(bookingSelector);

      const [bookingInfo, setBookingInfo] = useState({
            firstName: '',
            lastName: '',
            phone: '',
            email: '',
            address: '',
            notes: '',
      });

      const onChangeBookingInfo = (event, field) => {
            setBookingInfo((current) => {
                  return { ...current, [field]: event.target.value };
            });
      };

      const onBook = async (e) => {
            e.preventDefault();
            let tickets = [];
            for (let i = 0; i < adults; i++) {
                  tickets.push({ name: '', dob: '', ticketType: 1 });
            }
            for (let i = 0; i < children; i++) {
                  tickets.push({ name: '', dob: '', ticketType: 2 });
            }

            const booking = { ...bookingInfo, tourId, tickets };

            const res = await config.axiosConfig.post(config.endpoints.book, booking);
            console.log(res);
            console.log(booking);
      };

      //   const onChangeTicketInfo = (e, index, field) => {
      //         const currentTickets = [...tickets];
      //         currentTickets[index][field] = e.target.value;
      //         setTickets(currentTickets);

      //         console.log(tickets);
      //   };

      //   useEffect(() => {
      //         const items = [];
      //         for (let i = 0; i < adult; i++) {
      //               items.push({ name: '', dob: '', type: 1 });
      //         }
      //         for (let i = 0; i < child; i++) {
      //               items.push({ name: '', dob: '', type: 2 });
      //         }
      //         setTickets(items);
      //   }, [adult, child]);

      //   const renderAdults = () => {
      //         let adults = [];
      //         for (let i = 0; i < adult; i++) {
      //               adults.push(
      //                     <Row key={i} className="mb-4">
      //                           <Col lg={6}>
      //                                 <div className="form-outline">
      //                                       <input
      //                                             type="text"
      //                                             placeholder="Name"
      //                                             className="form-control"
      //                                             value={tickets[i]?.['name']}
      //                                             onChange={(e) => onChangeTicketInfo(e, i, 'name')}
      //                                       />
      //                                 </div>
      //                           </Col>
      //                           <Col lg={5}>
      //                                 <div className="form-outline">
      //                                       <input
      //                                             type="date"
      //                                             placeholder="Date of birth"
      //                                             className="form-control"
      //                                             value={tickets[i]?.['dob']}
      //                                             onChange={(e) => onChangeTicketInfo(e, i, 'dob')}
      //                                       />
      //                                 </div>
      //                           </Col>
      //                           <Col lg={1} className="p-0">
      //                                 <button
      //                                       className="btn w-100 btn-danger"
      //                                       onClick={() =>
      //                                             setAdult((current) => {
      //                                                   return current === 1 ? current : current - 1;
      //                                             })
      //                                       }
      //                                 >
      //                                       <FontAwesomeIcon icon={faTrash} />
      //                                 </button>
      //                           </Col>
      //                     </Row>,
      //               );
      //         }

      //         return adults;
      //   };

      //   const renderChildren = () => {
      //         let children = [];
      //         for (let i = adult; i < child + adult; i++) {
      //               children.push(
      //                     <Row key={i} className="mb-4">
      //                           <Col lg={6}>
      //                                 <div className="form-outline">
      //                                       <input
      //                                             type="text"
      //                                             placeholder="Name"
      //                                             className="form-control"
      //                                             value={tickets[i]?.['name']}
      //                                             onChange={(e) => onChangeTicketInfo(e, i, 'name')}
      //                                       />
      //                                 </div>
      //                           </Col>
      //                           <Col lg={5}>
      //                                 <div className="form-outline">
      //                                       <input
      //                                             type="date"
      //                                             placeholder="Date of birth"
      //                                             className="form-control"
      //                                             value={tickets[i]?.['dob']}
      //                                             onChange={(e) => onChangeTicketInfo(e, i, 'dob')}
      //                                       />
      //                                 </div>
      //                           </Col>
      //                           <Col lg={1} className="p-0">
      //                                 <button
      //                                       className="btn w-100 btn-danger"
      //                                       onClick={() =>
      //                                             setChild((current) => {
      //                                                   return current === 1 ? current : current - 1;
      //                                             })
      //                                       }
      //                                 >
      //                                       <FontAwesomeIcon icon={faTrash} />
      //                                 </button>
      //                           </Col>
      //                     </Row>,
      //               );
      //         }

      //         return children;
      //   };

      return (
            <>
                  <Card className="mb-4 border shadow-0">
                        <div className="p-4 d-flex justify-content-between">
                              <div className="">
                                    <h5>Have an account?</h5>
                                    <p className="text-wrap">Log in for Exclusive Vouchers! </p>
                              </div>
                              <div className="d-flex align-items-center justify-content-center flex-column flex-md-row">
                                    <Link
                                          to="/register"
                                          className="btn btn-outline-primary me-0 me-md-2 mb-2 mb-md-0 w-100"
                                    >
                                          Register
                                    </Link>
                                    <Link to="/login" className="btn btn-primary shadow-0 text-nowrap w-100">
                                          Sign in
                                    </Link>
                              </div>
                        </div>
                  </Card>
                  <form
                        onSubmit={(e) => {
                              e.preventDefault();
                        }}
                  >
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
                                                            onChange={(e) => onChangeBookingInfo(e, 'firstName')}
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
                                                            onChange={(e) => onChangeBookingInfo(e, 'lastName')}
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
                                                            onChange={(e) => onChangeBookingInfo(e, 'phone')}
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
                                                            onChange={(e) => onChangeBookingInfo(e, 'email')}
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
                                                            onChange={(e) => onChangeBookingInfo(e, 'address')}
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
                                                      onChange={(e) => onChangeBookingInfo(e, 'notes')}
                                                ></textarea>
                                          </div>
                                    </div>

                                    <div className="float-end">
                                          <span className="mx-1"></span>
                                          <button
                                                type="submit"
                                                className="btn btn-primary shadow-0 border px-4 py-2"
                                                onClick={onBook}
                                          >
                                                Book
                                          </button>
                                    </div>
                              </div>
                        </Card>
                  </form>
            </>
      );
}

export default Checkout;
