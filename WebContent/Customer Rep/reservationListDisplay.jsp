<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<%

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
      		<a class="nav-link" href="logout_customerRep.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>
</head>
<body>


<br>
	<form method="get" action="trainScheduleInfo.jsp">
	
		<input type="submit" value="< Back">
	</form>

<br>


 <%
 String tLine_name = session.getAttribute("tLine_name").toString(); 
 String date = session.getAttribute("date").toString();
//AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));
 Station :
 out.print("Transit Line: "+tLine_name +"& date: "+ date);
//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem1";
Class.forName("com.mysql.jdbc.Driver");
//Object Made
//ApplicationDB db = new ApplicationDB();	
Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
Statement st = con.createStatement();

//String cityName = session.getAttribute("cityName").toString();   
  

//String origin = session.getAttribute("origin");   
//String destination = session.getAttribute("destination").toString();   
//String dates = session.getAttribute("date").toString();
ResultSet rs;
String query;

	query = "SELECT m.reservationNum, r.passenger, m.tLine_name, m.origin, m.destination, m.dTime FROM reservation r, matches m WHERE r.reservationNum = m.reservationNum AND m.tLine_name = '"+tLine_name+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime))";
	//session.setAttribute("origin", origin);
	//session.setAttribute("destination", destination);

	/*
	m.reservationNum
	r.passenger
	m.tLine_name
	m.dTime
	m.origin
	m.destination
	*/
	
	rs = st.executeQuery(query);
	
	out.print("<table>");

	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("Reservation Number &nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Passenger &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Transit Line&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Origin&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Destination&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");

	
	//make a column
	out.print("<td>");
	out.print("Departure Time &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");


		//parse out the results
		while (rs.next()) {
			
			String reservationNum = rs.getString(1);
  			String passenger = rs.getString(2) ;
  			String tLinename = rs.getString(3);
  			String Origin = rs.getString(4) ;   
  			String Destination = rs.getString(5) ;
  			String dTime = rs.getString(6)  ;

  			

  			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar name:
			out.print(rs.getString(1));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(rs.getString(2));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(3));
			out.print("</td>");
			out.print("<td>");
			
			out.print(rs.getString(4));
			out.print("</td>");
			out.print("<td>");

			
			//Print out current price
			out.print(rs.getString(5));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(6));
			out.print("</td>");
			out.print("<td>");


		}
		out.print("</table>");
	



%>
</body>
</html>