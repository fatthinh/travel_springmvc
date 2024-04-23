<%-- 
    Document   : tour
    Created on : Apr 22, 2024, 12:54:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal: new tour -->
<div id="add-new-tour" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form action="" class="form">
            <h2 class="modal__heading">Add new tour</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="name" class="form__label form__label--small"
                               >Name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name="name"
                                id="name"
                                placeholder="Name"
                                class="form__input"
                                required
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">Name must be at least 2 characters</p>
                    </div>
                    <div class="form__group">
                        <label for="image" class="form__label form__label--small"
                               >Image</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name=""
                                placeholder="Image"
                                id="image"
                                readonly
                                class="form__input js-toggle"
                                toggle-target="#image-dialog"
                                />
                            <div
                                id="image-dialog"
                                class="form__select-dialog bottom hide"
                                >
                                <h2 class="form__dialog-heading d-none d-sm-block">
                                    Image
                                </h2>
                                <button
                                    class="form__close-dialog d-none d-sm-block js-toggle"
                                    toggle-target="#image-dialog"
                                    >
                                    &times
                                </button>
                                <div class="form__search">
                                    <input
                                        type="text"
                                        placeholder="Search"
                                        class="form__search-input"
                                        />
                                    <i class="bx bx-search form__search-icon icon"></i>
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
                                    <li class="form__option">Da Nang</li>
                                    <li class="form__option">Ha Noi</li>
                                    <li class="form__option">Ho Chi Minh</li>
                                    <li class="form__option">Da Nang</li>
                                </ul>
                            </div>
                        </div>
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>
                </div>
                <div class="form__group">
                    <label for="description" class="form__label form__label--small"
                           >Description</label
                    >
                    <div class="form__text-area">
                        <textarea
                            name="description"
                            id="description"
                            placeholder="Describe this tour"
                            class="form__text-area-input"
                            required
                            ></textarea>
                        <!-- <img
                          src="./assets/icons/form-error.svg"
                          alt=""
                          class="form__input-icon-error"
                        /> -->
                    </div>
                    <p class="form__error">Description not empty</p>
                </div>
                <div class="form__group">
                    <label for="activites" class="form__label form__label--small"
                           >Activites</label
                    >
                </div>

                <div class="form__row">
                    <div class="form__group">
                        <label for="first" class="form__label form__label--small"
                               >First activity</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                name=""
                                placeholder="First activity"
                                id="first"
                                readonly
                                class="form__input js-toggle"
                                toggle-target="#first-dialog"
                                />
                            <div id="first-dialog" class="form__select-dialog hide">
                                <h2 class="form__dialog-heading d-none d-sm-block">
                                    Activity
                                </h2>
                                <button
                                    class="form__close-dialog d-none d-sm-block js-toggle"
                                    toggle-target="#activity-dialog"
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
                        <p class="form__error">Phone must be at least 11 characters</p>
                    </div>
                    <div class="form__group" style="flex: 0.4">
                        <label
                            for="first-specify"
                            class="form__label form__label--small"
                            >Specify day</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="number"
                                name=""
                                id="first-specify"
                                class="form__input"
                                min="1"
                                value="1"
                                />
                        </div>
                    </div>
                    <div class="form__group" style="flex: 0.4">
                        <button
                            class="btn btn--small btn--primary btn--no-margin"
                            style="margin-top: 30px"
                            >
                            Remove
                        </button>
                    </div>
                </div>
            </div>

            <div class="modal__bottom">
                <button
                    class="btn btn--small btn--text modal__btn js-toggle"
                    toggle-target="#add-new-tour"
                    >
                    Cancel
                </button>
                <button
                    class="btn btn--small btn--primary modal__btn btn--no-margin js-toggle"
                    toggle-target="#add-new-tour"
                    >
                    Create
                </button>
            </div>
        </form>
    </div>
    <div class="modal__overlay"></div>
</div>