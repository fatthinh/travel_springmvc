import { faCircleXmark } from '@fortawesome/free-regular-svg-icons';
import { faExclamation, faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import './form.scss';

export const FormGroupText = ({ label, placeholder, required, value, setValue }) => {
      return (
            <div className="form__group">
                  <label className="form__label form__label--small">{label}</label>
                  <div className="form__text-area">
                        <textarea
                              placeholder={placeholder}
                              className="form__text-area-input"
                              required={required}
                              value={value}
                              onChange={(e) => setValue(e.target.value)}
                        ></textarea>
                        {/* <FontAwesomeIcon icon={faExclamation} /> */}
                  </div>
                  <p className="form__error">{label} not empty</p>
            </div>
      );
};

export const FormGroupInput = ({ label, placeholder, required, type = 'text', value, setValue = () => {} }) => {
      return (
            <div className="form__group">
                  <label className="form__label form__label--small">{label}</label>
                  <div className="form__text-input form__text-input--small">
                        <input
                              type={type}
                              placeholder={placeholder}
                              className="form__input"
                              required={required}
                              value={value}
                              onChange={(e) => setValue(e.target.value)}
                        />
                        <FontAwesomeIcon icon={faExclamation} className="form__input-icon-error" />
                  </div>
                  <p className="form__error">{label} Error!</p>
            </div>
      );
};

export const FormGroupSelect = ({ label, placeholder, options }) => {
      return (
            <div className="form__group">
                  <label className="form__label form__label--small">{label}</label>
                  <div className="form__text-input form__text-input--small">
                        <input type="text" readonly placeholder={placeholder} className="form__input" />

                        <div className="form__select-dialog hide">
                              <h2 className="form__dialog-heading d-none d-sm-block">{label}</h2>
                              <button>
                                    <FontAwesomeIcon
                                          icon={faCircleXmark}
                                          className="form__close-dialog  d-none  d-sm-block"
                                    />
                              </button>
                              <div className="form__search">
                                    <input type="text" placeholder="Search" className="form__search-input" />
                                    <FontAwesomeIcon icon={faMagnifyingGlass} className="form__search-icon icon" />
                              </div>
                              <ul className="form__options-list">
                                    {options.map((option, index) => {
                                          return (
                                                <li key={index} className="form__option">
                                                      {option}
                                                </li>
                                          );
                                    })}
                              </ul>
                        </div>
                  </div>
            </div>
      );
};

export const FormGroupCheckbox = ({ label, value, setValue }) => {
      return (
            <div className="form__group form__group--inline">
                  <label className="form__checkbox">
                        <input
                              type="checkbox"
                              className="form__checkbox-input d-none"
                              onChange={() => {
                                    setValue(!value);
                              }}
                              value={value}
                        />
                        <span className="form__checkbox-label">{label}</span>
                  </label>
            </div>
      );
};
