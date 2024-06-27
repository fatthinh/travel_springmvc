<%-- 
    Document   : userDetails
    Created on : Apr 22, 2024, 7:10:15 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- User detail -->
<div class="card-info h-100">
    <div class="row d-flex flex-column align-items-center">
        <h2 class="card-info__heading">
            <a href="<c:url value="/users"/>">
                <i
                    class="bx bx-left-arrow-alt icon card-info__back-arrow"
                    ></i>
            </a>
            Personal info
        </h2>


        <div class="w-50">
            <!-- User -->
            <div class="profile-user">
                <c:url value="/users/${user.getId()}/update-avt" var="action"/>
                <form action="${action}" method="post" class="position-relative" enctype="multipart/form-data">
                    <c:set value="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1704532184/default-avatar-icon-of-social-media-user-vector_yefjz5.jpg" var="src" />
                    <c:if test="${user.getAvatar() != null}">
                        <c:set value="${user.getAvatar()}" var="src"/>
                    </c:if>
                    <img
                        src="${src}"
                        alt="avatar"
                        class="profile-user__avatar"
                        />
                    <label for="avatar"  style="cursor: pointer; font-size: 18px; padding: 4px; position: absolute; right: -2px; bottom: -12px">
                        <i class='bx bx-camera'></i>
                    </label>
                    <input type="file" id="avatar" hidden onchange="this.form.submit()" name="file"/>
                </form>
                <h1 class="profile-user__name">${user.getFirstName()} ${user.getLastName()}</h1>
            </div>

            <form action="./profile.html" class="form form-card">
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
                                id="phone-number"
                                class="form__input"
                                value="${user.getPhone()}"
                                readonly
                                />

                        </div>
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
                                id="email-adress"
                                class="form__input"
                                readonly
                                value="${user.getEmail()}"
                                />

                        </div>
                    </div>

                    <div class="form__group" style="flex: 0.4">
                        <label for="role" class="form__label form-card__label"
                               >Role</label
                        >
                        <div class="form__text-input">
                            <input
                                type="text"
                                value="${user.getRole()}"
                                id="role"
                                readonly
                                />
                        </div>

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
                            value="${user.getAddress()}"
                            placeholder="Address"
                            class="form__text-area-input"
                            ></textarea>
                    </div>
                    <p class="form__error">address not empty</p>
                </div>


            </form>
        </div>
    </div>
</div>