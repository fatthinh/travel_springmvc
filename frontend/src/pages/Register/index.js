import { useState } from 'react';
import '../Login/login.scss';
import images from '~/assets/images';
import Form from '~/components/Form';
import { FormGroupInput } from '~/components/Form/FormGroup';
import FormRow from '~/components/Form/FormRow';
import RegisterIntro from '~/components/RegisterIntro';
import { Link } from 'react-router-dom';

function Register() {
      const [registerInfo, setRegisterInfo] = useState({
            email: '',
            phone: '',
            firstName: '',
            lastName: '',
            password: '',
      });

      const onChangeRegisterInfo = (value, field) => {
            setRegisterInfo((current) => {
                  return { ...current, [field]: value };
            });
            console.log(registerInfo);
      };

      const onSubmit = (event) => {
            event.preventDefault();

            console.log(registerInfo);
      };

      return (
            <main className="auth">
                  <div id="auth-content" className="auth__content">
                        <div className="auth__content-inner">
                              <Link to={'/'} className="logo">
                                    <img src={images.logo} alt="" className="logo__img" />
                                    <h1 className="logo__title"></h1>
                              </Link>
                              <h1 className="auth__heading">Register</h1>
                              <p className="auth__desc">Let’s create your account.</p>
                              <Form onSubmit={onSubmit}>
                                    <FormRow>
                                          <FormGroupInput
                                                placeholder="First name"
                                                required
                                                value={registerInfo.firstName}
                                                setValue={(value) => onChangeRegisterInfo(value, 'firstName')}
                                          />
                                          <FormGroupInput
                                                placeholder="Last name"
                                                required
                                                value={registerInfo.lastName}
                                                setValue={(value) => onChangeRegisterInfo(value, 'lastName')}
                                          />
                                    </FormRow>
                                    <FormGroupInput
                                          placeholder="Phone"
                                          required
                                          value={registerInfo.phone}
                                          setValue={(value) => onChangeRegisterInfo(value, 'phone')}
                                    />
                                    <FormGroupInput
                                          placeholder="Email"
                                          required
                                          type="email"
                                          value={registerInfo.email}
                                          setValue={(value) => onChangeRegisterInfo(value, 'email')}
                                    />
                                    <FormGroupInput
                                          placeholder="Password"
                                          required
                                          type="password"
                                          value={registerInfo.password}
                                          setValue={(value) => onChangeRegisterInfo(value, 'password')}
                                    />
                                    <div className="auth__btn-group">
                                          <FormRow>
                                                <button className="btn btn-primary" type="submit">
                                                      Register
                                                </button>
                                          </FormRow>
                                    </div>
                              </Form>
                              <p className="auth__text">
                                    You have an account yet?
                                    <Link to={'/login'} className="auth__link auth__text-link">
                                          Log In
                                    </Link>
                              </p>
                        </div>
                  </div>

                  <div className="auth__intro">
                        <RegisterIntro />
                        <p className="auth__intro-text">fatthinh</p>
                  </div>
            </main>
      );
}

export default Register;
