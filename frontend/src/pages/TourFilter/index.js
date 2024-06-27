import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import PageBanner from '~/components/PageBanner';
import { Button, Col, Container, Row } from 'react-bootstrap';
import '~/components/TourSlide/tourslide.scss';
import { LinkContainer } from 'react-router-bootstrap';

const TourFilter = () => {
      const [currentPage, setCurrentPage] = useState(1);
      const [data, setData] = useState([]);
      const [userInput, setUserInput] = useState({
            type: '',
            month: '',
            destination: '',
      });

      const location = useLocation();

      useEffect(() => {
            if (location.state && location.state.filteredTour) {
                  setData(location.state.filteredTour);
                  setUserInput({
                        type: location.state.type,
                        month: location.state.month,
                        destination: location.state.destination,
                  });
            }
      }, [location.state.filteredTour]);

      const recordsPerPage = 3;
      const lastIndex = currentPage * recordsPerPage;
      const firstIndex = lastIndex - recordsPerPage;
      const records = data.slice(firstIndex, lastIndex);
      const nPages = Math.ceil(data.length / recordsPerPage);
      const numberOfPages = [...Array(nPages + 1).keys()].slice(1);

      console.log(records);

      const afterdiscount = (item) => {
            const discountAmount = (item.discount / 100) * item.price;
            return item.price - discountAmount;
      };

      const prePage = () => {
            if (currentPage !== 1) {
                  setCurrentPage(currentPage - 1);
            }
      };
      const nextPage = () => {
            if (currentPage !== nPages) {
                  setCurrentPage(currentPage + 1);
            }
      };
      const changeCurrentPage = (id) => {
            setCurrentPage(id);
      };
      return (
            <section>
                  <PageBanner
                        destination={userInput.destination}
                        month={userInput.month}
                        type={userInput.type}
                        title="Package For Your Choice"
                  />
                  <section className="findfilter">
                        <Container className="tour__slide__sec">
                              <Row className="my-5">
                                    {!location.state.filteredTour === null ? (
                                          <h1>No tours</h1>
                                    ) : (
                                          records.map((item, index) => (
                                                <Col key={index} lg={4} className="mb-5 pb-4 pt-3 card__col">
                                                      <div className="img__con mb-3">
                                                            <img className="w-100" style={{height: 340}} src={item.thumbnail} />
                                                      </div>
                                                      <div className="desc ">
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
                                                                  <p>{`${item.tourActivityCollection.length} Days / ${
                                                                        item.tourActivityCollection.length + 1
                                                                  } Nights`}</p>
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
                                                </Col>
                                          ))
                                    )}
                              </Row>
                              {records.length === 0 ? (
                                    'Please Select Your Choice Of Travel'
                              ) : (
                                    <nav aria-label="Page navigation example" className="page__nav">
                                          <ul className="pagination">
                                                <li className="page-item prev">
                                                      <a className="page-link" aria-label="Previous" onClick={prePage}>
                                                            <span aria-hidden="true">«</span>
                                                      </a>
                                                </li>

                                                {numberOfPages &&
                                                      numberOfPages.map((number, index) => (
                                                            <li
                                                                  className={`page-item ${
                                                                        currentPage === number ? 'active' : ''
                                                                  }`}
                                                                  key={index}
                                                            >
                                                                  <a
                                                                        className="page-link"
                                                                        onClick={() => changeCurrentPage(number)}
                                                                  >
                                                                        {number}
                                                                  </a>
                                                            </li>
                                                      ))}
                                                <li className="page-item next">
                                                      <a className="page-link" aria-label="Next" onClick={nextPage}>
                                                            <span aria-hidden="true">&raquo;</span>
                                                      </a>
                                                </li>
                                          </ul>
                                    </nav>
                              )}
                        </Container>
                  </section>
            </section>
      );
};

export default TourFilter;
