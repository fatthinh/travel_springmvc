import React, { useState } from 'react';
import './home.scss';
import { Col, Container, Row } from 'react-bootstrap';
import Hero from '~/components/Hero';
import Filter from '~/components/Filter';
import PopularTour from '~/components/PopularTour';
import DealHome from '~/components/DealHome';
import Heading from '~/components/Heading';
import DestinationHome from '~/components/DestinationHome';
import Parralax from '~/components/Paralax';
import TourSlide from '~/components/TourSlide';
import CountUp from 'react-countup';
import ScrollTrigger from 'react-scroll-trigger';
import BlogHome from '~/components/BlogHome';

const Home = () => {
      const [countStart, setCountStart] = useState(false);

      return (
            <section className="home__sec">
                  <Hero />
                  <Filter />
                  <Heading title="TRAVEL CATEGORY" subtitle="Our Popular Tours Type" />
                  <PopularTour />
                  {/* <Heading title="DEALS & OFFER" subtitle="Amazing Deals!" />
                  <DealHome /> */}
                  <Heading title="DESTINATION" subtitle="Your Desired Destination" />
                  <DestinationHome />
                  <Parralax />
                  {/* <FqaForm /> */}

                  <Heading title="CHOOSE YOUR TOUR" subtitle="Get The Best Plans For Your’s" />
                  <TourSlide />
                  <section className="counter__sec">
                        <Container>
                              <ScrollTrigger onEnter={() => setCountStart(true)} onExit={() => setCountStart(false)}>
                                    <Row className="counter__con">
                                          <Col
                                                lg={3}
                                                md={6}
                                                className="d-flex flex-column justify-content-center align-items-center"
                                          >
                                                <i className="bi bi-globe-asia-australia"></i>
                                                <h2>{countStart && <CountUp end={400} duration={5} suffix="+" />}</h2>
                                                <p>Awesome Tour</p>
                                          </Col>
                                          <Col
                                                lg={3}
                                                md={6}
                                                className="d-flex flex-column justify-content-center align-items-center"
                                          >
                                                <i className="bi bi-geo-alt-fill"></i>
                                                <h2>{countStart && <CountUp end={250} duration={5} suffix="+" />}</h2>
                                                <p>Stunning Places</p>
                                          </Col>
                                          <Col
                                                lg={3}
                                                md={6}
                                                className="d-flex flex-column justify-content-center align-items-center"
                                          >
                                                <i className="bi bi-award"></i>
                                                <h2>{countStart && <CountUp end={650} duration={5} suffix="+" />}</h2>
                                                <p>Satisfied Customer</p>
                                          </Col>
                                          <Col
                                                lg={3}
                                                md={6}
                                                className="d-flex flex-column justify-content-center align-items-center"
                                          >
                                                <i className="bi bi-people-fill"></i>
                                                <h2>{countStart && <CountUp end={500} duration={5} suffix="+" />}</h2>
                                                <p>Travel Guides</p>
                                          </Col>
                                    </Row>
                              </ScrollTrigger>
                        </Container>
                  </section>
                  <Heading title="BLOGS & NEWS" subtitle="Get to Know Travel Experiences" />
                  <BlogHome />
            </section>
      );
};

export default Home;
