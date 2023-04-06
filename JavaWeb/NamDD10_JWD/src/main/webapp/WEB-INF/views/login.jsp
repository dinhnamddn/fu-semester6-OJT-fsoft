<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

            .trigger-btn {
                display: inline-block;
                margin: 100px auto;
            }
        </style>
    </head>

    <body>
        <div class="text-center">
            <a href="#myModal" class="trigger-btn" data-toggle="modal" id="trigger-btn"></a>
        </div>

        <div id="myModal" class="modal fade">
            <div class="modal-dialog modal-login">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Member Login</h4>
                        <p style="color: red; text-align: center;">$mess</p>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <i class="fa fa-user"></i>
                                <input type="text" name="username" class="form-control" placeholder="Username" required="required">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="password" class="form-control" placeholder="Password" required="required">
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
        </div>

        <script>
            $(document).ready(function () {
                $('#trigger-btn').click();
            })
        </script>
    </body>

</html>
