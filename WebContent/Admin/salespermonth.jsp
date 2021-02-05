<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Check the sales per month </title>  	   
	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">
       <link rel="stylesheet" href="style_admin_login.css">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<br>

<div class="alert alert-success" role="alert" align='center'> 
	<form method="get" action="adminfunctions.jsp">
	
		<input type="submit" value=" Back">

	</form>
</div>

<br>

<h1 align='center'> Table of sales per month. </h1>

<br>
<%@ page import ="java.sql.*" %> 

<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");

   // ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	ResultSet rs1;
	
	
		
		rs1 = st.executeQuery("select t1.tLine_name, 	sum(if (t1.month = '1', t1.Revenue, 0)) January,	sum(if(t1.month = '2', t1.Revenue, 0)) February,	sum(if(t1.month = '3', t1.Revenue, 0)) March,	sum(if(t1.month ='4', t1.Revenue, 0)) April,	sum(if(t1.month ='5', t1.Revenue, 0)) May,	sum(if(t1.month ='6', t1.Revenue, 0)) June,	sum(if(t1.month ='7', t1.Revenue, 0)) July,	sum(if(t1.month ='8', t1.Revenue, 0)) August,	sum(if(t1.month ='9', t1.Revenue, 0)) September,	sum(if(t1.month ='10', t1.Revenue, 0)) October,	sum(if(t1.month ='11', t1.Revenue, 0)) November,	sum(if(t1.month ='12', t1.Revenue, 0)) December	from (SELECT tS.tLine_name, year(r.dateReserve) as year, month(r.dateReserve) as month, SUM(r.totalFare) as Revenue	FROM train_schedule tS, matches m, reservation r	WHERE tS.tLine_name = m.tLine_name	AND tS.trainID = m.trainID	AND tS.destination = m.destination	AND tS.origin = m.origin	AND tS.dTime = m.dTime	AND m.reservationNum = r.reservationNum	GROUP BY tS.tLine_name, month(r.dateReserve)   )t1	group by t1.tLine_name; ");	
		
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Transit Line Name&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("January&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("February&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("March&nbsp;&nbsp;		");
	
		out.print("</td>");
	
		
		
		out.print("<td>");
		out.print("April&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		
		out.print("<td>");
		out.print("May&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("June&nbsp;&nbsp;		");
		out.print("</td>");
		
		out.print("<td>");
		out.print("July&nbsp;&nbsp;		");
		out.print("</td>");
		
		out.print("<td>");
		out.print("August&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("September&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("October&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		out.print("<td>");
		out.print("November&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("December&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		out.print("</tr>");
		
		
		
		
		while(rs1.next()){
	
			String tLine_name = rs1.getString(1);
   			String January = rs1.getString(2);
   			String February = rs1.getString(3) ;   
   			String March = rs1.getString(4) ;
   			String April= rs1.getString(5)  ;
   			String May = rs1.getString(6) ;
   			String June = rs1.getString(7);
   			String July = rs1.getString(8);
   			String August = rs1.getString(9);   
   			String September = rs1.getString(7);
   			String October = rs1.getString(8);
   			String November = rs1.getString(9);   
   			String December = rs1.getString(9);   
   			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar name:
			out.print(rs1.getString(1));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(rs1.getString(2));
			out.print("</td>");
			out.print("<td>");
			//Print out current price
			out.print(rs1.getString(3));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(4));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(5));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(6));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(7));
			out.print("</td>");
			out.print("<td>");
			out.print(rs1.getString(8));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(9));
			out.print("</td>");
			out.print("<td>");
			
			out.print(rs1.getString(10));
			out.print("</td>");
			out.print("<td>");
			
			out.print(rs1.getString(11));
			out.print("</td>");
			out.print("<td>");
			
			out.print(rs1.getString(12));
			out.print("</td>");
			out.print("<td>");

			out.print(rs1.getString(13));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");
		
	
	%>
	<br>
	
</body>
</html>