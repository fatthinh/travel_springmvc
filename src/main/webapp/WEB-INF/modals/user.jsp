<%-- 
    Document   : user
    Created on : Apr 22, 2024, 12:50:56 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal: new user -->
<div id="add-new-user" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form action="<c:url value='/users' />" class="form" method="post" modelAttribute="user">
            <h2 class="modal__heading">Add new user</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="first-name-modal" class="form__label form__label--small"
                               >First name</label
                        >
                        <div class="form__text-input form__
                                type="text"
                                name="firstName"
                                id="first-name-modal"
                                placeholder="First name"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>text-input--small">
                            <input
                        <p class="form__error">
                            First name must be at least 2 characters
                        </p>
                    </div>
                    <div class="form__group">
                        <label for="last-name-modal" class="form__label form__label--small"
                               >Last name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="lastName"
                                placeholder="Last name"
                                id="last-name-modal"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">
                            Last name must be at least 11 characters
                        </p>
                    </div>

                    <div class="form__group">
                        <label for="role-modal" class="form__label form__label--small"
                               >Role</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="role"
                                placeholder="Role"
                                id="role-modal"
                                readonly
                                class="form__input js-toggle"
                                toggle-target="#role-modal-dialog"
                                />
                            <div
                                id="role-modal-dialog"
                                class="form__select-dialog bottom hide"
                                style="left: 0; bottom: -87px"
                                >
                                <h2 class="form__dialog-heading d-none d-sm-block">Role</h2>
                                <button
                                    class="form__close-dialog d-none d-sm-block js-toggle"
                                    toggle-target="#role-modal-dialog"
                                    >
                                    &times
                                </button>
                                <ul class="form__options-list">
                                    <li class="form__option">Receptionist</li>
                                    <li class="form__option">Cashier</li>
                                </ul>
                            </div>
                        </div>
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>
                </div>

                <div class="form__row">
                    <div class="form__group">
                        <label for="phone-modal" class="form__label form__label--small"
                               >Phone</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="tel"
                                name="phone"
                                id="phone-modal"
                                placeholder="Phone"
                                class="form__input"
                                required
                                minlength="11"
                                />
                        </div>
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>

                    <div class="form__group">
                        <label for="email-modal" class="form__label form__label--small"
                               >Email</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="email"
                                name="email"
                                placeholder="Email"
                                id="email-modal"
                                class="form__input"
                                required
                                minlength="2"
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
                        <input
                            type="password"
                            name="password"
                            placeholder="Password"
                            id="password"
                            class="form__input"
                            required
                            minlength="2"
                            />
                    </div>
                    <p class="form__error">Example: lastname@gmail.com</p>
                </div>
                <div class="form__group">
                    <label for="address-modal" class="form__label form__label--small"
                           >Address</label
                    >
                    <div class="form__text-area">
                        <textarea
                            name="address"
                            id="address-modal"
                            placeholder="Address"
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
                    toggle-target="#add-new-user"
                    >
                    Cancel
                </button>
                <button
                    class="btn btn--small btn--primary modal__btn btn--no-margin"
                    >
                    Create
                </button>
            </div>
        </form>
    </div>
    <div class="modal__overlay"></div>
</div>

<script>
    const roles = document.querySelectorAll("#role-modal-dialog .form__option");
    const roleInput = document.getElementById("role-modal");

    roles.forEach(role => {
        role.addEventListener("click", () => {
            roles.forEach(option => {
                option.classList.remove("form__option--current");
            });

            role.classList.add("form__option--current");

            const selectedRole = role.textContent;
            roleInput.value = selectedRole;
        });
    });
</script>