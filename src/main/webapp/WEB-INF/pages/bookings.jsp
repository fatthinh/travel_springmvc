<%-- 
    Document   : bookings
    Created on : Apr 21, 2024, 10:52:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="products-area-wrapper tableView">
    <div class="products-header">
        <div class="product-cell image"></div>
        <div class="product-cell">Customer</div>
        <div class="product-cell email">Email</div>
        <div class="product-cell">Phone</div>
        <div class="product-cell">Tour</div>
        <div class="product-cell">Status</div>
        <div class="product-cell">Created at</div>
    </div>
    <div class="products-row">
        <button class="cell-more-button">
            <i class="bx bx-dots-vertical-rounded icon"></i>
        </button>
        <div class="product-cell image">
            <img
                src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"
                alt="product"
                />
        </div>
        <div class="product-cell">
            <span class="cell-label">Customer:</span>Lam Thinh
        </div>
        <div class="product-cell email">
            <span class="cell-label">Email:</span>pthhinh.lama@gmail.com
        </div>
        <div class="product-cell">
            <span class="cell-label">Phone:</span>+84335037042
        </div>
        <div class="product-cell">
            <span class="cell-label">Tour:</span>HCM - Ha Long
        </div>
        <div class="product-cell status-cell">
            <span class="cell-label">Status:</span>
            <span class="status disabled">Due</span>
        </div>
        <div class="product-cell">
            <span class="cell-label">Created at:</span>10 Feb 2024
        </div>
    </div>
</div>