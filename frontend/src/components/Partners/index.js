import React from 'react';
import { Container } from 'react-bootstrap';
// Import Swiper React components
import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';

const Partners = () => {
      const partners = [
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner1.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner2.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner2.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner4.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner5.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner6.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner1.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner2.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner2.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner4.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner5.svg',
            'https://astrip-wp.b-cdn.net/wp-content/uploads/2022/10/partner6.svg',
      ];
      return (
            <section className="pb-5">
                  <Container>
                        <Swiper
                              slidesPerView={6}
                              spaceBetween={100}
                              breakpoints={{
                                    0: {
                                          slidesPerView: 2,
                                    },
                                    767: {
                                          slidesPerView: 3,
                                    },
                                    992: {
                                          slidesPerView: 5,
                                    },
                                    1200: {
                                          slidesPerView: 6,
                                    },
                              }}
                              className="mySwiper"
                        >
                              {partners.map((items, index) => (
                                    <SwiperSlide key={index}>
                                          <img className="w-100" src={items} />
                                    </SwiperSlide>
                              ))}
                        </Swiper>
                  </Container>
            </section>
      );
};

export default Partners;
