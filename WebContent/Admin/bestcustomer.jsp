<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Best Customer </title>

   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%@ page import ="java.sql.*" %> 
<br>
<div class="alert alert-success" role="alert" align='center'> 
	<form method="get" action="adminfunctions.jsp">
	
		<input type="submit" value="< Back">
	</form>
</div>

<h1 align='center'> One of our best customers! </h1>
<br> 
<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");

   // ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	ResultSet rs1;
	
	
		
		rs1 = st.executeQuery("SELECT T.passenger as Passenger, T.Revenue as Revenue 	FROM (	SELECT r.passenger as Passenger, SUM(r.totalFare) as Revenue	FROM reservation r	GROUP BY r.passenger) T	WHERE T.Revenue = ( SELECT MAX(T.Revenue) FROM (SELECT r.passenger as Passenger, SUM(r.totalFare) as Revenue FROM reservation r GROUP BY r.passenger	) T); ");	
		while(rs1.next()){
	
			
			
			out.println("$" + rs1.getString( "Revenue"));			   
			 out.println(rs1.getString("Passenger"));
		
		} 
	
	%>
	<br>
	
</body>
</html>