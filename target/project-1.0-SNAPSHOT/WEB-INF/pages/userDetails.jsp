<%-- 
    Document   : userDetails
    Created on : Apr 22, 2024, 7:10:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- User detail -->
<div class="products-area-wrapper hide" id="user-detail">
    <div class="card-info">
        <div class="row gy-3">
            <div class="col-12">
                <h2 class="card-info__heading">
                    <button onclick="onBack(event)">
                        <i
                            class="bx bx-left-arrow-alt icon card-info__back-arrow"
                            ></i>
                    </button>
                    Personal info
                </h2>

                <!-- User -->
                <div class="profile-user">
                    <img
                        src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1704532184/default-avatar-icon-of-social-media-user-vector_yefjz5.jpg"
                        alt=""
                        class="profile-user__avatar"
                        />
                    <h1 class="profile-user__name">Imran Khan</h1>
                    <p class="profile-user__desc">Registered: 17th May 2022</p>
                </div>

                <form action="./profile.html" class="form form-card">
                    <!-- Form row 1 -->
                    <div class="form__row">
                        <div class="form__group">
                            <label
                                for="first-name"
                                class="form__label form-card__label"
                                >
                                First name
                            </label>
                            <div class="form__text-input">
                                <input
                                    type="text"
                                    name=""
                                    id="first-name"
                                    placeholder="First name"
                                    class="form__input"
                                    required=""
                                    autofocus=""
                                    />
                            </div>
                            <p class="form__error">Please enter your full name</p>
                        </div>
                        <div class="form__group">
                            <label
                                for="last-name"
                                class="form__label form-card__label"
                                >
                                Last name
                            </label>
                            <div class="form__text-input">
                                <input
                                    type="text"
                                    name=""
                                    id="last-name"
                                    placeholder="Last name"
                                    class="form__input"
                                    required=""
                                    autofocus=""
                                    />

                            </div>
                            <p class="form__error">Please enter your full name</p>
                        </div>
                    </div>

                    <!-- Form row 2 -->
                    <div class="form__row">
                        <div class="form__group">
                            <label
                                for="phone-number"
                                class="form__label form-card__label"
                                >
                                Phone Number
                            </label>
                            <div class="form__text-input">
                                <input
                                    type="text"
                                    name=""
                                    id="phone-number"
                                    placeholder="Phone Number"
                                    class="form__input"
                                    required=""
                                    />

                            </div>
                            <p class="form__error">
                                Please enter a valid phone number
                            </p>
                        </div>
                        <div class="form__group">
                            <label
                                for="email-adress"
                                class="form__label form-card__label"
                                >
                                Email address
                            </label>
                            <div class="form__text-input">
                                <input
                                    type="text"
                                    name=""
                                    id="email-adress"
                                    placeholder="Email address"
                                    class="form__input"
                                    required=""
                                    />

                            </div>
                            <p class="form__error">
                                Please enter a valid email address
                            </p>
                        </div>

                        <div class="form__group" style="flex: 0.4">
                            <label for="role" class="form__label form-card__label"
                                   >Role</label
                            >
                            <div class="form__text-input">
                                <input
                                    type="text"
                                    name=""
                                    placeholder="Role"
                                    id="role"
                                    readonly
                                    class="form__input js-toggle"
                                    toggle-target="#role-dialog"
                                    />
                                <div
                                    id="role-dialog"
                                    class="form__select-dialog bottom hide"
                                    style="left: 0; bottom: -88px"
                                    >
                                    <h2 class="form__dialog-heading d-none d-sm-block">
                                        Role
                                    </h2>
                                    <button
                                        class="form__close-dialog d-none d-sm-block js-toggle"
                                        toggle-target="#role-dialog"
                                        >
                                        &times
                                    </button>
                                    <ul class="form__options-list">
                                        <li class="form__option form__option--current">
                                            Receptionist
                                        </li>
                                        <li class="form__option">Cashier</li>
                                    </ul>
                                </div>
                            </div>
                            <p class="form__error">
                                Phone must be at least 11 characters
                            </p>
                        </div>
                    </div>

                    <div class="form__group">
                        <label for="address" class="form__label form-card__label"
                               >Address</label
                        >
                        <div class="form__text-area">
                            <textarea
                                name="address"
                                id="address"
                                placeholder="Address"
                                class="form__text-area-input"
                                required
                                ></textarea>
                        </div>
                        <p class="form__error">address not empty</p>
                    </div>

                    <div class="form-card__bottom">
                        <a class="btn btn--text" href="./profile.html">Cancel</a>
                        <button class="btn btn--primary btn--rounded">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const onBack = async (event) => {
        const target = event.target.closest("#user-detail");
        const list = document.querySelector("#user-list");
        const isHidden = target.classList.contains("show");

        requestAnimationFrame(() => {
            target.classList.toggle("hide", isHidden);
            target.classList.toggle("show", !isHidden);
            list.classList.toggle("hide", !isHidden);
            list.classList.toggle("show", isHidden);
        });
    };
</script>