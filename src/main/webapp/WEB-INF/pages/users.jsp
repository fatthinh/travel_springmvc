<%-- 
    Document   : users
    Created on : Apr 21, 2024, 10:44:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="app-content-actions pagination">
    <div class="counter"></div>
    <button class="paginate left"><i></i><i></i></button>
    <button class="paginate right"><i></i><i></i></button>
</div>

<div class="products-area-wrapper tableView show" id="user-list">
    <div class="products-header">
        <div class="product-cell image"></div>
        <div class="product-cell">Name</div>
        <div class="product-cell">Email</div>
        <div class="product-cell">Phone</div>
        <div class="product-cell">Role</div>
    </div>
    <c:forEach items="${users}" var="user">
        <div class="products-row">
            <button class="cell-more-button" >
                <i class="bx bx-dots-vertical-rounded icon"></i>
            </button>

            <div class="product-cell image">
                <a href='<c:url value="/users/${user.getId()}" />'>
                    <img
                        <c:choose>
                            <c:when test="${user.getAvatar() == null}">
                                src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1704532184/default-avatar-icon-of-social-media-user-vector_yefjz5.jpg"
                            </c:when>    
                            <c:otherwise>
                                src ="${user.getAvatar()}"
                            </c:otherwise>
                        </c:choose>
                        alt="avatar"
                        />
                </a>
            </div>
            <div class="product-cell">
                <span class="cell-label">Name:</span>${user.getFirstName()} ${user.getLastName()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Email:</span>${user.getEmail()}
            </div>
            <div class="product-cell">
                <span class="cell-label">Phone:</span>${user.getPhone()}
            </div>
            <div class="product-cell">
                <span class="cell-label"></span>${user.getRole()}
            </div>
        </div>
    </c:forEach>
</div>

<script>
    // basic paging logic to demo the buttons
    var pr = document.querySelector(".paginate.left");
    var pl = document.querySelector(".paginate.right");
    pr.onclick = slide.bind(this, -1);
    pl.onclick = slide.bind(this, 1);

    var total = ${total};

    const currentUrl = window.location.href;
    var index = parseInt(currentUrl.slice(-1));

    function slide(offset) {
        index = Math.min(Math.max(index + offset, 1), total);
        if (isNaN(index))
            document.querySelector(".counter").innerHTML = "<span class='page'>1</span>" + " / " + total;
        else
            document.querySelector(".counter").innerHTML = "<span class='page'>" + (index) + "</span>" + " / " + total;
        pr.setAttribute("data-state", index === 1 ? "disabled" : "");
        pl.setAttribute("data-state", index === total ? "disabled" : "");
    }

    document.querySelectorAll(".paginate").forEach(paginate => {
        paginate.addEventListener("click", () => {
            const ind = document.querySelector(".page").innerText;
            var newUrl = `http://localhost:8082/project/users?page=` + ind;
            window.location.href = newUrl;
        });
    });

    slide(0);
</script>
