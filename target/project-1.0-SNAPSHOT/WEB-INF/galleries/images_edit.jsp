<%-- 
    Document   : activities.jsp
    Created on : Jun 17, 2024, 2:44:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="image-gallery" class="modal hide" style="display: block" data-id="${tourdetails.getId()}">
    <div class="modal__content" style="width: 100%; height: 90vh">
        <div class="products-area-wrapper gridView gallery">
            <c:forEach items="${gallery}" var="item">
                <label class="products-row">
                    <c:set var="contains" value="false" />
                    <c:forEach var="tourgalleryItem" items="${tourgallery}">
                        <c:if test="${tourgalleryItem.getId() eq item.getId()}">
                            <c:set var="contains" value="true" />
                        </c:if>
                    </c:forEach>
                    <input
                        class="cell-more-button gallery-item"
                        style="display: flex"
                        type="checkbox"
                        data-id="${item.getId()}"
                        ${contains ? "checked" : ""}
                        />
                    <div class="product-cell img">
                        <img
                            src="${item.getSrc()}"
                            alt="${item.getName()}"
                            />
                    </div>
                    <div class="product-cell">
                        <span class="cell-label"></span>${item.getName()}
                    </div>
                </label>
            </c:forEach>
        </div>

        <div class="modal__bottom">
            <input type="file" placeholder="upload" id="new-image" />
            <button
                class="btn btn--small btn--primary modal__btn btn--no-margin js-toggle"
                toggle-target="#image-gallery"
                >
                Save
            </button>
        </div>
    </div>
    <div class="modal__overlay" style="background-color: #fff"></div>
</div>