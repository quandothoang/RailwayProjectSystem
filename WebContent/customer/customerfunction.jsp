<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewprrt" content="width=device-width, initial-scale=1">
	   <title>Customer Train Look Up</title>
   	   
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
    	<link rel="stylesheet" href="main_index.css">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
	
	
<!-- body  -->
<body>

<!-- NAV BAR! -->
<div class="bar"> 
	<nav class="navbar navbar-expand-sm bg-blue navbar-dark" style="background-color: #698474;">
	   <!-- Brand -->
	   <a class="navbar-brand" href="#"><img src="images\main_ticket.svg" height="60"></a>

   	<!-- Links for the JSP FILES-->
  	<ul class="navbar-nav">
    	<li class="nav-item">
           <a class="nav-link" href="../login.jsp">Home</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="customerfunction.jsp">Look Up a Train</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="makeReservation.jsp">Make Reservations</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="myReservations.jsp">MY Reservations</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="FAQ_Customer.jsp">FAQ Page</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="logout_customer.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>
<br>
<h2 align='center'> Look up a Train! Here you can search for a train. </h2>
									  
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->

<div align='center'>
<br>
	<form method="get" action="scheduleshow.jsp"
	method="get" action="schedulesort.jsp">
		<table>
			<tr>    
				<td><h4>Origin:</h4></td><td><input type="text" name="origin"></td>
			</tr>
			<tr>
				<td><h4>Destination:</h4></td><td><input type="text" name="destination"></td>
				
			</tr>
			<tr>
				<td><h4>Date of travel: </h4></td><td><input type="date" name="date"></td>
				<td><h6>Date of travel format: yyyy-mm-dd</h6></td><td>
				
			</tr>
		</table>
		<br> 
		<div class="alert alert-primary" role="alert" align='center'> 
			<input type="submit" value="Search!">
		</div>
	</form>
<br>
</div>


<br>



</body>
</html>