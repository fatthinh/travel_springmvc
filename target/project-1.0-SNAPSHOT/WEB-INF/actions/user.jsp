<%-- 
    Document   : user
    Created on : Apr 23, 2024, 8:38:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-content-actions">
    <form action="<c:url value='/users' />" style="width: 380px; display: flex; align-items: center;">
        <input class="search-bar" placeholder="Search..." type="search" name="kw"/>
        <button class="btn btn--primary" type="submit" style="height: 100%; margin-left: 20px; padding: 2px 8px;">Search</button>
    </form>
    <div class="app-content-actions-wrapper">
        <div class="filter-button-wrapper">
            <button class="action-button filter jsFilter">
                <span>Filter</span><i class="bx bx-filter-alt icon"></i>
            </button>
            <form class="filter-menu"  action="<c:url value='/users' />" id='filter-form'>
                <label for='role-filter'>Role</label>
                <select id='role-filter' name='role' form='filter-form'>
                    <option value='all'>All</option>
                    <option value='customer'>Customer</option>
                    <option value='receptionist'>Receptionist</option>
                    <option value='admin'>Admin</option>
                    <option value='cashier'>Cashier</option>
                </select>
                <!--                <label for='status-filter'>Status</label>
                                <select id='status-filter' name='status' form='filter-form'>
                                    <option value='all'>All Status</option>
                                    <option value='active'>Active</option>
                                    <option value='disabled'>Disabled</option>
                                </select>-->
                <div class="filter-menu-buttons">
                    <button class="filter-button reset">Reset</button>
                    <button class="filter-button apply" type='submit'>Apply</button>
                </div>
            </form>
        </div>
        <button class="action-button list active" title="List View">
            <i class="bx bx-list-ul icon"></i>
        </button>
        <button class="action-button grid" title="Grid View">
            <i class="bx bx-grid-alt icon"></i>
        </button>
    </div>
</div>