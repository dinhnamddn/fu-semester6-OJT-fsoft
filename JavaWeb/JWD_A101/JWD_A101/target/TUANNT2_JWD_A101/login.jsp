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
    <link rel="stylesheet" href="css/loginStyle.css">
</head>
<body>
<section class="text-center mt-5">
    <h1>Welcome to Employee Management System (EMS)</h1>
    <button type="button" class="btn btn-warning mt-3" data-toggle="modal" data-target="#myModal">Login to access the
        website
    </button>
</section>

<section id="myModal" class="modal fade">
    <div class="modal-dialog modal-login modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Member Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="#" method="post">
                    <div class="form-group">
                        <i class="f fa-user"></i>
                        <input type="text" class="form-control" placeholder="Username" required="required" size="50">
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock"></i>
                        <input type="password" class="form-control" placeholder="Password" required="required" size="50">
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
</body>

</html>
