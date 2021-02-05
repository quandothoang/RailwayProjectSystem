<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- If user is NULl -->
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in
<br/>

<a href="login.jsp">Please Login</a>
<%} else {} %>
<html>


<!-- Head of thr project  -->
<head>
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Edit and delete information | Customer Reps</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
       <link rel="stylesheet" href="style_customer_login.css">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   	    
</head>
<body>

<!-- NAV BAR! -->
<div class="bar"> 
	<nav class="navbar navbar-expand-sm bg-blue navbar-dark" style="background-color: #698474;">
	   <!-- Brand -->
	   <a class="navbar-brand" href="#"><img src="images\main_ticket.svg" height="60"></a>

   	<!-- Links for the JSP FILES-->
  	<ul class="navbar-nav">
    	<li class="nav-item">
           <a class="nav-link" href="index.jsp">Home</a>
    	</li>
    
    	<li class="nav-item">
      		<a class="nav-link" href="trainScheduleInfo.jsp">Train Schedule Info</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="logout_customerRep.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>

<br> 

<div align='center' >
<div class="alert alert-warning" align='center'>
  <strong>EDIT and DELETE information for train schedules. </strong>
</div>
</div>

<br>


<h1 align='center'> Train Schedule Edit Information: </h1>
<br>
<form method="get" action="trainScheduleEditDBCheck.jsp">
	<table>

		<tr>
			<td><h4> Train ID:</h4></td><td><input type="text" name="trainID"></td>
				
		</tr>
		<tr>
			<td><h4> Transit Line Name: </h4></td><td><input type="text" name="tLine_name"></td>
		</tr>

		<tr>
			<td><h4> Date: </h4> </td><td><input type="text" name="date"></td>
			<td><h6> Date format: yyyy-mm-dd</h6></td><td>
		</tr>			
	</table>
	<input type="submit" value="Change">
</form>
 
<br>
<h1 align='center'> Train Schedule Information Delete: </h1>
<br>
	<form method="get" action="deleteTrainScheduleCheck.jsp">
	
		<table>
			<tr>
				<td><h4> Train ID: </h4></td><td><input type="text" name="trainID"></td>
			</tr>
			<tr>    
				<td><h4> Transit line: </h4></td><td><input type="text" name="tLine_name"></td>
			</tr>			
			<tr>
				<td><h4> Date: </h4></td><td><input type="text" name="date"></td>
				<td><h6> Date format: yyyy-mm-dd </h6></td><td>
				
			</tr>
		</table>
		<input type="submit" value="Delete">
	</form>
<br>
<div align='center' >
<div class="alert alert-warning" align='center'>
  <h2> <strong>Produce Lists! For train schedules and customers. </strong></h2>
</div>
</div>
<h1 align='center'> Train Schedule list:</h1>
<br>
<form method="get" action="cityNameCheck.jsp">
	<table> 
		<tr> 
			<td><h4> City Name: </h4></td><td><input type="text" name="cityName"></td>
		</tr>
	</table>
		<input type="submit" value="Search!">

</form>

<br>
<h1 align='center'>Reservation list:</h1>
<br> 
<form method="get" action="reservationListCheck.jsp"?>
	<table> 
		<tr>
			<td><h4>Transit Line name:</h4></td><td><input type="text" name="tLine_name"></td>
		</tr>
		<tr>  
			<td><h4>Date:</h4></td><td><input type="text" name="date"></td>
		</tr>
	</table>
		<input type="submit" value="Search!">

</form>



</body>
</html>