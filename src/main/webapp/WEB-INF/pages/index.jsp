<%-- 
    Document   : index
    Created on : Apr 3, 2024, 11:03:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="products-area-wrapper gridView">
    <c:forEach items="${tours}" var="tour">
        <div class="products-row"> 
            <button class="cell-more-button">
                <i class="bx bx-dots-vertical-rounded icon"></i>
            </button>
            <div class="product-cell image">
                <img
                    src="${tour.getThumbnail()}"
                    alt="product"
                    />
            </div>
            <div class="product-cell">
                <span class="cell-label">Name:</span>${tour.getName()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Price:</span>$${tour.getPrice()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Max:</span>${tour.getCapacity()} adults
            </div>
        </div>
    </c:forEach>
</div>