<%-- 
    Document   : activities.jsp
    Created on : Jun 17, 2024, 2:44:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="activity-gallery" class="modal hide" style="display: block">
    <div class="modal__content" style="width: 100%; height: 90vh">
        <div class="products-area-wrapper gridView gallery">
            <c:forEach items="${activities}" var="item">
                <div class="products-row" >
                    <input
                        class="cell-more-button gallery-item"
                        style="display: flex"
                        type="checkbox"
                        data-id="${item.getId()}"
                        />
                    <div class="product-cell image">
                        <img
                            src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1718602988/pexels-photo-6985001_qj2uav.jpg"
                            alt="${item.getName()}"
                            />
                    </div>
                    <div class="product-cell">
                        <span class="cell-label">Name: </span>${item.getName()}
                    </div>
                    <div class="product-cell">
                        <span class="cell-label">Transport: </span>${item.getTransport()}
                    </div>
                    <div class="product-cell">
                        <span class="cell-label">Price: </span>$${item.getPrice()}
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="modal__bottom">
            <button
                class="btn btn--small btn--outline modal__btn btn--no-margin js-toggle"
                toggle-target="#activity-gallery"
                >
                Cancel
            </button>
            <button
                class="btn btn--small btn--primary modal__btn btn--no-margin js-toggle"
                toggle-target="#activity-gallery"
                >
                Save
            </button>
        </div>
    </div>
    <div class="modal__overlay" style="background-color: #fff"></div>
</div>