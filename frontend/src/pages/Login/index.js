import { faGoogle } from '@fortawesome/free-brands-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useEffect, useState } from 'react';
import images from '~/assets/images';
import AuthIntro from '~/components/AuthIntro';
import './login.scss';
import Form from '~/components/Form';
import { FormGroupCheckbox, FormGroupInput } from '~/components/Form/FormGroup';
import FormRow from '~/components/Form/FormRow';
import { Link, useNavigate } from 'react-router-dom';
import config from '~/config';
import { useDispatch, useSelector } from 'react-redux';
import authSlice from '~/redux/slices/authSlice';
import cookie from 'react-cookies';
import { authSelector } from '~/redux/selectors';

function Login() {
      const [email, setEmail] = useState('');
      const [password, setPassword] = useState('');
      const [rememberMe, setRememberMe] = useState(false);

      const currentUser = useSelector(authSelector);
      const navigate = useNavigate();
      const dispatch = useDispatch();

      useEffect(() => {
            if (currentUser) {
                  navigate('/');
            }
      }, [currentUser]);

      const handleLogin = async (e) => {
            e.preventDefault();

            try {
                  let res = await config.axiosConfig.post(config.endpoints.login, { email, password });
                  cookie.save('token', res.data);

                  setTimeout(async () => {
                        let currentUser = await config.axiosConfigWithAuth.get(config.endpoints['current-user']);
                        dispatch(authSlice.actions.login(currentUser.data));
                        navigate('/');
                  }, 500);
            } catch (ex) {
                  console.error(ex);
            }
      };

      return (
            <main className="auth">
                  <div className="auth__intro">
                        <AuthIntro />
                        <p className="auth__intro-text">How are you today?</p>
                  </div>

                  <div className="auth__content">
                        <div className="auth__content-inner">
                              <a to="/" className="logo">
                                    <img src={images.logo} alt="story" className="logo__img" />
                                    <h2 className="logo__title"></h2>
                              </a>
                              <h1 className="auth__heading">Hello Again!</h1>
                              <p className="auth__desc">Welcome back to sign in.</p>
                              <Form>
                                    <FormGroupInput
                                          placeholder="Email or phone"
                                          required
                                          value={email}
                                          setValue={setEmail}
                                    />
                                    <FormGroupInput
                                          placeholder="Password"
                                          required
                                          type="password"
                                          value={password}
                                          setValue={setPassword}
                                    />
                                    <FormRow>
                                          <FormGroupCheckbox
                                                label="Remember me"
                                                value={rememberMe}
                                                setValue={setRememberMe}
                                          />
                                          <a style={{ textAlign: 'right' }} className="btn auth__link mt-4 px-0">
                                                Forgot password?
                                          </a>
                                    </FormRow>
                                    <div className="auth__btn-group">
                                          <FormRow>
                                                <button className="btn btn-primary" onClick={handleLogin}>
                                                      Log in
                                                </button>
                                          </FormRow>
                                          <FormRow>
                                                <a className="btn btn-outline-secondary">
                                                      Log in with Google <FontAwesomeIcon icon={faGoogle} />
                                                </a>
                                          </FormRow>
                                    </div>
                              </Form>

                              <p className="auth__text">
                                    Don’t have an account yet?
                                    <Link to={'/register'} className="auth__link auth__text-link">
                                          Register
                                    </Link>
                              </p>
                        </div>
                  </div>
            </main>
      );
}

export default Login;
