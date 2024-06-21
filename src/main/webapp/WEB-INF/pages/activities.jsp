<%-- 
    Document   : activities.jsp
    Created on : Jun 15, 2024, 8:50:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="products-area-wrapper gridView">
    <c:forEach items="${activities}" var="activity">
        <div class="products-row js-toggle" toggle-target="#add-new-activity">
            <button class="cell-more-button" onclick="toDetail('${activity.getId()}')">
                <i class="bx bx-dots-vertical-rounded icon"></i>
            </button>

            <div class="product-cell image">
                <img
                    src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1718602988/pexels-photo-6985001_qj2uav.jpg"
                    alt="${activity.getName()}"
                    />
            </div>
            <div class="product-cell">
                <span class="cell-label">Name: </span>${activity.getName()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Transport: </span>${activity.getTransport()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Price: </span>$${activity.getPrice()}
            </div>
        </div>
    </c:forEach>
</div>

<script type="text/javascript">
    const toDetail = (activity) => {
        console.log("Activity JSON:", activity);
    };
</script>