<%-- 
    Document   : footer.jsp
    Created on : Apr 4, 2024, 2:02:51 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-content-header">
    <h1 class="app-content-headerText">${headerTitle}</h1>
    <!--    <button class="mode-switch" title="Switch Theme">
            <i class="bx bxs-moon icon"></i>
        </button>-->
    <button
        class="app-content-headerButton js-toggle"
        toggle-target=${addNewBtn}
        >
        <c:choose >
            <c:when test="${addNewBtn =='#edit'}">
                Edit
            </c:when>
            <c:otherwise>
                Add
            </c:otherwise>
        </c:choose>
    </button>
</div>