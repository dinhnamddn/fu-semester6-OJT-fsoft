<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="fa.training.entity.Employee" %>
<%@ page import="fa.training.entity.Account" %>
<%@ page import="fa.training.dao.impl.AccountDAOImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: TRONG TUAN
  Date: 8/8/2022
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/startmin.css" rel="stylesheet">
    <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"
          type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"
          type="text/css"/>
</head>

<body>
<div id="wrapper">
    <%  AccountDAOImpl accountDAO = new AccountDAOImpl(); %>

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
                    <p class="page-header" style="font-size: 33px">Employee list</p>
                </div>
                <div class="col-12 col-md-1 col-lg-5"></div>
                <% String search = (String) request.getAttribute("search"); %>
                <% String searchBy = (String) request.getAttribute("searchBy"); %>
                <div class="col-12 col-md-11 col-lg-7 text-right">
                    <form class="form-inline" id="search" action="/search" method="GET">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fas fa-search"></i></div>
                                <input style="margin-right: 10rem;" type="text" class="form-control" id="userSearch" name="userSearch"
                                       placeholder="User Search" value="<%= search == null ? "" : search%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <% if (searchBy == null) {
                                    searchBy = "full_name";
                                }%>
                                <div class="input-group-addon"><i class="fas fa-filter"></i> Filter By</div>
                                <select class="form-control" name="filterBy" id="filterBy">
                                    <option value="employee_id" <%= searchBy.equals("employee_id") ? "selected" : "" %>>ID</option>
                                    <option value="full_name" <%= searchBy.equals("full_name") ? "selected" : "" %>>Name</option>
                                    <option value="date_of_birth" <%= searchBy.equals("date_of_birth") ? "selected" : "" %>>DOB</option>
                                    <option value="address" <%= searchBy.equals("address") ? "selected" : "" %>>Address</option>
                                    <option value="phone" <%= searchBy.equals("phone") ? "selected" : "" %>>Phone</option>
                                    <option value="department_name" <%= searchBy.equals("department_name") ? "selected" : "" %>>Dept</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="table-data col-12 col-md-12 col-lg-12" style="margin-top: 15px;">
                    <% String type = (String) request.getAttribute("type");%>
                    <% int totalEmployee = (Integer) request.getAttribute("totalEmployee");%>
                    <% if (totalEmployee == 0 && type.equals("search")) { %>
                    <div class="alert alert-danger text-center" role="alert">
                        <strong>No matches!</strong>
                    </div>
                    <% } else { %>
                    <div class="text-left" style="margin-bottom: 4px;">
                        <em>Total employee: <strong><%= totalEmployee %></strong></em>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="dataTable">
                        <thead style="background-color: rgb(242, 242, 242);">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Date of birth</th>
                            <th>Address</th>
                            <th>Phone number</th>
                            <th>Department</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody id="table-body">
                        <% List<Employee> employeeList = (List<Employee>) request.getAttribute("listEmployee"); %>
                        <% for (Employee employee : employeeList) { %>
                        <tr>
                            <td><%= employee.getEmpId() %>
                            </td>
                            <td><%= employee.getFirstName() + " " + employee.getLastName() %>
                            </td>
                            <td><%= employee.getBirthDate() %>
                            </td>
                            <td><%= employee.getAddress() %>
                            </td>
                            <td><%= employee.getPhone() %>
                            </td>
                            <td><%= employee.getDeptName() %>
                            </td>
                            <td style="display: flex">
                                <a id="viewEmployee" data-toggle="modal" data-target="#viewModal<%=employee.getEmpId()%>"><i class='fas fa-eye'></i> View</a>
                                <p style="margin-left: 4px; margin-right: 4px">|</p>
                                <a id="deleteEmployee" data-toggle="modal" data-target="#deleteModal<%=employee.getEmpId()%>" style="color: #ac2925"><i class="fas fa-trash-alt"></i> Delete</a>

                                <div class="modal fade" id="deleteModal<%=employee.getEmpId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title"><strong>Delete Employee: </strong><span style="color: #843534"><%= " " + employee.getFirstName() + " " + employee.getLastName() + " [ID - " + employee.getEmpId() + "]"%></span></h4>
                                            </div>
                                            <div class="modal-body" id="warning-delete">
                                                <p>Are you sure you want to delete this employee?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="button-delete" class="btn btn-danger" data-dismiss="modal" onclick="deleteEmployee(<%=employee.getEmpId()%>)">Delete</button>
                                                <button type="button" id="button-cancel" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="viewModal<%=employee.getEmpId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title"><strong>Employee Detail: </strong><span style="color: #843534"><%= " " + employee.getFirstName() + " " + employee.getLastName() + " [ID - " + employee.getEmpId() + "]"%></span></h4>
                                            </div>
                                            <div class="modal-body">
<%--                                                onsubmit="return saveChange(<%=employee.getEmpId()%>);" action="/update-employee?empIdUpdate=<%=employee.getEmpId()%>" method="POST"--%>
                                                <form id="form-update<%=employee.getEmpId()%>" onchange="updateEmployee(<%=employee.getEmpId()%>)" >
                                                    <div class="row">
                                                        <div class="col-12 col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label for="empIdModal<%=employee.getEmpId()%>">ID</label>
                                                                <input type="text" class="form-control" name="empIdModal<%=employee.getEmpId()%>" id="empIdModal<%=employee.getEmpId()%>" value="<%= employee.getEmpId() %>" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="firstNameModal<%=employee.getEmpId()%>">First name</label>
                                                                <input type="text" class="form-control" name="firstNameModal<%=employee.getEmpId()%>" id="firstNameModal<%=employee.getEmpId()%>" value="<%= employee.getFirstName() %>">
                                                                <div class="invalid-feedback" id="firstNameModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lastNameModal<%=employee.getEmpId()%>">Last name</label>
                                                                <input type="text" class="form-control" name="lastNameModal<%=employee.getEmpId()%>" id="lastNameModal<%=employee.getEmpId()%>" value="<%= employee.getLastName() %>">
                                                                <div class="invalid-feedback" id="lastNameModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Gender</label>
                                                                <div class="form-check">
                                                                    <input type="radio" id="female<%=employee.getEmpId()%>" name="genderModal<%=employee.getEmpId()%>" value="0" <%= employee.getGender() == 0 ? "checked" : ""%>> Female
                                                                    <input style="margin-left: 4%;" type="radio" id="male<%=employee.getEmpId()%>" name="genderModal<%=employee.getEmpId()%>" value="1" <%= employee.getGender() == 1 ? "checked" : "" %>> Male
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="birthDateModal<%=employee.getEmpId()%>">Date of birth</label>
                                                                <input type="date" class="form-control" name="birthDateModal<%=employee.getEmpId()%>" id="birthDateModal<%=employee.getEmpId()%>" value="<%= employee.getBirthDate() %>">
                                                                <div class="invalid-feedback" id="birthDateModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="addressModal<%=employee.getEmpId()%>">Address</label>
                                                                <textarea class="form-control" name="addressModal<%=employee.getEmpId()%>" id="addressModal<%=employee.getEmpId()%>" rows="2"><%= employee.getAddress() == null ? "" : employee.getAddress() %></textarea>
                                                                <div class="invalid-feedback" id="addressModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6 col-lg-6">
                                                            <% Account account = accountDAO.findByIdEmp(employee.getEmpId());
                                                                String accountName = "";
                                                                String email = "";
                                                                String status = "";
                                                                if (account != null) {
                                                                    accountName = account.getAccount();
                                                                    email = account.getEmail();
                                                                    status = account.getStatus() == 1 ? "Active" : "Inactive";
                                                                }
                                                            %>
                                                            <div class="form-group">
                                                                <label for="accountModal<%=employee.getEmpId()%>">Account</label>
                                                                <input type="text" class="form-control" name="accountModal<%=employee.getEmpId()%>" id="accountModal<%=employee.getEmpId()%>" value="<%= accountName %>" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="emailModal<%=employee.getEmpId()%>">Email</label>
                                                                <input type="text" class="form-control" name="emailModal<%=employee.getEmpId()%>" id="emailModal<%=employee.getEmpId()%>" value="<%= email %>" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phoneModal<%=employee.getEmpId()%>">Phone number</label>
                                                                <input type="text" class="form-control" name="phoneModal<%=employee.getEmpId()%>" id="phoneModal<%=employee.getEmpId()%>" value="<%= employee.getPhone() %>">
                                                                <div class="invalid-feedback" id="phoneModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="departmentModal<%=employee.getEmpId()%>">Department</label>
                                                                <select class="form-control" name="departmentModal<%=employee.getEmpId()%>" id="departmentModal<%=employee.getEmpId()%>">
                                                                    <option value="Fsoft Academy" <%= employee.getDeptName().equals("Fsoft Academy") ? "selected" : ""%>>Fsoft Academy</option>
                                                                    <option value="HR" <%= employee.getDeptName().equals("HR") ? "selected" : ""%>>HR</option>
                                                                    <option value="Sales" <%= employee.getDeptName().equals("Sales") ? "selected" : ""%>>Sales</option>
                                                                    <option value="Marketing" <%= employee.getDeptName().equals("Marketing") ? "selected" : ""%>>Marketing</option>
                                                                    <option value="Accounting" <%= employee.getDeptName().equals("Accounting") ? "selected" : ""%>>Accounting</option>
                                                                    <option value="Management" <%= employee.getDeptName().equals("Management") ? "selected" : ""%>>Management</option>
                                                                    <option value="Customer Service" <%= employee.getDeptName().equals("Customer Service") ? "selected" : ""%>>Customer Service</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Status</label>
                                                                <div class="form-check">
                                                                    <input type="radio" id="active<%=employee.getEmpId()%>" name="statusModal<%=employee.getEmpId()%>" value="1" <%= status.equals("Active") ? "checked" : ""%>> Active
                                                                    <input style="margin-left: 4%;" type="radio" id="inactive<%=employee.getEmpId()%>" name="statusModal<%=employee.getEmpId()%>" value="0" <%= status.equals("Inactive") ? "checked" : ""%>> Inactive
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="remarkModal<%=employee.getEmpId()%>">Remark</label>
                                                                <textarea class="form-control" name="remarkModal<%=employee.getEmpId()%>" id="remarkModal<%=employee.getEmpId()%>" rows="2"><%= employee.getRemark() == null ? "" : employee.getRemark() %></textarea>
                                                                <div class="invalid-feedback" id="remarkModalError<%=employee.getEmpId()%>"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <p class="text-danger" id="msgUpdate<%=employee.getEmpId()%>"></p>
                                                        <button type="button" style="display: none" class="btn btn-primary" id="close-update<%=employee.getEmpId()%>" data-dismiss="modal" onclick="closeUpdateSuccess(<%=employee.getEmpId()%>)">Close</button>
                                                        <button type="button" class="btn btn-primary" id="close-view<%=employee.getEmpId()%>" data-dismiss="modal" onclick="closeView(<%=employee.getEmpId()%>)">Close</button>
                                                        <button type="button" style="display: none" class="btn btn-success" id="update-employee<%=employee.getEmpId()%>" onclick="saveChange(<%=employee.getEmpId()%>)">Save changes</button>
                                                        <button type="reset" style="display: none" class="btn btn-danger" id="cancel-update<%=employee.getEmpId()%>" onclick="cancelUpdate(<%=employee.getEmpId()%>)">Cancel changes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                    <% } %>
                    <% String msgAdd = (String) request.getAttribute("msgAdd");
                        if (msgAdd != null) { %>
                    %>
                    <div id="msgAdd" class="alert alert-success"><%= msgAdd %></div>
                    </div>
                    <% } %>
                </div>

                <div class="col-12 col-md-12 col-lg-12">
                <%if (type.equals("listAll")) { %>
                <% int pageIndex = (Integer) request.getAttribute("pageIndex"); %>
                <% int totalPage = (Integer) request.getAttribute("totalPage"); %>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item <%=pageIndex <= 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/employee-list?pageIndex=<%=Math.max((pageIndex - 1), 1) %>">Previous</a>
                        </li>
                        <% for (int i = 1; i <= totalPage; i++) { %>
                        <li class="page-item <%=pageIndex == i ? "active" : ""%>"><a class="page-link" href="<%=request.getContextPath()%>/employee-list?pageIndex=<%=i%>"><%=i%></a></li>
                        <% } %>
                        <li class="page-item <%=pageIndex >= totalPage ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/employee-list?pageIndex=<%=Math.min((pageIndex + 1), totalPage)%>">Next</a>
                        </li>
                    </ul>
                </nav>
                <% } %>

                <% if (type.equals("search")) { %>
                <% int pageIndexS = (Integer) request.getAttribute("pageIndexSearch"); %>
                <% int totalPageS = (Integer) request.getAttribute("totalPageSearch"); %>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item <%=pageIndexS <= 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/search?userSearch=<%=search%>&filterBy=<%=searchBy%>&pageIndexSearch=<%=Math.max((pageIndexS - 1), 1) %>">Previous</a>
                        </li>
                        <% for (int j = 1; j <= totalPageS; j++) { %>
                        <li class="page-item <%=pageIndexS == j ? "active" : ""%>"><a class="page-link" href="<%=request.getContextPath()%>/search?userSearch=<%=search%>&filterBy=<%=searchBy%>&pageIndexSearch=<%=j%>"><%=j%></a></li>
                        <% } %>
                        <li class="page-item <%=pageIndexS >= totalPageS ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/search?userSearch=<%=search%>&filterBy=<%=searchBy%>&pageIndexSearch=<%=Math.min((pageIndexS + 1), totalPageS)%>">Next</a>
                        </li>
                    </ul>
                </nav>
                <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteSuccess" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h3 class="modal-title" id="deleteModalLabelS">Notice</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Employee deleted successfully!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteFail" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h3 class="modal-title" id="deleteModalLabelF">Notice</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Employee deleted fail!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script>
    function updateEmployee(id) {
        $("#update-employee" + id).show();
        $("#cancel-update" + id).show();
        $('#close-view' + id).hide();
    }

    function closeUpdateSuccess(id) {
        window.location.reload();
    }

    function saveChange(id) {
        if (checkValidate(id)){
            $.ajax({
                url: "<%=request.getContextPath()%>/update-employee",
                type: "POST",
                data: {
                    idEmp: id,
                    firstNameModal: $("#firstNameModal" + id).val(),
                    lastNameModal: $("#lastNameModal" + id).val(),
                    genderModal: $("#male" + id).is(":checked") ? "1" : "0",
                    birthDateModal: $("#birthDateModal" + id).val(),
                    phoneModal: $("#phoneModal" + id).val(),
                    addressModal: $("#addressModal" + id).val(),
                    departmentModal: $("#departmentModal" + id).val(),
                    remarkModal: $("#remarkModal" + id).val(),
                    statusModal: $("#active" + id).is(":checked") ? "1" : "0"
                },
                success: function(data) {
                    if (data.messageUpdate === "success") {
                        $("#update-employee" + id).hide();
                        $("#cancel-update" + id).hide();
                        $('#close-update' + id).show();
                        $("#msgUpdate" + id).html("<div class='alert alert-success'>Update success!</div>");
                        setTimeout(function() {
                            $("#msgUpdate" + id).html("");
                        }, 2000);
                    } else {
                        $("#msgUpdate" + id).html("<div class='alert alert-danger'>Update fail!</div>");
                        setTimeout(function() {
                            $("#msgUpdate" + id).html("");
                        }, 2000);
                    }
                }
            });
        }
    }


    function checkValidate(id) {
        let firstName = $("#firstNameModal" + id).val();
        let lastName = $("#lastNameModal" + id).val();
        let birthday = $("#birthDateModal" + id).val();
        let address = $("#addressModal" + id).val();
        let phone = $("#phoneModal" + id).val();
        let remark = $("#remarkModal" + id).val();
        let check = true;

        if (firstName === '') {
            $("#firstNameModalError" + id).html("<span class='text-danger'>This field is required</span>");
            //time out for remove error message
            setTimeout(function() {
                $("#firstNameModalError" + id).html("");
            }, 3000);
            check = false;
        } else if (firstName.length > 50) {
            $("#firstNameModalError" + id).html("<span class='text-danger'>This field must be less than 50 characters</span>");
            check = false;
        } else if (!firstName.match(/^[a-zA-Z\s]+$/)) {
            $("#firstNameModalError" + id).html("<span class='text-danger'>This field must be letter</span>");
            check = false;
        } else {
            $("#firstNameModalError" + id).html("");
        }

        if (lastName === '') {
            $("#lastNameModalError" + id).html("<span class='text-danger'>This field is required</span>");
            check = false;
        } else if (lastName.length > 50) {
            $("#lastNameModalError" + id).html("<span class='text-danger'>This field must be less than 50 characters</span>");
            check = false;
        } else if (!lastName.match(/^[a-zA-Z\s]+$/)) {
            $("#lastNameModalError" + id).html("<span class='text-danger'>This field must be letter</span>");
            check = false;
        } else {
            $("#lastNameModalError" + id).html("");
        }

        if (birthday === '') {
            $("#birthDateModalError" + id).html("<span class='text-danger'>This field is required</span>");
            check = false;
        } else {
            $("#birthDateModalError" + id).html("");
        }

        if (address.length > 50) {
            $("#addressModalError" + id).html("<span class='text-danger'>This field must be less than 255 characters</span>");
            check = false;
        } else {
            $("#addressModalError" + id).html("");
        }

        if (phone.length > 50) {
            $("#phoneModalError" + id).html("<span class='text-danger'>This field must be less than 50 characters</span>");
            check = false;
        } else if (phone.length < 10) {
            $("#phoneModalError" + id).html("<span class='text-danger'>This field must be more than 10 characters</span>");
            check = false;
        } else {
            $("#phoneModalError" + id).html("");
        }

        if (remark.length > 100) {
            $("#remarkModalError" + id).html("<span class='text-danger'>This field must be less than 255 characters</span>");
            check = false;
        } else {
            $("#remarkModalError" + id).html("");
        }
        return check;
    }

    function cancelUpdate(id) {
        $("#update-employee" + id).hide();
        $("#cancel-update" + id).hide();
        $('#close-view' + id).show();
    }

    function deleteEmployee(id) {
        let msgD = null;
        $.ajax({
            url: "/delete?employee_id=" + id,
            type: "GET",
            data: {
                id: id
            },
            success: function (data) {
                msgD = data.messageDelete;
                if (msgD === "success") {
                    $('#deleteSuccess').modal('show');
                    $('#deleteSuccess').on('hidden.bs.modal', function () {
                        window.location.href = "/employee-list";
                    });
                } else {
                    $('#deleteFail').modal('show');
                    $('#deleteFail').on('hidden.bs.modal', function () {
                        window.location.href = "/employee-list";
                    });
                }
            }
        });
    }

    setTimeout(function() {
        $("#msgAdd").html("");
    }, 2000);

</script>
<!-- jQuery -->
<script src="../../js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../../js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../../js/startmin.js"></script>

</body>

</html>

