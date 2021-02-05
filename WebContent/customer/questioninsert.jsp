<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>   
		<meta charset="UTF-8">
       <meta name="viewprrt" content="width=device-width, initial-scale=1">
       
<title>Customer Submitted Questions</title>

	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ page import ="java.sql.*" %> 

	<div class="alert alert-primary" role="alert" align='center'> 
			<input type="button" value="Go Back!" onclick="history.back()">
	</div>
	
	<div class="alert alert-warning" role="alert" align='center'> 
		<h2> Your Question(s) Have been submitted!</h2>
	</div>

<%
	
			 Class.forName("com.mysql.jdbc.Driver");

   		   // ApplicationDB db = new ApplicationDB();	
   			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
   			Statement st = con.createStatement();
   			String quest = request.getParameter("quest");
   			int rs2;
   			rs2 = st.executeUpdate("insert into question_table (question, answer) values ('"+quest+"', '')");
   			ResultSet rs1;
   			rs1 = st.executeQuery("select * from question_table;");
   			
   			
   			
   			
   			out.print("<table>");

				//make a row
				out.print("<tr>");
				
				
				out.print("<td>");
				//print out column header
				out.print("No.:&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				out.print("<td>");
				//print out column header
				out.print("Question:&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
			
				
				out.print("<td>");
				out.print("Answers:&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				out.print("</tr>");
   			
   			
   			while(rs1.next()){
   				String number = rs1.getString(1);
   				
   				String question = rs1.getString(2);
   	   			String answer = rs1.getString(3);
   	   			
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
			
			out.print(rs1.getString(3));
			out.print("</td>");
			out.print("<td>");
			
			
			
			out.print("</tr>");
   			}
   			
   			
   			
   
%>