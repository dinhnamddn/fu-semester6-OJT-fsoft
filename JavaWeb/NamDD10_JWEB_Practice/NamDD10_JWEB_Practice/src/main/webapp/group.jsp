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
  </style>
</head>
<body>
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

    <button ><a href="group?button=button"></a> Make Group</button>

  </div>
</div>
<footer class="container-fluid" style="text-align: center; border: solid 1px #000">
  <h3>Powered by Servlet</h3>
</footer>
</body>
</html>
