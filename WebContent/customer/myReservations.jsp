<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
  background-color: #698474;
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
  <a href='makeReservation.jsp'>Make Reservation</a>
  <a class = "active" href='myReservations.jsp'>My Reservations</a>
  <a href='logout_customer.jsp'>Logout</a>
</div>

<div style="padding-left:16px">

<head>
  <title>Customer Make Reservations</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="icon" href="images/main_ticket.svg">
  <link rel="stylesheet" href="main_index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<!--<body>-->

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href='myReservations.jsp'>Active Reservations</a></li>
      <li><a href='pastReservations.jsp'>Past Reservations</a></li>
    </ul>
  </div>
</nav>
</div>
<br>
<h2> Checkout your reservations!</h2>
<br> 
<%

//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_Railsystem5";
Class.forName("com.mysql.jdbc.Driver");
// Object Made
//ApplicationDB db = new ApplicationDB();	
Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
Statement st = con.createStatement();

	String username = session.getAttribute("user").toString();   
	//String password = session.getParameter("pa");
	String query = "select m.reservationNum, m.trainID, m.tLine_name, m.origin, m.destination, m.dTime, res.totalFare from customer c, reserves r, reservation res, matches m where c.username='"+username+"' AND r.username = '"+username+"' and r.reservationNum = res.reservationNum and res.reservationNum = m.reservationNum and m.dTime > (select CURRENT_TIMESTAMP AS current_date_time) order by dTime asc;" ;
	//out.println(username);
	//out.println(password);
	ResultSet rs = st.executeQuery(query);
	
	out.print("<table>");

	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("Reservation #&nbsp&nbsp&nbsp&nbsp");
	out.print("			");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Train ID Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Transit Line &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Origin &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");

	
	//make a column
	out.print("<td>");
	out.print("Destination&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Departure time &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	/*
	out.print("<td>");
	out.print("Travel Time &nbsp;&nbsp;");
	out.print("</td>");
	*/
	out.print("<td>");
	out.print("Fare &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.print("</td>");
	
	/*
	out.print("<td>");
	out.print("Number of Stops&nbsp;&nbsp;		");
	out.print("</td>");
	out.print("</tr>");
	*/
		//parse out the results
		while (rs.next()) {
			// res.reservationNum, m.trainID, m.tLine_name, m.destination, m.origin, m.dTime
			
			String reservationNum = rs.getString(1);
			String trainID = rs.getString(2);
			String tLine_name = rs.getString(3);
			String origin = rs.getString(4);
			String destination = rs.getString(5);
			String dTime = rs.getString(6);
			String fare = rs.getString(7);




			/*
			String train_ID = rs.getString(1);
   			String transitLinename = rs.getString(2);
   			String departureTime = rs.getString(3) ;   
   			String arrivalTime = rs.getString(4) ;
   			String travelTime = rs.getString(5)  ;
   			String fare$ = rs.getString(6) ;
   			String numberofstops = rs.getString(7);
   			String dest = rs.getString(8);
   			String ori = rs.getString(9);   
  			 */
   			

   			
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
			out.print("<td>");

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

%>
<br>
	<form method="get" action="cancelReservation.jsp">
		<table>

			<tr>
					<td>Reservation Number:</td><td><input type="number" name="reservationNumber"></td>
			</tr>
			
		</table>
		<input type="submit" value="Cancel reservation">
	</form>
<br>

</body>
</html>