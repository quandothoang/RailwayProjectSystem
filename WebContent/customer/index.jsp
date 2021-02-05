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
       <title> Customer Dashboard</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
       <link rel="stylesheet" href="main_index.css">

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
<br>
<div align='center' >
<div class="alert alert-info" align='center'>
  <strong>Make a reservation, check YOUR reservations, or ask some questions!</strong>
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
    <h5 class="card-title">Make a Reservation!</h5>
    <h6 class="card-subtitle mb-2 text-muted">Click Here to make a reservation!</h6>
    <p class="card-text">Here you can reserve a ticket and check the schedules. Reserve, reserve, reserve!</p>
    <!-- Log In Link  -->
    <a href="makeReservation.jsp" class="card-link">Make a reservation!</a>
  </div>
</div>
</th>


<!-- MY Reservations -->
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

<!-- FAQ -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">FAQ: Have a Question? </h5>
    <h6 class="card-subtitle mb-2 text-muted">Have a question? We might have an answer!</h6>
    <p class="card-text">Checkout the FAQ! We have some commonly asked questions!</p>
    <a href="FAQ_Customer.jsp" class="card-link">FAQ Page</a>
  </div>
</div>
</th>

<!-- Look Up A Train -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Look up a train.</h5>
    <h6 class="card-subtitle mb-2 text-muted">Interested in looking up a train?</h6>
    <p class="card-text">Interested in a train schedule? Here you can search by origin, destination and date of travel.  </p>
    <a href="customerfunction.jsp" class="card-link">Look up a train</a>
  </div>
</div>
</th>
</tr>
</thead>
</table>
</div>

<br> 
<br> 
<h2 align='center'> Steps to make a reservation!</h2>
<br> 
<div align='center'> 

<ul class="list-group">
  <li class="list-group-item">1. Look up a train. Utilize <strong> Look up a train. </strong> </li>
  <li class="list-group-item">2. Remeber the following: Your origin, destination, and departure time.</li>
  <li class="list-group-item">3. Provide the information to <strong>Make a Reservation</strong></li>
  <li class="list-group-item">4. Choose whether it is <strong> one-way or round trip.</strong></li>
  <li class="list-group-item">5. Choose if you're an child, adult, disabled or senior.</li>
  <li class="list-group-item">6. Type in the departure time using the correct time.</li>
  <li class="list-group-item"><strong>Book Trip!</strong></li>
  

</ul>

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
<br>
<br> 
<br> 
</div>

</body>


<%
    }
%>