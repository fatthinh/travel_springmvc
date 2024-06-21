import React from 'react';
import './blog.scss';
import PageBanner from '~/components/PageBanner';
import { Button, Col, Container, Form, Row } from 'react-bootstrap';
import { blog } from '~/data/blogs';
import { LinkContainer } from 'react-router-bootstrap';

const Blogs = () => {
      return (
            <section>
                  <PageBanner title="Astrip Blogs" />
                  <section className="blog__page my-5">
                        <Container>
                              <Row>
                                    <Col lg={8}>
                                          <Row className="d-flex flex-wrap gap-4">
                                                {blog.map((item, index) => (
                                                      <LinkContainer key={index} to={`/blogs/${item.id}`}>
                                                            <Col className="blog__card my-3">
                                                                  <div className="img__con">
                                                                        <img className="w-100" src={item.thumbnail} />
                                                                  </div>
                                                                  <div className="cat__box">{item.category}</div>
                                                                  <div className="text__con text-center pt-4 px-3">
                                                                        <h6>{item.title}</h6>
                                                                        <p className="d-flex justify-content-center gap-3 align-items-center pt-2">
                                                                              <i className="bi bi-calendar-check" />
                                                                              {item.createdAt}
                                                                        </p>
                                                                  </div>
                                                            </Col>
                                                      </LinkContainer>
                                                ))}
                                          </Row>
                                    </Col>
                                    <Col lg={4} className="right__sec ps-4 pt-2">
                                          <h4>Trending Stories</h4>
                                          <section className="trend__sec mt-3">
                                                {blog.map((item, index) => (
                                                      <LinkContainer key={index} to={`/blogs/${item.id}`}>
                                                            <Row className="trend__card mb-3">
                                                                  <Col lg={4}>
                                                                        <img className="w-100" src={item.thumbnail} />
                                                                  </Col>
                                                                  <Col lg={8} className="ps-0 ">
                                                                        <p className="title">{item.title}</p>
                                                                        <p className="date">{item.createdAt}</p>
                                                                  </Col>
                                                            </Row>
                                                      </LinkContainer>
                                                ))}
                                          </section>
                                          <div className="newsletter">
                                                <div className="d-flex flex-column align-items-center mb-5">
                                                      <h2>Join Newsletter</h2>
                                                      <p>
                                                            Etiam rhoncus. Maecenas temp us, tellus eget condimentum rho
                                                      </p>
                                                </div>
                                                <div>
                                                      <Form>
                                                            <Form.Group className="mb-3" controlId="formBasicText">
                                                                  <Form.Control type="text" placeholder="Your Name" />
                                                            </Form.Group>
                                                            <Form.Group className="mb-5" controlId="formBasicEmail">
                                                                  <Form.Control
                                                                        type="email"
                                                                        placeholder="Enter email"
                                                                  />
                                                            </Form.Group>
                                                            <Button className="find__now">
                                                                  <div>
                                                                        <span className="transition" />
                                                                        <span className="label">Find Now</span>
                                                                  </div>
                                                            </Button>
                                                      </Form>
                                                </div>
                                          </div>
                                    </Col>
                              </Row>
                        </Container>
                  </section>
            </section>
      );
};

export default Blogs;
