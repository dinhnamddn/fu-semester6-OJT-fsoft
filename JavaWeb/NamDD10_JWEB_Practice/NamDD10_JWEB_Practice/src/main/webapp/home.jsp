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
    .row.content {
      /* height: 1500px */
    }

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

      .row.content {
        height: auto;
      }
    }

    .listnav li {
      list-style: none;
    }
  </style>
</head>

<body>

<header style="text-align: center; border: solid 1px #000;">
  <h1>WELCOME TO FIFA WORLD CUP 2022</h1>
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
      <h3 style="margin: 0 auto; text-align: center; padding: 40px;">FIFA WORLD CUP 2022</h3>
    </div>
  </div>
</div>

<footer class="container-fluid" style="text-align: center; border: solid 1px #000">
  <h3>Powered by Servlet</h3>
</footer>
</body>

</html>
