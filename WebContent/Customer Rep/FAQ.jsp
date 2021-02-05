<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head  -->

<head>
	
	<meta charset="UTF-8">
	<title> Customer Rep. FAQ Page </title>
	
	<!-- Icon -->
    <link rel="icon" href="images/main_ticket.svg">
    <link rel="stylesheet" href="main_index.css">

   	<!-- Bootstrap CSS -->
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>





<body>
<%@ page import ="java.sql.*" %> 

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
      		<a class="nav-link" href="trainScheduleInfo.jsp">Edit and delete train schedule info.</a>
    	</li>
		<li class="nav-item">
      		<a class="nav-link" href="FAQ.jsp">FAQ: Customer Rep. Side</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="../login.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>


<br> 
<br>
<div align='center' >
<div class="alert alert-warning" align='center'>
  <strong> Answer Questions or Look Up Questions! </strong>
</div>
</div>
<div align='center'> 

<br>



<p style="float: right;"><a href="AdminLogout.jsp">Log out</a></p>
<br>
	<form method="get" action="index.jsp">
	
		<input type="submit" value="< Home">
	</form>

<br>

Answer Question:
<br>
	<form method="get" action="answerQuestionCheck.jsp">
	
		<table>
			<tr>    
				<td>Question ID:</td><td><input type="text" name="questionID"></td>
			</tr>
			<tr>
				<td>Answer:</td><td><input type="text" name="answer"></td>
			</tr>

		</table>
		<input type="submit" value="Input!">
	</form>
<br>


<%
	
		   Class.forName("com.mysql.jdbc.Driver");

   		   // ApplicationDB db = new ApplicationDB();	
   			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
   			Statement st = con.createStatement();
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