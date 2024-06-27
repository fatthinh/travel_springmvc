import React, { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowRight, faMinusCircle, faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import './booking.scss';
import useFetch from '~/hooks/useFetch';
import config from '~/config';
import { useDispatch, useSelector } from 'react-redux';
import { bookingSelector } from '~/redux/selectors';
import bookingSlice from '~/redux/slices/bookingSlice';

const Booking = ({ tourdetails, tourAvailable, tourPlan, checkoutVisible, toggleCheckoutVisible }) => {
      const dispatch = useDispatch();

      const [adult, setAdult] = useState(1);
      const [child, setChild] = useState(0);
      const [totalPrice, setTotalPrice] = useState();
      const [selectedTour, setSelectedTour] = useState();
      const { data: ticketTypes } = useFetch(`${config.BASE_URL}/${config.endpoints['ticket-types']}`);

      const afterdiscount = () => {
            return tourdetails.price * (1 - selectedTour?.discount);
      };

      const handleIncrement = () => {
            setAdult(adult + 1);
      };

      const handleDecrement = () => {
            if (adult <= 1) {
                  return;
            } else {
                  setAdult(adult - 1);
            }
      };

      const handleChildInc = () => {
            setChild(child + 1);
      };

      const handleChildDec = () => {
            if (child <= 0) {
                  return;
            } else {
                  setChild(child - 1);
            }
      };

      const total = () => {
            const adultPrice = adult * afterdiscount();
            const childPrice = child * afterdiscount() * (1 - ticketTypes[1]?.deduction);
            const totalPrice = adultPrice + childPrice;
            if (totalPrice) setTotalPrice(totalPrice.toFixed(2));
      };

      useEffect(() => {
            dispatch(bookingSlice.actions.setAdults(adult));
            dispatch(bookingSlice.actions.setChildren(child));
            dispatch(bookingSlice.actions.setTourId(selectedTour?.id));

            total();
      }, [adult, child, selectedTour]);

      useEffect(() => {
            total();
            setSelectedTour(tourAvailable[0]);
      }, [tourAvailable]);

      const formatDate = (timestamp) => {
            const date = new Date(timestamp);
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const year = date.getFullYear();
            return `${day}/${month}/${year}`;
      };

      return (
            <>
                  <section className="booking__card py-5 px-4">
                        <div className="heading text-center mb-4">
                              <h3>Book The Tour</h3>
                        </div>
                        <div className="available__con">
                              <h5>Available</h5>

                              {tourAvailable.map((item, index) => {
                                    return (
                                          <div className="inputGroup" key={index}>
                                                <input
                                                      id={`available-${index}`}
                                                      name="available"
                                                      type="radio"
                                                      onChange={() => setSelectedTour(item)}
                                                      checked={selectedTour?.departureDate === item?.departureDate}
                                                />
                                                <label htmlFor={`available-${index}`}>
                                                      {formatDate(item.departureDate)}
                                                </label>
                                          </div>
                                    );
                              })}
                        </div>
                        <div className="check__con d-flex justify-content-between align-items-center pb-4">
                              <div className="check">
                                    <p>Departure</p>
                                    <p>{formatDate(selectedTour?.departureDate)}</p>
                              </div>
                              <FontAwesomeIcon icon={faArrowRight} className="d-none d-sm-block" />
                              <div className="check">
                                    <p>Return</p>
                                    <p>{formatDate(selectedTour?.departureDate + 86400000 * tourPlan.length)}</p>
                              </div>
                        </div>
                        <div className="price__main">
                              {ticketTypes.map((item, index) => {
                                    return (
                                          <div
                                                key={index}
                                                className="price__con d-flex justify-content-between py-4 align-items-center"
                                          >
                                                <div className="price">
                                                      <p>
                                                            {item.name} : $
                                                            {(tourdetails.price * (1 - item.deduction)).toFixed(2) *
                                                                  (index === 0 ? adult : child)}
                                                      </p>
                                                </div>
                                                <div className="counter">
                                                      <div className="d-flex gap-3 align-items-center justify-content-between">
                                                            <a onClick={index === 0 ? handleDecrement : handleChildDec}>
                                                                  <FontAwesomeIcon icon={faMinusCircle} />
                                                            </a>

                                                            <p>{index === 0 ? adult : child}</p>
                                                            <a onClick={index === 0 ? handleIncrement : handleChildInc}>
                                                                  <FontAwesomeIcon icon={faPlusCircle} />
                                                            </a>
                                                      </div>
                                                </div>
                                          </div>
                                    );
                              })}
                        </div>
                        <div className="total__con text-center pt-4">
                              <p>
                                    Total Price: <span>${totalPrice}</span>
                                    {afterdiscount() === tourdetails.price ? (
                                          ''
                                    ) : (
                                          <>
                                                /
                                                <del>
                                                      $
                                                      {tourdetails.price * adult +
                                                            tourdetails.price * child * ticketTypes[1]?.deduction}
                                                </del>
                                          </>
                                    )}
                              </p>
                        </div>
                        <div className="d-flex justify-content-center pt-4">
                              <Button className="find__now" onClick={toggleCheckoutVisible}>
                                    <div>
                                          <span className="transition" />
                                          <span className="label">{checkoutVisible ? 'Back' : 'Book Now'}</span>
                                    </div>
                              </Button>
                        </div>
                  </section>
            </>
      );
};

export default Booking;
