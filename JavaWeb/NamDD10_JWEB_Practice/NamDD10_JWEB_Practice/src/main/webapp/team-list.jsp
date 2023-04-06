<%--
  Created by IntelliJ IDEA.
  User: Phong Vu
  Date: 12/6/2022
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>Menu</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Team management</a></li>
        <li><a href="#section2">Group infomation</a></li>
      </ul><br>
      
    </div>

    <div class="col-sm-9">
        <h3>Teams management</h3>
        <form action="team-list" method="POST">
        <table class="table">
            <tr>
                <th>Team</th>
                <th>Coach</th>
                <th>Rank</th>
            </tr>
            <tr>
                <td>
                    <input name="team_name" />
                </td>
                
                <td>
                    <input name="coach_name" />
                </td>
                <td>
                    <input type="number" min="1" name="seed" />
                </td>
            </tr>
        </table>
            <p>${mess == 1?"Can not add new Team (Team not greater than 16)":""}<p>
        <button ${mess == 1?"hidden":""}>Save Team</button>
        </form>
        <table class="table">
            <tr>
                <th>No.</th>
                <th>Team</th>
                <th>Coach</th>

                <th>Seed</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${teams}" var="team">
                <tr>
                    <td>${team.id}</td>
                    <td>${team.name}</td>
                    <td>${team.coach}</td>
                    <td>${team.seed}</td>
                    <td>
                        <a href="edit?id=${team.id}">Edit</a>
                     
                        <c:set var="url" value="delete?id=${team.id}"/>   
                                                <a onclick="changeStatus('${url}')"
                                                  >
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-undo"></i>
                                                    </span>
                                                    <span class="text">Delete</span>
                                                </a>  
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>
<div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Confirm</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                    </div>
                    <div class="modal-body">
                        <p>Do you want to delete status?</p>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" id="urlChangeStatus">Delete</a>
                    </div>
                </div>

            </div>
        </div>
</body>
 <script>
                                                    function changeStatus(url) {
                                                        $('#urlChangeStatus').attr("href", url);
                                                        $("#myModal").modal('show');
                                                    }
        </script>
</html>
