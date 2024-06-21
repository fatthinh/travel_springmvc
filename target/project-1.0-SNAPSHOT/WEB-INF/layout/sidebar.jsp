<%-- 
    Document   : sidebar.jsp
    Created on : Apr 17, 2024, 2:53:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <div class="app-icon">
            <image class="logo" src="<c:url value="/icons/logo.svg"/>"></image>
        </div>
    </div>
    <ul class="sidebar-list">
        <li class="sidebar-list-item">
            <a href="<c:url value="/"/>" >
                <i class="bx bx-home-alt"></i>
                <span>Home</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/tours" />">
                <i class='bx bx-map-alt'></i>
                <span>Tours</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/activities" />">
                <i class="bx bx-world"></i></i> <span>Activities</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/destinations" />">
                <i class='bx bx-map'></i> <span>Destinations</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/bookings" />">
                <i class="bx bx-time-five"></i>
                <span>Bookings</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/customers" />">
                <i class="bx bx-user"></i> <span>Customers</span>
            </a>
        </li>
        <li class="sidebar-list-item">
            <a href="<c:url value="/users" />">
                <i class="bx bxs-user-account"></i><span>users</span>
            </a>
        </li>
    </ul>
    <div class="account-info">
        <div class="account-info-picture">
            <img
                src="https://res.cloudinary.com/dzjhqjxqj/image/upload/v1703844016/v2depwkhte1trcs0z9q9.jpg"
                alt="Account"
                />
        </div>
        <div class="account-info-name">Thinh Lam</div>
        <button class="account-info-more">
            <i
                class="bx bx-dots-horizontal-rounded"
                style="font-size: 24px"
                ></i>
        </button>
    </div>
</div>