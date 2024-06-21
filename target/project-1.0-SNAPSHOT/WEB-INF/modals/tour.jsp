<%-- 
    Document   : tour
    Created on : Apr 22, 2024, 12:54:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal: new tour -->
<c:url value="/" var="action" />
<div id="add-new-tour" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form:form method="post" action="${action}" modelAttribute="tourObj" class="form">
            <h2 class="modal__heading">Add new tour</h2>
            <div class="modal__body">
                <div class="form__group">
                    <label for="destination" class="form__label form__label--small"
                           >Tour detail</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <input
                            type="text"
                            placeholder="Choose a tour"
                            id="tourDetailDisplay"
                            class="form__input js-toggle"
                            toggle-target="#tourdetail-dialog"
                            readonly
                            />
                        <form:input
                            type="number"
                            id="tourDetail"
                            path="tourDetail"
                            hidden="true"
                            />
                        <div id="tourdetail-dialog" class="form__select-dialog bottom hide">
                            <h2 class="form__dialog-heading d-none d-sm-block">Tour detail</h2>
                            <button
                                class="form__close-dialog d-none d-sm-block js-toggle"
                                toggle-target="#tourdetail-dialog"
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
                            <ul class="form__options-list" data-name="tourDetail">
                                <c:forEach items="${details}" var="item">
                                    <li class="form__option" data-id="${item.getId()}">${item.getName()}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form__group">
                    <label
                        for="departure-time"
                        class="form__label form__label--small"
                        >Departure date</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <fmt:formatDate var='formattedDate' value='${date}' type='both' timeStyle='long' dateStyle='long' />
                        <form:input
                            type="date"
                            path="departureDate"
                            id="departureDate"
                            class="form__input"
                            value="${formattedDate}"
                            />
                    </div>
                </div>

                <div class="form__group">
                    <label
                        for="departure-time"
                        class="form__label form__label--small"
                        >Discount</label
                    >
                    <div class="form__text-input form__text-input--small">
                        <form:input
                            type="number"
                            path="discount"
                            id="discount"
                            class="form__input"
                            placeholder="Discount"
                            />
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
