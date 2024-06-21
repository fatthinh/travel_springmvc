import React, { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowRight, faMinusCircle, faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import './booking.scss';
import { useNavigate } from 'react-router-dom';

const Booking = ({ tourdetails, tourAvailable, tourPlan }) => {
      const [adult, setAdult] = useState(1);
      const [child, setChild] = useState(0);
      const [totalPrice, setTotalPrice] = useState();
      const [selectedTour, setSelectedTour] = useState();
      const navigate = useNavigate();

      const afterdiscount = () => {
            const price = tourdetails.price;
            const discountAmount = (selectedTour?.discount / 100) * price;
            return price - discountAmount;
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
            const childPrice = child * afterdiscount() * 0.3;
            const totalPrice = adultPrice + childPrice;
            if (totalPrice) setTotalPrice(totalPrice);
      };

      useEffect(() => {
            total();
      }, [adult, child]);

      useEffect(() => {
            total();
            setSelectedTour(tourAvailable[0]);
      }, [tourAvailable]);

      const dateFormat = (time) => {
            const date = new Date(time);
            return `${date.getDate()}/${
                  date.getMonth() < 10 ? '0' + date.getMonth() : date.getMonth()
            }/${date.getFullYear()}`;
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
                                          <div class="inputGroup" key={index}>
                                                <input
                                                      id={`available-${index}`}
                                                      name="available"
                                                      type="radio"
                                                      onChange={() => setSelectedTour(item)}
                                                      checked={selectedTour?.departureDate === item?.departureDate}
                                                />
                                                <label htmlFor={`available-${index}`}>
                                                      {dateFormat(item.departureDate)}
                                                </label>
                                          </div>
                                    );
                              })}
                        </div>
                        <div className="check__con d-flex justify-content-between align-items-center pb-4">
                              <div className="check">
                                    <p>Departure</p>
                                    <p>{dateFormat(selectedTour?.departureDate)}</p>
                              </div>
                              <FontAwesomeIcon icon={faArrowRight} className="d-none d-sm-block" />
                              <div className="check">
                                    <p>Return</p>
                                    <p>{dateFormat(selectedTour?.departureDate + 86400000 * tourPlan.length)}</p>
                              </div>
                        </div>
                        <div className="price__main">
                              <div className="price__con d-flex justify-content-between py-4 align-items-center">
                                    <div className="price">
                                          <p>
                                                Adult: ${afterdiscount()}
                                                {afterdiscount() == tourdetails.price
                                                      ? ''
                                                      : `/${(<del>${tourdetails.price}</del>)}`}
                                          </p>
                                    </div>
                                    <div className="counter">
                                          <div className="d-flex gap-3 align-items-center justify-content-between">
                                                <a onClick={handleDecrement}>
                                                      <FontAwesomeIcon icon={faMinusCircle} />
                                                </a>

                                                <p>{adult}</p>
                                                <a onClick={handleIncrement}>
                                                      <FontAwesomeIcon icon={faPlusCircle} />
                                                </a>
                                          </div>
                                    </div>
                              </div>
                              <div className="price__con d-flex justify-content-between pb-4 align-items-center">
                                    <div className="price">
                                          <p>Children: ${tourdetails.price * 0.3}</p>
                                    </div>
                                    <div className="counter">
                                          <div className="d-flex gap-3 align-items-center justify-content-between">
                                                <a onClick={handleChildDec}>
                                                      <FontAwesomeIcon icon={faMinusCircle} />
                                                </a>
                                                <p>{child}</p>
                                                <a onClick={handleChildInc}>
                                                      <FontAwesomeIcon icon={faPlusCircle} />
                                                </a>
                                          </div>
                                    </div>
                              </div>
                        </div>
                        <div className="total__con text-center pt-4">
                              <p>
                                    Total Price: <span>${totalPrice}</span>
                              </p>
                        </div>
                        <div className="d-flex justify-content-center pt-4">
                              <Button
                                    className="find__now"
                                    onClick={() => {
                                          navigate('/checkout', {
                                                state: { tourdetails, adult, child, totalPrice, selectedTour },
                                          });
                                    }}
                              >
                                    <div>
                                          <span className="transition" />
                                          <span className="label">Book Now</span>
                                    </div>
                              </Button>
                        </div>
                  </section>
            </>
      );
};

export default Booking;
