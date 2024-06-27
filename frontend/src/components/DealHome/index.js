import React from 'react';
import './dealhome.scss';
import { Button, Container } from 'react-bootstrap';

// Import Swiper React components
import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';

// import required modules
import { Navigation } from 'swiper/modules';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { commonSelector } from '~/redux/selectors';

const DealHome = () => {
      const { tours } = useSelector(commonSelector);
      const offers = tours.filter((item) => {
            // if (item.discount) {
            //       return item;
            // }
            return item;
      });

      const afterdiscount = (item) => {
            const discountAmount = (item.discount / 100) * item.price;
            return item.price - discountAmount;
      };

      return (
            <section className="deal__sec ">
                  <Container>
                        <Swiper
                              slidesPerView={4}
                              spaceBetween={10}
                              breakpoints={{
                                    0: {
                                          slidesPerView: 1,
                                    },
                                    480: {
                                          slidesPerView: 2,
                                    },
                                    768: {
                                          slidesPerView: 3,
                                    },
                                    1200: {
                                          slidesPerView: 4,
                                    },
                              }}
                              navigation={true}
                              modules={[Navigation]}
                              className="mySwiper"
                        >
                              {offers.map((item, index) => (
                                    <SwiperSlide key={index}>
                                          <div className="img__con">
                                                <img src={item.thumbnail} />
                                          </div>
                                          <div className="desc">
                                                <h4>{item.name}</h4>
                                                <p>
                                                      {`From $${afterdiscount(item)}/`}
                                                      <del>{item.price}</del>
                                                </p>
                                                <Link to={`/tour/${item.id}`}>
                                                      <Button className="find__now mt-4">
                                                            <div>
                                                                  <span className="transition" />
                                                                  <span className="label">Explore Now</span>
                                                            </div>
                                                      </Button>
                                                </Link>
                                                <div className="discount__con">{`${item.discount}%`}</div>
                                          </div>
                                    </SwiperSlide>
                              ))}
                        </Swiper>
                  </Container>
            </section>
      );
};

export default DealHome;
