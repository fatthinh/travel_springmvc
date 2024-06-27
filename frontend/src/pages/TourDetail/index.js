import React, { useState } from 'react';
import { Col, Container, Row, Tab, Tabs } from 'react-bootstrap';
import './tourdetail.scss';
import { useParams } from 'react-router-dom';
import TourInfo from '~/components/TourDetail/TourInfo';
import TourPlan from '~/components/TourDetail/TourPlan';
import TourGallery from '~/components/TourDetail/TourGallery';
import Booking from '~/components/TourDetail/Booking';
import PageBanner from '~/components/PageBanner';
import useFetch from '~/hooks/useFetch';
import config from '~/config';
import Checkout from '~/components/Checkout';

const TourDetail = () => {
      const { id } = useParams();
      const [checkoutVisible, setCheckoutVisible] = useState(false);

      const { data: tourDetails } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail-retrieve'](id)}`);
      const { data: tourPlan } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail-activities'](id)}`);
      const { data: tourGallery } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail-gallery'](id)}`);
      const { data: tourAvailable } = useFetch(`${config.BASE_URL}/${config.endpoints['tour-detail-available'](id)}`);

      return (
            <section>
                  <PageBanner title={tourDetails.name} />
                  <section className="single__page py-5">
                        <Container>
                              <Row>
                                    <Col lg={8}>
                                          {checkoutVisible ? (
                                                <Checkout />
                                          ) : (
                                                <section className="single__bio">
                                                      <Tabs
                                                            defaultActiveKey="home"
                                                            id="justify-tab-example"
                                                            className="mb-3"
                                                            justify
                                                      >
                                                            <Tab eventKey="home" title="Information">
                                                                  <TourInfo
                                                                        tourdetails={tourDetails}
                                                                        tourplan={tourPlan}
                                                                        tourGallery={tourGallery}
                                                                  />
                                                            </Tab>
                                                            <Tab eventKey="profile" title="Tour Plan">
                                                                  <TourPlan tourPlan={tourPlan} />
                                                            </Tab>
                                                            <Tab eventKey="longer-tab" title="Gallery">
                                                                  <TourGallery gallery={tourGallery} />
                                                            </Tab>
                                                      </Tabs>
                                                </section>
                                          )}
                                    </Col>

                                    <Col lg={4}>
                                          <Booking
                                                tourdetails={tourDetails}
                                                tourAvailable={tourAvailable}
                                                tourPlan={tourPlan}
                                                checkoutVisible={checkoutVisible}
                                                toggleCheckoutVisible={() => setCheckoutVisible((current) => !current)}
                                          />
                                    </Col>
                              </Row>
                        </Container>
                  </section>
            </section>
      );
};

export default TourDetail;
