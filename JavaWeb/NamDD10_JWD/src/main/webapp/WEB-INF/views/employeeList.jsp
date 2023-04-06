<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Document</title>
    </head>



    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between pt-0 pb-0"
             style="/* border-bottom: 1px solid #e1e1e1; */">
            <a class="navbar-brand" href="#" style="color: #777777;"><i class="fas fa-users" style="color: #777777;"></i>
                Employee</a>
            <div>
                <a href="">Welcome ${requestScope.employee.lastName}</a>
                &nbsp; &nbsp; &nbsp;
                <a href="logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
            </div>
        </nav>

        <section class="container mx-0" style="max-width: 100%;">
            <div class="row" style="border: none;">
                <div class="col-md-2 px-0 pt-0 rounded-0" style="background-color: #f7f7f7; ">
                    <div class="card" style="border-radius: 0; border: 0;">
                        <div class="card-body p-0" style="border: 0; border-radius: 0;">
                            <ul class="list-group" style="border-bottom: 1px solid #d8d8d8 ;">
                                <li class="list-group-item"
                                    style="background-color: #f7f7f7; border-right:0; border-top:0; border-radius: 0;">
                                    <a href=""><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                                </li>
                                <li class="list-group-item"
                                    style="background-color: #f7f7f7; border-right: 0; border-bottom: 0;">
                                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true"
                                       class="dropdown-toggle"><i class="fas fa-chart-area"></i> Employee manager</a>
                                    <ul class="list-unstyled collapse show" id="homeSubmenu" style="">
                                        <li style="padding-left:20px ; font-size: 15px; padding-top: 10px;">
                                            <a href="dashboard"><i class="fas fa-list"></i> Employee list</a>
                                        </li>
                                        <li style="padding-left:20px ;font-size: 15px; padding-top: 10px;">
                                            <a href="add"><i class="fas fa-plus"></i> Add Employee</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-10 pb-5" style="border-left: 1px solid #dcdcdc;border-top: 1px solid #dcdcdc;">
                    <div class="title mt-3" style="border-bottom: 1px solid #f4f4f4;">
                        <h2 style="margin-left: 10px;">Employee list</h2>
                    </div>

                    <div class="container mw-100 p-0 m-0">
                        <div class="row p-0 w-100 m-0">
                            <div class="col-lg-4 col-md-12 col-sm-12">
                            </div>
                            <div class="col-lg-8 col-md-12 col-sm-12 filter py-3 px-0  flex-no-wrap">
                                <!-- form search -->
                                <form action="search" method="get" class="form-inline my-2 my-lg-0 justify-content-end" style="flex: 0.5;">

                                    <div class="input-group" style="margin-right: 10px;">
                                        <div class="input-group-prepend">
                                            <button id="button-addon8" type="submit" class="btn"
                                                    style="border: 1px solid #e3e3e3 ;"> <i class="fa fa-search"> </i> </button>
                                        </div>
                                        <input type="search" name="key" placeholder="User Search" aria-describedby="button-addon8"
                                               class="form-control" style="width: 300px;" value="${requestScope.key}">
                                    </div>

                                    <div class="input-group" style="margin-right: 10px;">
                                        <div class="input-group-prepend">
                                            <button id="button-addon8" type="submit" class="btn"
                                                    style="border: 1px solid #e3e3e3 ;"> <i class="fas fa-filter"></i> Filter
                                                by:</button>
                                        </div>
                                        
                                        <c:set value="${requestScope.option}" var="o"></c:set>
                                        <select name="option" class="form-control" id="exampleFormControlSelect1" aria-placeholder="Name">
                                            <option value="1" <c:if test="${o == 1}">selected</c:if>>Name</option>
                                            <option value="2" <c:if test="${o == 2}">selected</c:if>>ID</option>
                                            <option value="3" <c:if test="${o == 3}">selected</c:if>>Department</option>
                                        </select>
                                    </div>

                                    <button class="btn btn-light border " type="submit"
                                            style="background-color: #5bc0de; color: white;">Search</button>
                                </form>
                            </div>
                        </div>
                        <form id="view-content" class="form-edit-content w-100 table-responsive-sm" action="profile.html"
                              method="post" style="width: 100%;">
                            <table class="table table-striped table-bordered">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th  class="border">
                                            ID
                                        </th>
                                        <th  class="border">
                                            Name
                                        </th>
                                        <th  class="border">
                                            Date Of Birth
                                        </th>
                                        <th  class="border">
                                            Address
                                        </th>
                                        <th  class="border">
                                            Phone number
                                        </th>
                                        <th  class="border">
                                            Department
                                        </th>
                                        <th style="width: 9%;" class="border">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach items="${requestScope.listEm}" var="e">
                                        <tr >
                                            <td >
                                                ${e.emID}
                                            </td>
                                            <td >
                                                ${e.firstName} ${e.lastName}
                                            </td>
                                            <td >
                                                ${e.dateOfBirth}
                                            </td>
                                            <td >
                                                ${e.address}
                                            </td>
                                            <td >
                                                ${e.phone}
                                            </td>
                                            <td >
                                                ${e.departmentName}
                                            </td>
                                            <td >
                                                <i class="fas fa-eye" style="color: #2f78b5;"></i><a href="#"> View</a><br>
                                                <i class="fas fa-trash-alt" style="color: #2f78b5;" ></i><a href="delete?emID=${e.emID}"> Delete</a>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <div class="col-sm-12 col-md-5 p-0">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                <ul class="pagination">
                                    <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                        <a href="#" class="page-link">Previous</a>
                                    </li>
                                    <li class="paginate_button page-item active">
                                        <a href="#" class="page-link">1</a>
                                    </li>
                                    <li class="paginate_button page-item next disabled" id="dataTable_next">
                                        <a href="#" class="page-link">Next</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>
    </body>


</html>
