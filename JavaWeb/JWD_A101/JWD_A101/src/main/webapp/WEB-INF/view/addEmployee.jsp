<%@ page import="fa.training.entity.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: TRONG TUAN
  Date: 8/8/2022
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Employee</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/startmin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"
          type="text/css"/>
</head>

<body>
<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="border-bottom: 0;">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><i class="fas fa-users"></i> Employee</a>
        </div>

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
            <li>
                <% String username = (String) session.getAttribute("username");%>
                <a class="nav-item nav-link" href="#" style="color:blueviolet;"> Welcome <%= username %>
                </a>
            </li>
            <li>
                <a class="nav-item nav-link" href="<c:url value="/logout"/>" style="color: blueviolet;"><i
                        class="fas fa-sign-out-alt"></i> Logout</a>
            </li>

        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fas fa-tachometer-alt "></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-chart-bar"></i> Employee manager<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<c:url value="/employee-list"/>"><i class="fas fa-list"></i> Employee list</a>
                            </li>
                            <li>
                                <a href="<c:url value="/employee-add"/>"><i class="fas fa-plus"></i> Add Employee</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <p class="page-header" style="font-size: 33px">Add Employee</p>
                </div>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="addEmployeeForm" method="POST" action="/employee-add">
                                <div class="form-group">
                                    <label>First name<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="text" class="form-control" name="firstName" id="firstName"
                                           placeholder="First name">
                                </div>
                                <div class="form-group">
                                    <label>Last name<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="text" class="form-control" name="lastName" id="lastName"
                                           placeholder="Last name">
                                </div>
                                <div class="form-group">
                                    <label>Phone number<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="text" class="form-control" name="phone" id="phone"
                                           placeholder="Phone number">
                                </div>
                                <div class="form-group">
                                    <label>Date of birth<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="date" class="form-control" name="birthDate" id="birthDate">
                                </div>
                                <div class="form-group">
                                    <label>Gender<span style="color: rgb(193, 4, 4);">(*)</span></label><br>
                                    <div style="margin-left: 4%;" >
                                        <input type="radio" id="female" name="gender" value="0"> Female
                                        <input style="margin-left: 4%;" type="radio" id="male" name="gender" value="1"> Male
                                    </div>
                                    <span class="errGender" style="display: none; color: #c7254e; font-style: oblique">Please select one option</span>
                                </div>
                                <div class="form-group">
                                    <label>Account<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="text" class="form-control" name="account" id="account"
                                           placeholder="Account" >
                                </div>
                                <div class="form-group">
                                    <label>Email<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label>Password<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <input type="password" class="form-control" name="password" id="password"
                                           placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" rows="3" name="address" id="address"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Status</label><br>
                                    <div style="margin-left: 4%;">
                                        <input type="checkbox" id="status" name="status" value="1" checked> Active
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Department<span style="color: rgb(193, 4, 4);">(*)</span></label>
                                    <select class="form-control" name="department" id="department">
                                        <option value="">Select department</option>
                                        <option value="Fsoft Academy" selected>Fsoft Academy</option>
                                        <option value="HR">HR</option>
                                        <option value="Sales">Sales</option>
                                        <option value="Marketing">Marketing</option>
                                        <option value="Accounting">Accounting</option>
                                        <option value="Management">Management</option>
                                        <option value="Customer Service">Customer Service</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Remark</label>
                                    <textarea class="form-control" rows="3" name="remark" id="remark"
                                              placeholder="Remark"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" onclick="window.location.href='/employee-list'"><i class="fas fa-backward"></i> Back</button>
                                    <button type="reset" class="btn btn-warning"><i class="fas fa-redo"></i> Reset</button>
                                    <button type="submit" class="btn btn-success" name="addEmployee" id="addEmployee"><i class="fas fa-plus"></i> Add
                                    </button>
                                    <div id="msgAdd"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="../../js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../../js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../../js/startmin.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script>
    function removeAscent (str) {
        if (str === null || str === undefined) return str;
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        return str;
    }

    $.validator.methods.letter = function(value, element) {
        return this.optional(element) || /^[a-zA-Z\s]+$/.test(removeAscent(value));
    };

    $.validator.methods.formatPassword = function(value, element) {
        return this.optional(element) || /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/.test(value);
    };

    $.validator.methods.uniqueAcc = function(value, element) {
        var result = false;
        $.ajax({
            url: '<c:url value="/check-account"/>',
            type: 'POST',
            data: {
                account: value
            },
            async: false,
            success: function(data) {
                if (data.message === "true") {
                    result = true;
                } else {
                    result = false;
                }
            }
        });
        return result;
    };

    $.validator.methods.uniqueEmail = function(value, element) {
        var result = false;
        $.ajax({
            url: '<c:url value="/check-email"/>',
            type: 'POST',
            data: {
                email: value
            },
            async: false,
            success: function(data) {
                if (data.message === "true") {
                    result = true;
                } else {
                    result = false;
                }
            }
        });
        return result;
    };

    $(document).ready(function() {
        $('#addEmployeeForm').validate({
            rules: {
                firstName: {
                    required: true,
                    maxlength: 50,
                    letter: true
                },
                lastName: {
                    required: true,
                    maxlength: 50,
                    letter: true
                },
                phone: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 50
                },
                birthDate: {
                    required: true,
                    date: true,
                    dateISO: true
                },
                account: {
                    required: true,
                    maxlength: 50,
                    uniqueAcc: true
                },
                email: {
                    required: true,
                    email: true,
                    maxlength: 50,
                    uniqueEmail: true
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 100,
                    formatPassword: true
                },
                address: {
                    maxlength: 50
                },
                department: {
                    required: true
                },
                remark: {
                    maxlength: 100
                }
            },
            messages: {
                firstName: {
                    required: "Please enter your first name",
                    maxlength: "First name cannot be longer than 50 characters",
                    letter: "First name must contain only letters"
                },
                lastName: {
                    required: "Please enter your last name",
                    maxlength: "Last name must be less than 50 characters",
                    letter: "Last name must contain only letters"
                },
                phone: {
                    required: "Please enter your phone number",
                    digits: "Phone number must contain only digits",
                    minlength: "Phone number must be at least 10 characters",
                    maxlength: "Phone number must be less than 50 characters"
                },
                birthDate: {
                    required: "Please enter your birth date",
                    date: "Please enter a valid date",
                    dateISO: "Please enter a valid date"
                },
                account: {
                    required: "Please enter your account",
                    maxlength: "Account must be less than 50 characters",
                    uniqueAcc: "This account is already in use"
                },
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email",
                    maxlength: "Email must be less than 50 characters",
                    uniqueEmail: "This email is already in use"
                },
                password: {
                    required: "Please enter your password",
                    minlength: "Password must be at least 6 characters",
                    maxlength: "Password must be less than 100 characters",
                    formatPassword: "Password must include uppercase, lowercase and number"
                },
                address: {
                    maxlength: "Address must be less than 50 characters"
                },
                department: {
                    required: "Please select one option"
                },
                remark: {
                    maxlength: "Remark must be less than 100 characters"
                }
            },
            errorElement: "em",
            errorPlacement: function (error, element) {
                error.addClass("help-block");
                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.parent("label"));
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element, errorClass, validClass) {
                $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
    });

    $("#addEmployee").on("click", function () {
        if(($("input[name='gender']:checked").length) <= 0) {
            $(".errGender").show();
        }
        $("input[name='gender']").on("change", function () {
            if ($("input[name='gender']:checked").length > 0) {
                $(".errGender").hide();
            }
        });
    });
</script>

</body>

</html>