import { Col, Row } from 'react-bootstrap';
import './profile.scss';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faEnvelope } from '@fortawesome/free-regular-svg-icons';
import { faBook, faCircleInfo, faInfo, faLocationDot, faPhone } from '@fortawesome/free-solid-svg-icons';
import { Link, useNavigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { authSelector } from '~/redux/selectors';
import { useEffect } from 'react';
import authSlice from '~/redux/slices/authSlice';
function Profile() {
      const currentUser = useSelector(authSelector);
      const navigate = useNavigate();
      const dispatch = useDispatch();

      useEffect(() => {
            if (!currentUser) {
                  navigate('/login');
            }
      }, [currentUser]);

      const handleLogout = (e) => {
            e.preventDefault();
            dispatch(authSlice.actions.logout());
            navigate('/');
      };

      return (
            <main className="profile">
                  <div className="container">
                        <div className="profile-container">
                              {currentUser ? (
                                    <Row className="gy-md-3">
                                          <Col className="col-3 col-xl-4 col-lg-5 col-md-12">
                                                <aside className="profile__sidebar">
                                                      <div className="profile-user">
                                                            <img
                                                                  src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719465234/qlgb6hmsm3ryeszladwr.jpg"
                                                                  alt=""
                                                                  className="profile-user__avatar"
                                                            />
                                                            <h1 className="profile-user__name">
                                                                  {currentUser.firstName} {currentUser.lastName}
                                                            </h1>
                                                            <p className="profile-user__desc">{currentUser.email}</p>
                                                      </div>

                                                      <div className="profile-menu">
                                                            <h5 className="profile-menu__title">Manage Account</h5>
                                                            <ul className="profile-menu__list">
                                                                  <li>
                                                                        <Link
                                                                              to="./edit-personal-info.html"
                                                                              className="profile-menu__link"
                                                                        >
                                                                              <span className="profile-menu__icon">
                                                                                    <FontAwesomeIcon icon={faUser} />
                                                                              </span>
                                                                              Personal info
                                                                        </Link>
                                                                  </li>

                                                                  <li>
                                                                        <Link to="#!" className="profile-menu__link">
                                                                              <span className="profile-menu__icon">
                                                                                    <FontAwesomeIcon icon={faBook} />
                                                                              </span>
                                                                              Communications & privacy
                                                                        </Link>
                                                                  </li>
                                                            </ul>
                                                      </div>

                                                      <div className="profile-menu">
                                                            <h5 className="profile-menu__title">Customer Service</h5>
                                                            <ul className="profile-menu__list">
                                                                  <li>
                                                                        <Link to="#!" className="profile-menu__link">
                                                                              <span className="profile-menu__icon">
                                                                                    <FontAwesomeIcon
                                                                                          icon={faCircleInfo}
                                                                                    />
                                                                              </span>
                                                                              Help
                                                                        </Link>
                                                                  </li>
                                                                  <li>
                                                                        <Link to="#!" className="profile-menu__link">
                                                                              <span className="profile-menu__icon">
                                                                                    <FontAwesomeIcon icon={faInfo} />
                                                                              </span>
                                                                              Terms of Use
                                                                        </Link>
                                                                  </li>
                                                            </ul>
                                                      </div>

                                                      <div className="profile-menu">
                                                            <button className="btn btn-primary" onClick={handleLogout}>
                                                                  Logout
                                                            </button>
                                                      </div>
                                                </aside>
                                          </Col>

                                          <Col className="col-9 col-xl-8 col-lg-7 col-md-12">
                                                <div className="cart-info">
                                                      <Row className="gy-3">
                                                            <Col>
                                                                  <h2 className="cart-info__heading">My travels</h2>
                                                                  <p className="cart-info__desc profile__desc">
                                                                        2 travels
                                                                  </p>

                                                                  <Row className="gy-md-2 row-cols-3 row-cols-xl-2 row-cols-lg-1">
                                                                        <Col className="">
                                                                              <article className="payment-card">
                                                                                    <img
                                                                                          src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1708499355/ojojmlbsv3qt0euym56y.jpg"
                                                                                          alt=""
                                                                                          className="payment-card__img"
                                                                                    />
                                                                                    <div className="payment-card__top d-flex justify-content-between">
                                                                                          <span className="payment-card__type">
                                                                                                Ho Chi Minh Tour
                                                                                          </span>
                                                                                          <button className="btn btn-primary">
                                                                                                Rating
                                                                                          </button>
                                                                                    </div>
                                                                                    <div className="payment-card__bottom">
                                                                                          <div>
                                                                                                <p className="payment-card__label">
                                                                                                      From
                                                                                                </p>
                                                                                                <p className="payment-card__value">
                                                                                                      22/08/2023
                                                                                                </p>
                                                                                          </div>
                                                                                          <div className="payment-card__expired">
                                                                                                <p className="payment-card__label">
                                                                                                      To
                                                                                                </p>
                                                                                                <p className="payment-card__value">
                                                                                                      28/08/2023
                                                                                                </p>
                                                                                          </div>
                                                                                    </div>
                                                                              </article>
                                                                        </Col>
                                                                  </Row>
                                                            </Col>

                                                            <div className="col-12">
                                                                  <h2 className="cart-info__heading">Account info</h2>
                                                                  <p className="cart-info__desc profile__desc">
                                                                        Addresses, contact information and password
                                                                  </p>
                                                                  <Row className="gy-md-1 row-cols-lg-1 row-cols-xl-2">
                                                                        <Col>
                                                                              <a href="./edit-personal-info.html">
                                                                                    <article className="account-info">
                                                                                          <div className="account-info__icon">
                                                                                                <FontAwesomeIcon
                                                                                                      icon={faEnvelope}
                                                                                                />
                                                                                          </div>
                                                                                          <div>
                                                                                                <h5 className="account-info__title">
                                                                                                      Email Address
                                                                                                </h5>
                                                                                                <p className="account-info__desc">
                                                                                                      {
                                                                                                            currentUser.email
                                                                                                      }
                                                                                                </p>
                                                                                          </div>
                                                                                    </article>
                                                                              </a>
                                                                        </Col>

                                                                        <Col>
                                                                              <a href="./edit-personal-info.html">
                                                                                    <article className="account-info">
                                                                                          <div className="account-info__icon">
                                                                                                <FontAwesomeIcon
                                                                                                      icon={faPhone}
                                                                                                />
                                                                                          </div>
                                                                                          <div>
                                                                                                <h5 className="account-info__title">
                                                                                                      Phone number
                                                                                                </h5>
                                                                                                <p className="account-info__desc">
                                                                                                      {
                                                                                                            currentUser.phone
                                                                                                      }
                                                                                                </p>
                                                                                          </div>
                                                                                    </article>
                                                                              </a>
                                                                        </Col>

                                                                        <Col>
                                                                              <a href="./edit-personal-info.html">
                                                                                    <article className="account-info">
                                                                                          <div className="account-info__icon">
                                                                                                <FontAwesomeIcon
                                                                                                      icon={
                                                                                                            faLocationDot
                                                                                                      }
                                                                                                />
                                                                                          </div>
                                                                                          <div>
                                                                                                <h5 className="account-info__title">
                                                                                                      Add an address
                                                                                                </h5>
                                                                                                <p className="account-info__desc">
                                                                                                      {currentUser.address ??
                                                                                                            'VietNam'}
                                                                                                </p>
                                                                                          </div>
                                                                                    </article>
                                                                              </a>
                                                                        </Col>
                                                                  </Row>
                                                            </div>
                                                      </Row>
                                                </div>
                                          </Col>
                                    </Row>
                              ) : (
                                    <></>
                              )}
                        </div>
                  </div>
            </main>
      );
}

export default Profile;
