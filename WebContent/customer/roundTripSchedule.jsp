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
  background-color: #333;
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
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href='makeReservation.jsp'>One way</a></li>
      <li><a href='pastReservations.jsp'>Round-trip</a></li>
    </ul>
  </div>
</nav>

<br>
	<form method="get" action="makeReservationSchedule.jsp">
		<table>
			<tr>    
				<td>Origin:</td><td><input type="text" name="origin"></td>
			</tr>
			<tr>
				<td>Destination:</td><td><input type="text" name="destination"></td>
				
			</tr>
			<tr>
				<td>Date:</td><td><input type="date" name="date"></td>
				<td>Date format: yyyy-mm-dd</td><td>
			</tr>
		</table>
		<input type="submit" value="Search!">
	</form>
<br>
	
<%
String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_Railsystem5";
Class.forName("com.mysql.jdbc.Driver");
// Object Made
//ApplicationDB db = new ApplicationDB();	
Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
Statement st = con.createStatement();

String origin = request.getParameter("origin");   
String destination = request.getParameter("destination");
String date = request.getParameter("date");   
String rdate = request.getParameter("rdate");

//String origin = session.getAttribute("origin");   
//String destination = session.getAttribute("destination").toString();   
//String dates = session.getAttribute("date").toString();
ResultSet rs;
ResultSet rs1;
String query;
String queryReturn;
if(!(origin.equals("")) && !(destination.equals("")) && !(date.equals(""))){
	query = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));";
	queryReturn = "select * from train_schedule where origin='" +  destination +  "' AND destination='"+origin+"' AND dTime > (select cast('"+rdate+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+rdate+"', INTERVAL 1 DAY)) AS datetime));";
	session.setAttribute("origin", origin);
	session.setAttribute("destination", destination);
	rs = st.executeQuery(query);
	//out.print(query);
	
	out.print("<table>");

	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("Train ID&nbsp;&nbsp;	");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Transit Line Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");

	
	//make a column
	out.print("<td>");
	out.print("Departure Time &nbsp;&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Arrival Time &nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");

	out.print("<td>");
	out.print("Travel Time &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("</td>");
		
	out.print("<td>");
	out.print("Fare &nbsp;&nbsp;");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Number of Stops&nbsp;&nbsp;		");
	out.print("</td>");
	out.print("</tr>");

		//parse out the results
		while (rs.next()) {
			
			String train_ID = rs.getString(1);
   			String transitLinename = rs.getString(2);
   			String departureTime = rs.getString(3) ;   
   			String arrivalTime = rs.getString(4) ;
   			String travelTime = rs.getString(5)  ;
   			String fare$ = rs.getString(6) ;
   			String numberofstops = rs.getString(7);
   			String dest = rs.getString(8);
   			String ori = rs.getString(9);   
  			 
   			

   			
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

			out.print(rs.getString(9));
			out.print("</td>");
			out.print("<td>");
			
			out.print(rs.getString(8));
			out.print("</td>");
			out.print("<td>");

			
			//Print out current price
			out.print(rs.getString(3));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(4));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(5));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(6));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(7));
			out.print("</td>");
			out.print("</tr>");

			/*
			out.print(rs.getString(8));
			out.print("</td>");
			out.print("<td>");

			out.print(rs.getString(9));
			out.print("</td>");
			out.print("</tr>");
			*/

		}
		out.print("</table>");
		
		out.print("<br>");
		out.print("Return Trip");
		rs = st.executeQuery(queryReturn);
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Train ID&nbsp;&nbsp;	");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Transit Line Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");

		
		//make a column
		out.print("<td>");
		out.print("Departure Time &nbsp;&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Arrival Time &nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");

		out.print("<td>");
		out.print("Travel Time &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.print("</td>");
			
		out.print("<td>");
		out.print("Fare &nbsp;&nbsp;");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Number of Stops&nbsp;&nbsp;		");
		out.print("</td>");
		out.print("</tr>");

			//parse out the results
			while (rs.next()) {
				
				String train_ID = rs.getString(1);
	   			String transitLinename = rs.getString(2);
	   			String departureTime = rs.getString(3) ;   
	   			String arrivalTime = rs.getString(4) ;
	   			String travelTime = rs.getString(5)  ;
	   			String fare$ = rs.getString(6) ;
	   			String numberofstops = rs.getString(7);
	   			String dest = rs.getString(8);
	   			String ori = rs.getString(9);   
	  			 
	   			

	   			
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

				out.print(rs.getString(9));
				out.print("</td>");
				out.print("<td>");
				
				out.print(rs.getString(8));
				out.print("</td>");
				out.print("<td>");

				
				//Print out current price
				out.print(rs.getString(3));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(4));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(5));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(6));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(7));
				out.print("</td>");
				out.print("</tr>");

				/*
				out.print(rs.getString(8));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(9));
				out.print("</td>");
				out.print("</tr>");
				*/

			}
			out.print("</table>");
		
	
} 

/*else if(origin.equals("") && !destination.equals("") && !date.equals("")){
	query = "select * from train_schedule where destination='"+destination+"' AND dTime='"+date+"'; ";

} else if(!origin.equals("") && destination.equals("") && !date.equals("")){
	query = "select * from train_schedule where dTime='"+date+"'; ";

} else if(!origin.equals("") && !destination.equals("") && date.equals("")){
	query = "select * from train_schedule where origin='" +  origin +  "' AND dTime='"+date+"'; ";

} else if(origin.equals("") && destination.equals("") && !date.equals("")){
	query = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime='"+date+"'; ";

} else if (!origin.equals("") && destination.equals("") && date.equals("")){
	

} else if(origin.equals("") && !destination.equals("") && date.equals("")){
	
} else { // we have none
	
}*/


%>
	<br>
	<form method="get" action="roundTripReservation.jsp">
		<table>
			<tr>
				<td>Departure Time:</td><td><input type="datetime" name="dTime"></td>
				<td>Date format: yyyy-mm-dd hh:mm:ss</td><td>
			</tr>
			<tr>
				<td>Return Departure Time:</td><td><input type="datetime" name="RdTime"></td>
				<td>Date format: yyyy-mm-dd hh:mm:ss</td><td>
			</tr>
		<select name="discount" size=1>
			<option value="adult">adult</option>
			<option value="child">younger than 12 years old</option>
			<option value="disabled">disabled</option>
			<option value="senior">older than 65 years old</option>
		</select>
		<!--&nbsp;<br> <input type="submit" value="submit"> -->
				
		</table>
		<input type="submit" value="Book trip!">
	</form>
<br>
</body>
</html>