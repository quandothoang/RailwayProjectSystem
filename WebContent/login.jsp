<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--
Contributors:
Axel, Quan, Joel 
General LogIn Page for the first users.
--> 

<!-- style of program -->
<style>

html{
height: 100%;
}

body{
font-family: Helvetica;
height: 100%;

}
.aligncenter {
    text-align: center;
    border-collapse: collapse;
}

.meme{
	margin-left: auto;
	margin-right: auto;
}

.main{

  font-family: Helvetica;
  margin-left: auto;
  margin-right: auto;
  font-size: 150%;
  color: #000000;
  align: center;
}


.testbruh {
  position: relative;
}

/* Bottom right text */
.text-block {
  position: absolute;
  bottom: 20px;
  right: 20px;
  background-color: black;
  color: white;
  padding-left: 20px;
  padding-right: 20px;
}

.bar{
  font-family: Helvetica;
}

</style>


<!-- head of program  -->
<head>
       
	   <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Railway System! | Group 1</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   	   
 
      <!--   <img src="images\temp1.jpg" alt="programming" style="width:400px;height=400px;"> --> 

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
           <a class="nav-link" href="Customer_Login_partone.jsp">Log in as a customer</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="Admin/Admin_login.jsp">Log in as an Admin</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="Customer Rep/Customer_login.jsp">Log in as a Customer Rep</a>
		</li>    	
    <!-- Dropdown 
        <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
         Dropdown link
        </a>
       <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
    --> 
  </ul>

</nav>	
</div>
   <!-- RailWay System title on top -->
  <div class="container"> 
   <div class="page-header" align="center">
   	<h1 align="center"><img src="images/rocket.ico" > Railway System!</h1>
   	<h2> Simply, the best way to explore the world.</h2>
   </div>
   </div>
   
   <!-- spaces  --> 
   <br> <br>
	
	<!-- Message above gifs -->
	<div align="center">
		<h3> Railway System allows you to travel the country with the best customer service, ever!</h3>
	</div>
	


<!-- Making table for the log in buttons -->


<br>
<br>

<div align='center'> 

<table> 
<thead>
<tr> 

<!-- Customer Log In -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Customers</h5>
    <h6 class="card-subtitle mb-2 text-muted">Log In or Register!</h6>
    <p class="card-text">Here you can reserve a ticket and check the schedule.</p>
    <!-- Log In Link  -->
    <a href="Customer_Login_partone.jsp" class="card-link">For Customers!</a>
  </div>
</div>
</th>


<!-- Admin Log In -->
<th>
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Admins </h5>
    <h6 class="card-subtitle mb-2 text-muted">Log in as an Admin.</h6>
    <p class="card-text">Log in as an admin for administrator stuff.</p>
    <a href="Admin/Admin_login.jsp" class="card-link">Admins Only!</a>
  </div>
</div>
</th> 

<!-- Customer Representative -->
<th> 
<div class="card" style="width: 18rem;" >
  <div class="card-body">
    <h5 class="card-title">Customer Representative </h5>
    <h6 class="card-subtitle mb-2 text-muted">Log in as a Customer Rep.</h6>
    <p class="card-text">Log in as a customer representative.</p>
    <a href="Customer Rep/Customer_login.jsp" class="card-link">Customer Rep. Link!</a>
  </div>
</div>
</th>
</tr>
</thead>
</table>
</div>
	
	
<!-- Image table  | Manhattan, California, Downtown NY-->
<div align='center'> 
	<table class="meme" >
		<thead>
			<tr class="main"> 
				<div align="center"> 
					<th scope="col" style="vertical-align:bottom"><button type="button" class="btn btn-success" align="center"><span class="label label-success">Manhattan</span></button>
					</th>	
				</div>
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success">California</span></button>
					</th>	
				</div>
				
				<div> 
					<th scope="col"><button type="button" class="btn btn-success"><span class="label label-success">Downtown New York</span></button>
					</th>	
				</div>
				
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td align="left"><img class="img-responsive" src="images/ny_real.gif"></td>
		<br>
			<td align="center"><img class="img-responsive" src="images/cali.gif" height="284"></td>
		<br> 
			<td align="right"><img class="img-responsive" src="images/new_york.gif"> </td>
		</tr> 
		</tbody>	
	</table>
</div>
   
   <!-- Returning Customer -->

<br> 
<br>  
<br> 


<!-- Ignore this
   	<h3 align='center'>Are you a returning customer? Login here!</h3>
     <form action="checkLoginDetails_Customer_login.jsp" method="POST" align="center">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
     <br>
     <form action="Register_Account.jsp" method="POST" align="center"> 
     	<input type="submit" value="Don't have an account? Register HERE!" />
     </form>
    <h3 align='center'> Are you an Admin or Customer Rep? Click here to login!</h3> 
   	<form action= "login_admin_customer_rep.jsp" method="POST" align="center"> 	
   		<input type="submit" value="Press here to log into the portal!"/>
   </form> 
--> 

<!-- Extra Spacing -->
<br> 
<br>
<br> 

</body>
</html>