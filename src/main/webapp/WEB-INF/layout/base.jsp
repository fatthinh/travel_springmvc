<%-- 
    Document   : base.jsp
    Created on : Apr 4, 2024, 2:02:36 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title"/>
        </title>
        <!-- Style -->
        <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link href="<c:url value="/css/main.css"/>" rel="stylesheet" />

        <script src="<c:url value="/js/main.js" />"></script>
    </head

    <body>
        <div class="app-container">
            <tiles:insertAttribute name="sidebar" />
            <div class="app-content">
                <tiles:insertAttribute name="header"/>

                <tiles:insertAttribute name="actions"/>

                <tiles:insertAttribute name="content" />
                <tiles:insertAttribute name="detail" />
            </div>
        </div>
        <tiles:insertAttribute name="modal" />
        <tiles:insertAttribute name="activityGallery" />
        <tiles:insertAttribute name="imageGallery" />
    </body>
</html>
