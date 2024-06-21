<%-- 
    Document   : tickets
    Created on : Apr 21, 2024, 10:51:54 PM
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
                    src="${tour.getTourDetail().getThumbnail()}"
                    alt="item"
                    />
            </div>
            <div class="product-cell">
                <span class="cell-label"></span>${tour.getTourDetail().getName()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Departure date:</span> ${tour.getDepartureDate()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Departure time</span>02:00 am
            </div>
            <div class="product-cell">
                <span class="cell-label">Price:</span>${tour.getTourDetail().getPrice()} / person
            </div>
            <div class="product-cell">
                <span class="cell-label">Sold:</span>5/ ${tour.getTourDetail().getCapacity()}
            </div>
        </div>
    </c:forEach>
</div>