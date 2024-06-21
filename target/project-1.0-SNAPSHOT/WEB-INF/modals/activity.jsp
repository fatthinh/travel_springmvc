<%-- 
    Document   : activity
    Created on : Jun 15, 2024, 9:10:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Modal: new activity -->
<c:url value="/activities" var="action" />
<div id="add-new-activity" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form:form method="post" action="${action}" modelAttribute="activityObj" class="form">
            <h2 class="modal__heading">Add new activity</h2>
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
                                />
                        </div>
                        <p class="form__error">Name must be at least 2 characters</p>
                    </div>
                    <div class="form__group">
                        <label for="name" class="form__label form__label--small"
                               >Price</label
                        >
                        <div class="form__text-input form__text-input--small">
                            <form:input
                                type="number"
                                path="price"
                                id="name"
                                placeholder="Price"
                                class="form__input"
                                />
                        </div>
                        <p class="form__error">Name must be at least 2 characters</p>
                    </div>
                </div>
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
                            />
                        <div id="destination-dialog" class="form__select-dialog bottom hide">
                            <h2 class="form__dialog-heading d-none d-sm-block">Destination</h2>
                            <button
                                class="form__close-dialog d-none d-sm-block js-toggle"
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
                                <c:forEach items="${destinations}" var="destination">
                                    <li class="form__option" data-id="${destination.getId()}">${destination.getName()}</li>
                                    </c:forEach>
                            </ul>
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
                            placeholder="Describe this activity"
                            class="form__text-area-input"
                            ></form:textarea>
                        </div>
                    </div>
                </div>

                <div class="modal__bottom">
                    <button
                        class="btn btn--small btn--text modal__btn js-toggle"
                        toggle-target="#add-new-activity"
                        >
                        Cancel
                    </button>
                    <button
                        class="btn btn--small btn--primary modal__btn btn--no-margin "
                        type="submit"
                        >
                        Create
                    </button>
                </div>
        </form:form>
    </div>
    <div class="modal__overlay"></div>
</div>