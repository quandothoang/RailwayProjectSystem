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
       <title> Edit Customer Rep. Information </title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">

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
      		<a class="nav-link" href="makeReservation.jsp">Make Reservations</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="adminfunctions.jsp">Admin Function</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="FAQ.jsp">FAQ Page</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="logout_customer.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>
</head>
<body>

<br> 
<br>

<div  class="alert alert-warning" align='center'>
<h1> Admin Functions: Edit Customer Rep. Information </h1>
</div>

<br>
<br>

<div class="alert alert-primary" role="alert" align='center'> 
	<form method="get" action="adminfunctions.jsp">	
		<input type="submit" value="Go back" class='form-control'>
	</form>
</div>

<br> 

<div align = 'center'>
	<h2>  Edit the following Customer Representative Information: </h2>
</div>

<br> 

<div align = 'center'>
	<h5> Look up a customer username to edit first! </h5>
</div>

<!-- 
	person
		username
	 	password
	 	fName
	 	lName
	 	
	 emplyees
	 	ssn
	 	username
	 
	 customerRep
	 	username
 -->
<div align='center'>
 <br>
	<form method="get" action="editCustomerRepCheck.jsp">
		<table>
			<tr>    
				<td><h4> Username: </h4> </td><td><input type="text" name="username"></td>
			</tr>		
		</table>
		<br> 
		
		<div class="alert alert-primary" role="alert" align='center'> 
			<input type="submit" value="Edit Person's Information!">
		</div>
	</form>
<br>
</div>
 

</body>
</html>