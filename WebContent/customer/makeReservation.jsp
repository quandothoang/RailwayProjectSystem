<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #698474;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>

<div class="topnav">
  <a href='index.jsp'>Home</a>
  <a class="active" href='makeReservation.jsp'>Make Reservation</a>
  <a href='myReservations.jsp'>My Reservations</a>
  <a href='logout_customer.jsp'>Logout</a>
</div>

<head>
  <title>Customer Make Reservations</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="main_index.css">
  <link rel="icon" href="images/main_ticket.svg">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href='makeReservation.jsp'><h4> One way </h4></a></li>
      <li><a href='roundTrip.jsp'><h4> Round-trip </h4></a></li>
    </ul>
  </div>
</nav>
<br>

<h2 align='center'> One way trip reservation!</h2>
<div align='center'>
<br>
	<form method="get" action="makeReservationSchedule.jsp">
		<table>
			<tr>    
				<td><h4>Origin:</h4></td><td><input type="text" name="origin"></td>
			</tr>
			<tr>
				<td><h4> Destination: </h4></td><td><input type="text" name="destination"></td>
				
			</tr>
			<tr>
				<td><h5>Date:</h5></td><td><input type="date" name="date"></td>
				<td><h6> Date format: yyyy-mm-dd </h6></td><td>
			</tr>
		</table>
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" value="Add">
		</div>
	</form>
<br>
</div>



</body>
</html>