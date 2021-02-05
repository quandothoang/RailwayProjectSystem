<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- If user is NULl -->
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in
<br/>

<a href="../login.jsp">Please Login</a>
<%} else { %>



<!-- Head of thr project  -->
<head>
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Customer Rep. Dashboard</title>
       
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
      		<a class="nav-link" href="trainScheduleInfo.jsp">Edit and delete train schedule info.</a>
    	</li>
	
		<li class="nav-item">
      		<a class="nav-link" href="FAQ.jsp">FAQ: Customer Rep. Side</a>
		</li>  
	
		<li class="nav-item">
      		<a class="nav-link" href="../login.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>

<br> 
<br>
<div align='center' >
<div class="alert alert-warning" align='center'>
  <strong>Customer Representative Dashboard! For all your Customer Service needs.</strong>
</div>
</div>
<div align='center'> 

<table> 
<thead>
<tr> 

<!-- Make Reservations -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Edit and delete information for train schedules. </h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here to edit train info! </h6>
    <p class="card-text">Edit and delete information.</p>
    <a href="trainScheduleInfo.jsp" class="card-link">Edit and delete train info as a customer rep! </a>
  </div>
</div>
</th>


<!-- Make Reservations -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> Produce A list of train schedules or Customers! </h5>
    <h6 class="card-subtitle mb-2 text-muted">Produce Lists!</h6>
    <p class="card-text">Given a train schedules or customers who have reservations.</p>
    <a href="trainScheduleInfo.jsp" class="card-link">Produce a list! </a>
  </div>
</div>
</th>


<!-- MY Reservations 
<th>
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title"> MY Reservations</h5>
    <h6 class="card-subtitle mb-2 text-muted">Check out your previous registrations!</h6>
    <p class="card-text">Check your previous reservations!</p>
    <a href="myReservations.jsp" class="card-link">Check YOUR Reservations!</a>
  </div>
</div>
</th> 
-->
<!-- FAQ -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">FAQ: Answer customer's questions! </h5>
    <h6 class="card-subtitle mb-2 text-muted">Answer everyone's questions!</h6>
    <p class="card-text">A dashboard that lets you answer customer's questions.</p>
    <a href="FAQ.jsp" class="card-link">Answers questions!</a>
  </div>
</div>
</th>
</tr>
</thead>
</table>
</div>

<!-- Stats -->

<div align='center'> 
	<table class="meme" >
		<thead>
			<tr class="main"> 
				<div align="center"> 
					<th scope="col" style="vertical-align:bottom"><button type="button" class="btn btn-success" align="center"><span class="label label-success">Our Month's Progress</span></button>
					</th>	
				</div>
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success"></span> Tons of Cargo Moved Daily</button>
					</th>	
				</div>
				
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td align="left"><img class="img-responsive" src="images/bar.png" height="280"></td>
		<br>
			<td align="center"><img class="img-responsive" src="images/chart.png" height="290"></td>
		<br> 
		
		</tr> 
		</tbody>	
	</table>
</div>
<br> 
<br> 


<!-- Logs out of page -->
<div align="center"> 
<form action="../login.jsp">
    <input type="submit" value="Log Out"/>
</form>

</div>

</body>


<%
    }
%>