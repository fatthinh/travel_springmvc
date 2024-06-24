<%-- 
    Document   : tour
    Created on : Apr 22, 2024, 12:54:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Modal: new tour -->
<c:url value="/tours" var="action" />
<div id="add-new-tourdetail" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 820px">
        <form:form method="post" action="${action}" modelAttribute="tourDetailObj" class="form" enctype="multipart/form-data">
            <h2 class="modal__heading">Add new tour detail</h2>
            <div class="modal__body">
                <div class="form__row">
                    <div class="form__group">
                        <label for="name" class="form__label form__label--small"
                               >Name</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input
                                path="name"
                                id="name"
                                placeholder="Name"
                                class="form__input"
                                required="true"
                                minlength="2"
                                />
                        </div>
                        <p class="form__error">Name must be at least 2 characters</p>
                    </div>
                    <div class="form__group">
                        <label for="capacity" class="form__label form__label--small"
                               >Capacity</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input
                                type="number"
                                path="capacity"
                                id="capacity"
                                placeholder="Adults"
                                class="form__input"
                                required="true"
                                minlength="2"
                                min="1"
                                />
                        </div>
                        <p class="form__error">Capacity must be at least 1</p>
                    </div>
                </div>
                <div class="form__row">
                    <div class="form__group">
                        <label for="destination" class="form__label form__label--small"
                               >Destination</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <input
                                type="text"
                                placeholder="Destination"
                                id="destinationDisplay"
                                class="form__input js-toggle"
                                toggle-target="#destination-dialog"
                                readonly

                                />
                            <form:input
                                type="number"
                                id="destination"
                                path="destination"
                                hidden="true"
                                required="true"
                                />
                            <div id="destination-dialog" class="form__select-dialog bottom hide">
                                <h2 class="form__dialog-heading d-md-none">Destination</h2>
                                <button
                                    class="form__close-dialog d-md-none js-toggle"
                                    toggle-target="#destination-dialog"
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
                                <ul class="form__options-list" data-name="destination">
                                    <c:forEach items="${destinations}" var="item">
                                        <li class="form__option" data-id="${item.getId()}">${item.getName()}</li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="form__group">
                        <label for="thumbnail" class="form__label form__label--small"
                               >Thumbnail</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input
                                type="file"
                                path="file"
                                placeholder="Thumbnail"
                                id="thumbnail"
                                />
                        </div>
                    </div>
                </div>

                <div class="form__group">
                    <label for="category" class="form__label form__label--small"
                           >Category</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <input
                            placeholder="Categories"
                            id="categoryDisplay"
                            class="form__input js-toggle"
                            toggle-target="#category-dialog"
                            readonly
                            />
                        <div id="category-dialog" class="form__select-dialog bottom hide">
                            <h2 class="form__dialog-heading d-md-none">Category</h2>
                            <button
                                class="form__close-dialog d-md-none js-toggle"
                                toggle-target="#category-dialog"
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
                            <ul class="form__options-list multi-select" data-name="category">
                                <c:forEach items="${categories}" var="item">
                                    <li class="form__option" data-id="${item.getId()}">${item.getName()}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="form__row">
                    <div class="form__group">
                        <div class="form__text-input form__text-input--small">
                            <button
                                class="js-toggle"
                                toggle-target="#activity-gallery"
                                style="width: 100%"
                                >
                                See activities
                            </button>
                        </div>
                    </div>
                    <div class="form__group">
                        <div class="form__text-input form__text-input--small">
                            <button
                                class="js-toggle"
                                toggle-target="#image-gallery"
                                style="width: 100%"
                                >
                                See gallery
                            </button>
                        </div>
                    </div>
                </div>
                <div class="form__group">
                    <label for="description" class="form__label form__label--small"
                           >Description</label
                    >
                    <div class="form__text-area">
                        <form:textarea
                            path="description"
                            id="description"
                            placeholder="Describe this destination"
                            class="form__text-area-input"
                            ></form:textarea>
                        </div>
                    </div>
                </div>

                <div class="modal__bottom">
                    <button
                        class="btn btn--small btn--text modal__btn js-toggle"
                        toggle-target="#add-new-tourdetail"
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