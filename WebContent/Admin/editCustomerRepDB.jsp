<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<%
String username = session.getAttribute("username").toString();
//session.setAttribute("username", username);
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
       <title> Customer Dashboard</title>
       
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
	<form method="get" action="adminfunctions.jsp">
	
		<input type="submit" value="< Back">
	</form>

<br>
Anything you input, will be changed :

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
 
<form method="get" action="editCustomerRepDBchange.jsp">
	<table>

		<tr>
			<td>password:</td><td><input type="text" name="password"></td>
				
		</tr>
		<tr>
			<td>first name:</td><td><input type="text" name="fName"></td>
		</tr>
		<tr>
			<td>last name:</td><td><input type="text" name="lName"></td>
		</tr>
		<tr>
			<td>ssn:</td><td><input type="text" name="ssn"></td>
			<td>ssn format: XXX-XX-XX</td><td>
		</tr>			
	</table>
	<input type="submit" value="Change">
</form>
 
 <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
Statement st = con.createStatement();   

ResultSet rs;
String query = "SELECT p.password, p.fName, p.lName, e.ssn FROM person p, employees e, customerRep cR WHERE p.username  = '"+username+"' AND e.username = '"+username+"' AND cR.username = '"+username+"';";
rs = st.executeQuery(query);
if(rs.next()){
	//out.print(query);
	//rs.next();
	
	String password = rs.getString("password");
   	String fName = rs.getString("fName");
   	String lName = rs.getString("lName") ;   
   	String ssn = rs.getString("ssn") ;
	
   	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<td>");
	out.print("username: " + username);
	out.print("</td>");
	out.print("</tr>");

	
	//make a column
	out.print("<tr>");
	out.println("<td>");
	out.print("password: " + password);
	out.print("</td>");
	out.print("</tr>");

	out.print("<tr>");
	out.println("<td>");
	out.print("first name: " + fName);
	out.print("</td>");
	out.print("</tr>");

	out.print("<tr>");
	out.println("<td>");
	out.print("last name: " + lName);
	out.print("</td>");
	out.print("</tr>");

	out.print("<tr>");
	out.println("<td>");
	out.print("ssn: " + ssn);
	out.print("</td>");
	out.print("</tr>");

   	out.print("</table>");
} else {
    //out.println("Invalid username <a href='editCustomerRep.jsp'></a>");
    //out.println("Invalid username");
    //response.sendRedirect("addCustomerRep.jsp");

}



%>

</body>
</html>