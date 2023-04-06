<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TRONG TUAN
  Date: 8/4/2022
  Time: 12:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Varela Round', sans-serif;
        }

        .modal-login {
            color: #636363;
            width: 350px;
        }

        .modal-login .modal-content {
            padding: 20px;
            border-radius: 5px;
            border: none;
        }

        .modal-login .modal-header {
            border-bottom: none;
            position: relative;
            justify-content: center;
        }

        .modal-login h4 {
            text-align: center;
            font-size: 26px;
        }

        .modal-login .form-group {
            position: relative;
        }

        .modal-login i {
            position: absolute;
            left: 13px;
            top: 11px;
            font-size: 18px;
        }

        .modal-login .form-control {
            padding-left: 40px;
        }

        .modal-login .form-control:focus {
            border-color: #00ce81;
        }

        .modal-login .form-control,
        .modal-login .btn {
            min-height: 40px;
            border-radius: 3px;
        }

        .modal-login .hint-text {
            text-align: center;
            padding-top: 10px;
        }

        .modal-login .close {
            position: absolute;
            top: -5px;
            right: -5px;
        }

        .modal-login .btn,
        .modal-login .btn:active {
            border: none;
            background: #00ce81 !important;
            line-height: normal;
        }

        .modal-login .btn:hover,
        .modal-login .btn:focus {
            background: #00bf78 !important;
        }

        .modal-login .modal-footer {
            background: #ecf0f1;
            border-color: #dee4e7;
            text-align: center;
            margin: 0 -20px -20px;
            border-radius: 5px;
            font-size: 13px;
            justify-content: center;
        }

        .modal-login .modal-footer a {
            color: #999;
        }
    </style>
</head>
<body>
<section class="text-center banner" id="banner" style="background-color: rgba(253, 253, 254, 0.8);
    padding: 45px;
    left: 0;
    right: 0;
    margin-top: 100px;
    position: absolute;
    z-index: 2;">
    <h1>Welcome to Employee Management System (EMS)</h1>
    <button type="button" class="btn btn-primary mt-3 p-3" data-toggle="modal" data-target="#myModal">Login to access the
        website
    </button>
</section>


<section class="carousel slide" id="carouselExampleIndicators" data-ride="carousel" style="z-index: 1">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="https://th.bing.com/th/id/R.39641880d884a5fbb4e1e32df7e76d45?rik=ItnB5NtWqNdPWg&riu=http%3a%2f%2fwww.phenom.com%2fsites%2fdefault%2ffiles%2fblog%2farticle%2f2020-04%2ftwitter-In-Stream_Wide___AdobeStock_93940518_0.jpeg&ehk=WrAlw2l4tazY9vaLrqL4UsY1ik%2b4%2fzd3V6CAyZ4VqKY%3d&risl=&pid=ImgRaw&r=0" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://financialservicesblog.accenture.com/wp-content/uploads/2020/10/HR_Technology2-e1574145533715.jpeg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://i1.wp.com/hr-gazette.com/wp-content/uploads/2018/08/bigstock-Job-Search-Human-Resources-Rec-256126069.jpg?fit=1600%2C743&ssl=1" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</section>

<section id="myModal" class="modal fade">
    <div class="modal-dialog modal-login modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Member Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">

                <form action="<c:url value="/login"/>" method="post">
                    <div id="err-login"></div>
                    <div class="form-group">
                        <i class="fa fa-user"></i>
                        <input type="text" name="username" id="username" class="form-control" placeholder="Username"
                               size="50">
                        <small class="text-danger" id="err-username"></small>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password"
                               size="50">
                        <small class="text-danger" id="err-password"></small>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#">Forgot Password?</a>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $('#myModal').on('shown.bs.modal', function () {
            $('#username').focus();
        });
        $('#myModal').on('hidden.bs.modal', function () {
            $('#err-login').html('');
            $('#err-username').html('');
            $('#err-password').html('');
        });
        $('#myModal').on('submit', function (e) {
            e.preventDefault();
            var username = $('#username').val();
            var password = $('#password').val();
            if (username == '') {
                $('#err-login').html('');
                $('#err-username').html('Username is required');
            }
            if (password == '') {
                $('#err-login').html('');
                $('#err-password').html('Password is required');
            }
            if (username != '' && password != '') {
                $('#err-username').html('');
                $('#err-password').html('');
                var msg = null;
                $.ajax({
                    url: '<c:url value="/login"/>',
                    type: 'POST',
                    data: {
                        username: username,
                        password: password
                    },
                    success: function (data) {
                        msg = data.message;
                        switch (msg) {
                            case 'success':
                                window.location.href = '<c:url value="/home"/>';
                                break;
                            case 'fail':
                                $('#err-login').html('<div class="alert alert-danger" role="alert" xmlns="http://www.w3.org/1999/html">' +
                                    '<small><strong>Login failed!</strong></br> Please check username or password.</small>' +
                                    '</div>');
                                $('#err-login').effect('shake');
                                break;
                            case 'not_active':
                                $('#err-login').html('<div class="alert alert-danger" role="alert">' +
                                    '<strong>Login failed!</strong><small> Your account is not active. Please contact the administrator.</small>' +
                                    '</div>');
                                $('#err-login').effect('shake');
                                break;
                        }
                    }
                });
            }
        });
    });

    $('.carousel').carousel({
        interval: 2000
    });

</script>

</body>

</html>
