<%-- 
    Document   : destinations
    Created on : Jun 15, 2024, 8:11:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="products-area-wrapper gridView">
    <c:forEach items="${destinations}" var="destination">
        <div class="products-row js-toggle" toggle-target="#destination-details-${destination.getId()}">
            <button class="cell-more-button">
                <i class="bx bx-dots-vertical-rounded icon"></i>
            </button>
            <div class="product-cell image">
                <img
                    src="${destination.getThumbnail()}"
                    alt="destination"
                    />
            </div>
            <div class="product-cell">
                <span class="cell-label"></span>${destination.getName()}
            </div>
        </div>

        <!-- Modal: destination details -->
        <c:url value="/destinations/${destination.getId()}" var="action" />
        <div id="destination-details-${destination.getId()}" class="modal hide">
            <div class="modal__content" style="background-color: #fff; width: 650px">
                <form:form method="post" action="${action}" modelAttribute="destinationObj" enctype="multipart/form-data" class="form">
                    <h2 class="modal__heading">Details</h2>
                    <div class="modal__body">
                        <div class="form__group">
                            <img src="${destination.getThumbnail()}" style="width: 100%; height: 320px"/>
                        </div>
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
                                        value="${destination.getName()}"
                                        />
                                </div>
                                <p class="form__error">Name must be at least 2 characters</p>
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
                            <label for="description" class="form__label form__label--small"
                                   >Description</label
                            >
                            <div class="form__text-area">
                                <form:textarea
                                    path="description"
                                    id="description"
                                    placeholder="${destination.getDescription()}"
                                    class="form__text-area-input"
                                    ></form:textarea>
                                </div>
                            </div>
                        </div>

                        <div class="modal__bottom">
                            <button
                                class="btn btn--small btn--text modal__btn js-toggle"
                                toggle-target="#destination-details-${destination.getId()}"
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
    </c:forEach>
</div>