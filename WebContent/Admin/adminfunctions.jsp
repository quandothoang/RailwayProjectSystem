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
<%} else { }%>

<!-- Head of thr project  -->
<head>
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Admin Functions </title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
       <link rel="stylesheet" href="style_admin_login.css">

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
      		<a class="nav-link" href="adminfunctions.jsp">Admin Function</a>
		</li>    			
		
 		<li class="nav-item">
      		<a class="nav-link" href="addCustomerRep.jsp">Add Info.</a>
		</li>    	
 		<li class="nav-item">
      		<a class="nav-link" href="editCustomerRep.jsp">Edit Info.</a>
		</li>    	
		 <li class="nav-item">
      		<a class="nav-link" href="deleteCustomerRep.jsp">Delete Info.</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="../login.jsp">Logout</a>
		</li> 
  </ul>

</nav>	
</div>
</head>
<body>
<br> 
<br> 

<!-- Admin Functions  -->
<div align='center' class="alert alert-secondary" role="alert"> 
	<h1> Admin Functions! </h1>
</div>
<br> 

<div align='center'>

<br>
<h2> Add, Edit and Delete information for a customer representative! (Press the buttons!)</h2>
<br> 
<br> 
	<!--  Add -->
	<div class="alert alert-primary" role="alert" align='center'> 
	<form method="get" action="addCustomerRep.jsp">	
		<input type="submit" value="Add Information" class='form-control'>
	</form>
	</div>
	<!-- Edit -->
	<br>
	<div class="alert alert-success" role="alert"> 
	<form method="get" action="editCustomerRep.jsp" align='center'>	
		<input type="submit" value="Edit Information" class='form-control'>
	</form>
	</div> 
	<!-- Delete  -->
	<br> 
	<div class="alert alert-info" role="alert" align='center'>
	<form method="get" action="deleteCustomerRep.jsp">
	
		<input type="submit" value="Delete Information" class='form-control' >
	</form>
	</div>
<br>
</div>


<h1 align='center'> Get Reservation list: </h1>
<h3 align='center'> Pick one at a time! </h3>
<h3 align='center'> e.g. Either choose Transit Line or Passenger name and then search. </h3>
<div align='center'>
<div align='center'> 
<br>
	<form method="get" action="reservationlist.jsp">
	
		<table>
			<tr>    
				<td><h4>Transit line:</h4></td><td><input type="text" name="tlinename"></td>
			</tr>
			<tr>
				<td><h4>Passenger name:</h4></td><td><input type="text" name="cusname"></td>
				
			</tr>
			<tr>
				
	
			</tr>
		</table>
		<br> 
		<div class="alert alert-success" role="alert" align='center'> 
			<input type="submit" value="Search!">
		</div>
	</form>
<br>
</div>

<h1 align='center'> Get Revenue list: </h1>
<h3 align='center'> Pick one at a time! </h3>
<h3 align='center'> e.g. Either choose Transit Line or Passenger name and then search. </h3>
<div align='center'>
<br>
	<form method="get" action="revenuelist.jsp">
	
		<table>
			<tr>    
				<td><h4>Transit line:</h4></td><td><input type="text" name="tlinenamemeow"></td>
			</tr>
			<tr>
				<td><h4>Passenger name:</h4></td><td><input type="text" name="cusnamemeow"></td>
				
			</tr>
			<tr>
				
	
			</tr>
		</table>
		<br> 
		<div class="alert alert-primary" role="alert" align='center'> 
			<input type="submit" value="Search!">
		</div>
	</form>
<br>
</div>

<h1 align = 'center'>Get best customer :</h1>
<div align='center'> 
<br>

<div class="alert alert-warning" role="alert" align='center'> 
	<form method="get" action="bestcustomer.jsp">	
		<input type="submit" value="Get!">
	</form>
</div> 
<br>
</div>

<h1 align='center'> Get best 5 transit lines : </h1>
<br>

<div class="alert alert-info" role="alert" align='center'> 
	<form method="get" action="best5line.jsp">
	
		<input type="submit" value="Get!">
	</form>
</div>
<br>

<h1 align='center'> Get monthly sales report: </h1>
<br>
<div class="alert alert-danger" role="alert" align='center'> 
	<form method="get" action="salespermonth.jsp">
	
		<input type="submit" value="Get!">
	</form>
</div>
<br>
<br> 

</body>
</html>