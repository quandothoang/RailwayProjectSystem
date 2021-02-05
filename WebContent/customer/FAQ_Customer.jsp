<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewprrt" content="width=device-width, initial-scale=1">
<title>FAQ: Ask Questions and more!</title>

   <!-- Icon -->
   <link rel="icon" href="images/main_ticket.svg">

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
           <a class="nav-link" href="../login.jsp">Home</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="customerfunction.jsp">Look Up a Train</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="makeReservation.jsp">Make Reservations</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="myReservations.jsp">MY Reservations</a>
		</li>    		
		
		<li class="nav-item">
      		<a class="nav-link" href="FAQ_Customer.jsp">FAQ Page</a>
		</li>  
		
		<li class="nav-item">
      		<a class="nav-link" href="logout_customer.jsp">Logout</a>
		</li>    	
 
 
  </ul>

</nav>	
</div>


<br> 

<div  class="alert alert-info" align='center'>	
	<h2> Ask Questions or Search questions by keywords!</h2>
</div>

<br> 
<h4 align='center'> Ask a Customer Rep. a question:</h4>
<div align='center'> 
<br>
	<form method="get" action="questioninsert.jsp">
	
		<table>
			<tr>    
				<td><h4> Question: </h4></td><td><input type="text" name="quest"></td>
			</tr>
			<tr>
			
			</tr>
			<tr>
				
	
			</tr>
		</table>
		<input type="submit" value="Input Question!" size="10000">
	</form>
<br>
</div> 

<h4 align='center'> Search a question using a keyword: </h4>
<div align='center'> 
<br>
	<form method="get" action="questionsearch.jsp">
	
		<table>
			<tr>    
				<td><h4> Keyword: </h4></td><td><input type="text" name="keyword"></td>
			</tr>
			<tr>
			
			</tr>
			<tr>
				
	
			</tr>
		</table>
		<input type="submit" value="Search!">
	</form>
<br>
</div>
	<div class="alert alert-primary" role="alert" align='center'> 
			<input type="button" value="Back" onclick="history.back()">
	</div>
	<br> 
<div  class="alert alert-warning" align='center'>	
	<h3 align='center'> Browse the FAQ in the table below: </h3>
</div> 

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
				out.print("No.: &nbsp;&nbsp;		");
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

</body>