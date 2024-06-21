<%-- 
    Document   : destination.jsp
    Created on : Jun 15, 2024, 8:31:25 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Modal: new destination -->
<c:url value="/destinations" var="action" />
<div id="add-new-destination" class="modal hide">
    <div class="modal__content" style="background-color: #fff; width: 650px">
        <form:form method="post" action="${action}" modelAttribute="destinationObj" enctype="multipart/form-data" class="form">
            <h2 class="modal__heading">Add new Destination</h2>
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
                            placeholder="Describe this destination"
                            class="form__text-area-input"
                            ></form:textarea>
                        </div>
                    </div>
                </div>

                <div class="modal__bottom">
                    <button
                        class="btn btn--small btn--text modal__btn js-toggle"
                        toggle-target="#add-new-destination"
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