<%-- 
    Document   : user
    Created on : Apr 22, 2024, 12:50:56 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Modal: new user -->
<div id="add-new-user" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">

        <c:url value="/users" var="action"/>
        <form:form action="${action}" class="form" method="post" modelAttribute="userObj">
            <h2 class="modal__heading">Add new user</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="first-name" class="form__label form__label--small"
                               >First name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input 
                                path="firstName"
                                id="first-name"
                                placeholder="First name"
                                class="form__input"
                                required="true"
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
                            <form:input
                                path="lastName"
                                placeholder="Last name"
                                id="last-name"
                                class="form__input"
                                required="true"
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">
                            Last name must be at least 2 characters
                        </p>
                    </div>

                    <div class="form__group">
                        <label for="role" class="form__label form__label--small"
                               >Role</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                placeholder="Role"
                                id="roleDisplay"
                                readonly
                                class="form__input js-toggle"
                                toggle-target="#role-dialog"
                                required
                                />

                            <form:input 
                                path="role"
                                id="role"
                                hidden="true"
                                />

                            <div
                                id="role-dialog"
                                class="form__select-dialog bottom hide"
                                style="left: 0; bottom: -148px"
                                >
                                <ul class="form__options-list" data-name="role">
                                    <li class="form__option" data-id="RECEPTIONIST">Receptionist</li>
                                    <li class="form__option" data-id="CASHIER">Cashier</li>
                                    <li class="form__option" data-id="CUSTOMER">Customer</li>
                                </ul>
                            </div>
                        </div>
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>
                </div>

                <div class="form__row">
                    <div class="form__group">
                        <label for="phone" class="form__label form__label--small"
                               >Phone</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input
                                type="tel"
                                path="phone"
                                id="phone"
                                placeholder="Phone"
                                class="form__input"
                                required="true"
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
                            <form:input
                                type="email"
                                path="email"
                                placeholder="Email"
                                id="email"
                                class="form__input"
                                required="true"
                                />
                        </div>
                        <p class="form__error">Example: lastname@gmail.com</p>
                    </div>
                </div>

                <div class="form__group">
                    <label for="password" class="form__label form__label--small"
                           >Password</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <form:input
                            type="password"
                            path="password"
                            placeholder="Password"
                            id="password"
                            class="form__input"
                            required="true"
                            minlength="8"
                            />
                    </div>
                    <p class="form__error">Password length must be at least 8</p>
                </div>
                <div class="form__group">
                    <label for="confirm-password" class="form__label form__label--small"
                           >Confirm password</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <form:input
                            type="password"
                            path="confirmPassword"
                            placeholder="Confirm password"
                            id="confirm-password"
                            class="form__input"
                            required="true"
                            minlength="8"
                            />
                    </div>
                    <p class="form__error">Password length must be at least 8</p>
                </div>
            </div>

            <div class="modal__bottom">
                <button
                    class="btn btn--small btn--text modal__btn js-toggle"
                    toggle-target="#add-new-user"
                    >
                    Cancel
                </button>
                <form:button
                    class="btn btn--small btn--primary modal__btn btn--no-margin"
                    type="submit"
                    >
                    Create
                </form:button>
            </div>
        </form:form>
    </div>
    <div class="modal__overlay"></div>
</div>
