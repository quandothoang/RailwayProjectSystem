<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Check best 5 most active transit lines. </title>

   <!-- Icon -->
   <link rel="icon" href="images/main_ticket.svg">
   <link rel="stylesheet" href="style_admin_login.css">

   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
<%@ page import ="java.sql.*" %> 

<div class="alert alert-success" role="alert" align='center'> 
<br>
	<form method="get" action="adminfunctions.jsp">
	
		<input type="submit" value="< Back">
	</form>

<br>
</div>

<h1 align='center'> Best 5 most active transit lines. </h1>

<br>
<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");

   // ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	ResultSet rs1;
	
	
		
		rs1 = st.executeQuery("SELECT tS.tLine_name as TransitLine, SUM(r.totalFare) as Revenue	FROM train_schedule tS, matches m, reservation r	WHERE tS.tLine_name = m.tLine_name	AND tS.trainID = m.trainID	AND tS.destination = m.destination	AND tS.origin = m.origin	AND tS.dTime = m.dTime	AND m.reservationNum = r.reservationNum	GROUP BY TransitLine ORDER BY Revenue DESC LIMIT 5; ");	
		while(rs1.next()){
	
			
			
			 out.println("$" + rs1.getString( "Revenue"));
			   
			 out.println(rs1.getString("TransitLine"));
		
		} 
	
	%>
	<br>
	
</body>
</html>