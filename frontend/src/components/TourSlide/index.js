import React from 'react';
import { Button, Container } from 'react-bootstrap';
import { tour } from '~/data/tour';
// Import Swiper React components
import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';
import './tourslide.scss';
// import required modules
// import { Navigation } from 'swiper';

// Core modules imports are same as usual
import { Navigation } from 'swiper/modules';
// Direct React component imports
// import { Swiper, SwiperSlide } from 'swiper/swiper-react.mjs';
import { LinkContainer } from 'react-router-bootstrap';

const TourSlide = () => {
      const afterdiscount = (item) => {
            const discountAmount = (item.discount / 100) * item.price;
            return item.price - discountAmount;
      };
      return (
            <section className="tour__slide__sec">
                  <Container>
                        <Swiper
                              slidesPerView={3}
                              spaceBetween={10}
                              breakpoints={{
                                    0: {
                                          slidesPerView: 1,
                                    },
                                    768: {
                                          slidesPerView: 2,
                                    },
                                    1200: {
                                          slidesPerView: 3,
                                    },
                              }}
                              navigation={true}
                              modules={[Navigation]}
                              className="mySwiper"
                        >
                              {tour.map((item, index) => (
                                    <SwiperSlide key={index}>
                                          <div className="img__con mb-3">
                                                <img className="w-100" src={item.thumbnail} />
                                          </div>
                                          <div className="desc p-4">
                                                {item.discount ? (
                                                      <p className="price">
                                                            {`From $${afterdiscount(item)}/`}
                                                            <del>{item.price}</del>
                                                      </p>
                                                ) : (
                                                      <p className="price">{`From $${item.price}`}</p>
                                                )}
                                                <h4 className="name">{item.name}</h4>
                                                <div className="duration d-flex align-items-center gap-3 mb-4">
                                                      <i className="bi bi-clock" />
                                                      <p>{`${item.duration.days} Days / ${item.duration.night} Nights`}</p>
                                                </div>
                                                <div className="inclusion">
                                                      <h4>Included Package Facility:</h4>
                                                      <ul className="d-flex flex-column">
                                                            {item.included.map((includ, index) => (
                                                                  <li key={index}>
                                                                        <i className="bi bi-check-lg" />
                                                                        {includ}
                                                                  </li>
                                                            ))}
                                                      </ul>
                                                </div>
                                                <LinkContainer to={`/tour-detail/${item.id}`}>
                                                      <Button className="find__now mt-4">
                                                            <div>
                                                                  <span className="transition" />
                                                                  <span className="label">Explore Now</span>
                                                            </div>
                                                      </Button>
                                                </LinkContainer>
                                          </div>
                                    </SwiperSlide>
                              ))}
                        </Swiper>
                  </Container>
            </section>
      );
};

export default TourSlide;
