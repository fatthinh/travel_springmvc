import React from 'react';
import { Button, Container } from 'react-bootstrap';
// import { tour } from '~/data/tour';
// Import Swiper React components
import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';
import './tourslide.scss';
// import required modules

// Core modules imports are same as usual
import { Navigation } from 'swiper/modules';
import { Link } from 'react-router-dom';
import useFetch from '~/hooks/useFetch';
import config from '~/config';
// Direct React component imports

const TourSlide = () => {
      const { data: tour, loading, error } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail']}`);

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
                                                <img className="w-100" style={{ height: 320 }} src={item.thumbnail} />
                                          </div>
                                          <div className="desc p-4">
                                                <p className="price">{`From $${item.price}`}</p>
                                                <h4 className="name">{item.name}</h4>
                                                <div className="duration d-flex align-items-center gap-3 mb-4">
                                                      <i className="bi bi-clock" />
                                                      <p>{`${item.tourActivityCollection.length} Days / ${
                                                            item.tourActivityCollection.length + 1
                                                      } Nights`}</p>
                                                </div>

                                                <Link to={`/tour-detail/${item.id}`}>
                                                      <Button className="find__now mt-4">
                                                            <div>
                                                                  <span className="transition" />
                                                                  <span className="label">Explore Now</span>
                                                            </div>
                                                      </Button>
                                                </Link>
                                          </div>
                                    </SwiperSlide>
                              ))}
                        </Swiper>
                  </Container>
            </section>
      );
};

export default TourSlide;
