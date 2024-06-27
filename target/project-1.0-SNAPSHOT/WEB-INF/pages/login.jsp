<%-- 
    Document   : login
    Created on : Jun 26, 2024, 3:35:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <style>
            body{
                background-color: #dee9ff;
            }

            .registration-form{
                padding: 50px 0;
                margin-top: 40px;
            }

            .registration-form form{
                background-color: #fff;
                max-width: 600px;
                margin: auto;
                padding: 50px 70px;
                border-radius:  30px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            }

            .registration-form .form-icon{
                text-align: center;
                background-color: #5891ff;
                border-radius: 50%;
                font-size: 40px;
                color: white;
                width: 100px;
                height: 100px;
                margin: auto;
                margin-bottom: 50px;
                line-height: 100px;
            }

            .registration-form .item{
                border-radius: 20px;
                margin-bottom: 25px;
                padding: 10px 20px;
            }

            .registration-form .create-account{
                border-radius: 30px;
                padding: 10px 20px;
                font-size: 18px;
                font-weight: bold;
                background-color: #5791ff;
                border: none;
                color: white;
                margin-top: 20px;
            }

            @media (max-width: 576px) {
                .registration-form form{
                    padding: 50px 20px;
                }

                .registration-form .form-icon{
                    width: 70px;
                    height: 70px;
                    font-size: 30px;
                    line-height: 70px;
                }
            }
        </style>
    </head>
    <body>
        <div class="registration-form">
            <c:url value="/login" var="action" />
            <form action="${action}" method="post" class="form">
                <h2 class="py-3">Login</h2>

                <div class="form-group">
                    <input type="text" class="form-control item" id="email" placeholder="Email" name="email" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control item" id="password" placeholder="Password" name="password"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block create-account">Login</button>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    </body>
</html>
