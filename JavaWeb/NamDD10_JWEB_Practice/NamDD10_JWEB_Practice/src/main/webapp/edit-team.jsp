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
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    .listnav li {
        list-style: none;
    }
  </style>
</head>
<body>
<header style="text-align: center; border: solid 1px #000;">
    <h1>FIFA WORLD CUP 2022</h1>
</header>
<div class="container-fluid">
  <div class="row content">
      <div class="col-sm-3" style="border-right: solid 1px #000;">
          <h5 style="font-weight: bold;">MENU:</h5>
          <ul class="listnav">
              <li class="active"><a href="<c:url value="/team-list"/>">Team management</a></li>
              <li><a href="<c:url value="/group"/>">Group infomation</a></li>
          </ul><br>
      </div>

    <div class="col-sm-9">
        <h3>Teams management</h3>
        <form action="edit?id=${team.id}" method="POST">
        <table class="table">
            <tr>
                <th>Team</th>
                <th>Coach</th>
<%--                <th>--%>
<%--                    National--%>
<%--                </th>--%>
                <th>Seed</th>
            </tr>
            <tr>
                <td>
                    <input name="team_name" value="${team.name}" />
                </td>
                
                <td>
                    <input name="coach_name" value="${team.coach}" />
                </td>
<%--                <td>--%>
<%--                    <input name="national_name" value="${team.national}" />--%>
<%--                </td>--%>
                <td>
                    <input type="number" min="1" name="seed" value="${team.seed}" />
                </td>
            </tr>
        </table>
        <button>Save Team</button>
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
                        <a>Edit</a>
                     
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

<footer class="container-fluid" style="text-align: center; border: solid 1px #000">
    <h3>Base on Servlet</h3>
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
