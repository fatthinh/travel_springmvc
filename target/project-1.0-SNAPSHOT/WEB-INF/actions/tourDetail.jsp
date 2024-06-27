<%-- 
    Document   : tourDetail
    Created on : Jun 27, 2024, 2:17:46 AM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-content-actions">
    <form action="<c:url value='/tours' />" style="width: 380px; display: flex; align-items: center;">
        <input class="search-bar" placeholder="Search..." type="search" name="kw"/>
        <button class="btn btn-primary h-50 py-2 px-4 mx-2" type="submit" style="">Search</button>
    </form>
    <div class="app-content-actions-wrapper">
        <div class="filter-button-wrapper">
            <button class="action-button filter jsFilter">
                <span>Filter</span><i class="bx bx-filter-alt icon"></i>
            </button>
            <form class="filter-menu"  action="<c:url value='/tours' />" id='filter-form'>
                <label for='destination-filter'>Destination</label>
                <select id='destination-filter' name='destination' form='filter-form'>
                    <option value='all'>All</option>

                    <c:forEach items="${destinations}" var="item">
                        <option value='${item.getName()}'>${item.getName().toUpperCase()}</option>

                    </c:forEach>
                </select>
                <div class="filter-menu-buttons">
                    <button class="filter-button reset">Reset</button>
                    <button class="filter-button apply" type='submit'>Apply</button>
                </div>
            </form>
        </div>
    </div>
</div>