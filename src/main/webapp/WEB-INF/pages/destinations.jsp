<%-- 
    Document   : destinations
    Created on : Jun 15, 2024, 8:11:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="products-area-wrapper gridView">
    <c:forEach items="${destinations}" var="destination">
        <div class="products-row">
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
    </c:forEach>
</div>