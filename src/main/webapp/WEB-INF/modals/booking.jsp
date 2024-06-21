<%-- 
    Document   : booking
    Created on : Apr 22, 2024, 12:54:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal: new booking -->
<c:url value="/bookings" var="action" />
<div id="add-new-booking" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form method="post" class="form" action="${action}" modelAttribute="booking">
            <h2 class="modal__heading">Add new booking</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="first-name" class="form__label form__label--small"
                               >First name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="firstName"
                                placeholder="First name"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">
                            First name must be at least 2 characters
                        </p>
                    </div>
                    <div class="form__group">
                        <label for="last-name" class="form__label form__label--small"
                               >Last name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="lastName"
                                placeholder="Last name"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">
                            Last name must be at least 11 characters
                        </p>
                    </div>
                </div>

                <div class="form__row">
                    <div class="form__group" style="flex: 0.5">
                        <label for="phone" class="form__label form__label--small"
                               >Phone</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="phone"
                                placeholder="Phone"
                                class="form__input"
                                required
                                minlength="11"
                                />
                        </div>
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>

                    <div class="form__group">
                        <label for="email" class="form__label form__label--small"
                               >Email</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="email"
                                name="email"
                                placeholder="Email"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">Example: lastname@gmail.com</p>
                    </div>
                </div>

                <div class="form__group">
                    <label for="tour" class="form__label form__label--small"
                           >Tour</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <input
                            type="text"
                            name="tour"
                            placeholder="Choose tour"
                            readonly
                            class="form__input js-toggle"
                            toggle-target="#tour-dialog"
                            />
                        <div id="tour-dialog" class="form__select-dialog hide">
                            <h2 class="form__dialog-heading d-none d-sm-block">Tour</h2>
                            <button
                                class="form__close-dialog d-none d-sm-block js-toggle"
                                toggle-target="#tour-dialog"
                                >
                                &times
                            </button>
                            <div class="form__search">
                                <input
                                    type="text"
                                    placeholder="Search"
                                    class="form__search-input"
                                    />
                            </div>
                            <ul class="form__options-list">
                                <li class="form__option">Ha Noi</li>
                                <li class="form__option form__option--current">
                                    Ho Chi Minh
                                </li>
                                <li class="form__option">Da Nang</li>
                                <li class="form__option">Ha Noi</li>
                                <li class="form__option">Ho Chi Minh</li>
                                <li class="form__option">Da Nang</li>
                                <li class="form__option">Ha Noi</li>
                                <li class="form__option">Ho Chi Minh</li>
                                <li class="form__option">Da Nang</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form__group">
                    <label for="passengers" class="form__label form__label--small"
                           >Passengers</label
                    >
                </div>

                <ul class="passenger-list">
                    <li class="passenger-item">
                        <div class="form__row">
                            <div class="form__group">
                                <div class="form__text-input form__text-input--small">
                                    <input
                                        type="text"
                                        placeholder="Name"
                                        id="passenger"
                                        class="form__input"
                                        />
                                </div>
                                <p class="form__error">
                                    Phone must be at least 11 characters
                                </p>
                            </div>

                            <div class="form__group">
                                <div class="form__text-input form__text-input--small">
                                    <input
                                        type="date"
                                        id="passenger-dob"
                                        class="form__input"
                                        />
                                </div>
                            </div>

                            <div class="form__group" style="flex: 0.2">
                                <button
                                    class="btn btn--small btn--danger js-remove-passenger"
                                    >
                                    <i class="bx bx-x"></i>
                                </button>
                            </div>
                        </div>
                    </li>
                </ul>

                <div class="form__group">
                    <button
                        class="btn btn--small btn--primary js-more-passenger"
                        style="width: 100%"
                        >
                        More passenger
                    </button>
                </div>

                <div class="form__group">
                    <label for="notes" class="form__label form__label--small"
                           >Notes</label
                    >
                    <div class="form__text-area">
                        <textarea
                            name="notes"
                            placeholder="Notes"
                            class="form__text-area-input"
                            required
                            ></textarea>
                    </div>
                    <p class="form__error">address not empty</p>
                </div>
            </div>

            <div class="modal__bottom">
                <button
                    class="btn btn--small btn--text modal__btn js-toggle"
                    toggle-target="#add-new-booking"
                    >
                    Cancel
                </button>
                <button
                    class="btn btn--small btn--primary modal__btn btn--no-margin"
                    type="submit"
                    >
                    Create
                </button>
            </div>
        </form>
    </div>
    <div class="modal__overlay"></div>
</div>
