<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<head> 
  <!-- head of program  -->
       <meta charset="UTF-8">
       <meta name="viewprrt" content="width=device-width, initial-scale=1">
       
	   <!-- title  -->       
       <title> Add Customer Rep. Information</title>
       
   	   <!-- Icon -->
       <link rel="icon" href="images/main_ticket.svg">

   	   <!-- Bootstrap CSS -->
   	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body> 

<div align='center'>
	<h1> Here are the sorted lists you requested! </h1>
</div>

<div class="alert alert-primary" role="alert" align='center'> 
	<form method="get" action="customerfunction.jsp">	
		<input type="submit" value="Go back" class='form-control'>
	</form>
</div>

</body>
<%
	//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");
    // Object Made
	ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	//Get the selected radio button from the index.jsp
	String entity = request.getParameter("sortmethod");
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		
   			String dTime = request.getParameter("Time") + "";   
   			String aTime = request.getParameter("aTime") + "";
   			String tTime = request.getParameter("tTime")  + "";
   			String fare = session.getAttribute("fare").toString();
   			String stops = request.getParameter("stops") + "";
   			String origin = session.getAttribute("origin").toString();
  			 String destination = session.getAttribute("destination").toString();
   			String trainID = request.getParameter("trainID") + "";
   			String tLine_name = request.getParameter("tLine_name") + "";
   			String dateoft = session.getAttribute("dateoft").toString();
	String query = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"'order by aTime ASC;";
	String query2 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' order by aTime DESC;";
	String query3 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' order by dTime ASC;";
	String query4 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' order by dTime DESC;";
	String query5 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' order by fare ASC;";
	String query6 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' order by fare DESC;";
	
	String query7 = "select * from train_schedule where origin='" +  origin +  "' order by aTime ASC;";
	String query8 = "select * from train_schedule where origin='" +  origin +  "'  order by aTime DESC;";
	String query9 = "select * from train_schedule where origin='" +  origin +  "'  order by dTime ASC;";
	String query10 = "select * from train_schedule where origin='" +  origin +  "'  order by dTime DESC;";
	String query11 = "select * from train_schedule where origin='" +  origin +  "'  order by fare ASC;";
	String query12 = "select * from train_schedule where origin='" +  origin +  "' order by fare DESC;";
	
	String query13 = "select * from train_schedule where destination='" +  destination +  "' order by aTime ASC;";
	String query14 = "select * from train_schedule where destination='" +  destination +  "'  order by aTime DESC;";
	String query15 = "select * from train_schedule where destination='" +  destination +  "'  order by dTime ASC;";
	String query16 = "select * from train_schedule where destination='" +  destination +  "'  order by dTime DESC;";
	String query17 = "select * from train_schedule where destination='" +  destination +  "'  order by fare ASC;";
	String query18 = "select * from train_schedule where destination='" +  destination +  "' order by fare DESC;";
	
	
	String query19 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime ASC;";
	String query20 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime DESC;";
	String query21 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime ASC;";
	String query22 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime DESC;";
	String query23 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare ASC;";
	String query24 = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare DESC;";
	
	
	String query25 = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime ASC;";
	String query26 = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime DESC;";
	String query27 = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime ASC;";
	String query28= "select * from train_schedule where origin='" +  origin +  "' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime DESC;";
	String query29 = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare ASC;";
	String query30 = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare DESC;";
	
	String query31 = "select * from train_schedule where  destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime ASC;";
	String query32 = "select * from train_schedule where  destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime DESC;";
	String query33 = "select * from train_schedule where destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime ASC;";
	String query34 = "select * from train_schedule where  destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime DESC;";
	String query35 = "select * from train_schedule where  destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare ASC;";
	String query36 = "select * from train_schedule where  destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare DESC;";
	
	String query37 = "select * from train_schedule where dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime ASC;";
	String query38 = "select * from train_schedule where   dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by aTime DESC;";
	String query39 = "select * from train_schedule where  dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime ASC;";
	String query40 = "select * from train_schedule where   dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by dTime DESC;";
	String query41 = "select * from train_schedule where   dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare ASC;";
	String query42 = "select * from train_schedule where   dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime))order by fare DESC;";
	
	
	if (!(destination.equals("")) && (!origin.equals(""))&& (dateoft.equals("")))   {
	//String query2 = "select * from train_schedule  where origin ='" +  origin +  "' order by aTime DSC;";
   			if (entity.equals("1"))  {

	   			ResultSet rs = st.executeQuery(query);
	   			
 
		
		//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
		//if (rs.next() ){
			//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
			//if(rs1.next()){
			
			//Make an HTML table to show the results in:
			out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Train ID&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Transit Line Name&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departure Time&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("Arrival Time&nbsp;&nbsp;		");
	
		out.print("</td>");
	
		
		
		out.print("<td>");
		out.print("Travel Time&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		
		out.print("<td>");
		out.print("Fare&nbsp;&nbsp;		");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("Number of Stops&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("Destination&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		
		
		out.print("<td>");
		out.print("Origin&nbsp;&nbsp;		");
		out.print("			");
		out.print("</td>");
		out.print("<td>");
		out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
		out.print("			");
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
	  			 String b = rs.getString(10);
	   			

	   			
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

				out.print(rs.getString(8));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString(9));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString(10));
				out.print("</td>");
				out.print("<td>");
				out.print("</tr>");

			}
			out.print("</table>");

			}
			if (entity.equals("2"))  {

	   			ResultSet rs = st.executeQuery(query2);
	   			
		 
				
				//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
				//if (rs.next() ){
					//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
					//if(rs1.next()){
					
					//Make an HTML table to show the results in:
					out.print("<table>");

				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//print out column header
				out.print("Train ID&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				out.print("Transit Line Name&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				out.print("Departure Time&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Arrival Time&nbsp;&nbsp;		");
			
				out.print("</td>");
			
				
				
				out.print("<td>");
				out.print("Travel Time&nbsp;&nbsp;		");
				out.print("</td>");
				
				
				
				out.print("<td>");
				out.print("Fare&nbsp;&nbsp;		");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Number of Stops&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Destination&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Origin&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				out.print("<td>");
				out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
				out.print("			");
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
			  			 String b= rs.getString(10);
			   			

			   			
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

						out.print(rs.getString(8));
						out.print("</td>");
						out.print("<td>");

						out.print(rs.getString(9));
						out.print("</td>");
						out.print("<td>");
						out.print(rs.getString(10));
						out.print("</td>");
						out.print("<td>");
						out.print("</tr>");

					}
					out.print("</table>");

					}
					if (entity.equals("3"))  {

			   			ResultSet rs = st.executeQuery(query3);
			   			
		 
						
						//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
						//if (rs.next() ){
							//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
							//if(rs1.next()){
							
							//Make an HTML table to show the results in:
							out.print("<table>");

						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//print out column header
						out.print("Train ID&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						
						//make a column
						out.print("<td>");
						out.print("Transit Line Name&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						
						//make a column
						out.print("<td>");
						out.print("Departure Time&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						
						
						out.print("<td>");
						out.print("Arrival Time&nbsp;&nbsp;		");
					
						out.print("</td>");
					
						
						
						out.print("<td>");
						out.print("Travel Time&nbsp;&nbsp;		");
						out.print("</td>");
						
						
						
						out.print("<td>");
						out.print("Fare&nbsp;&nbsp;		");
						out.print("</td>");
						
						
						out.print("<td>");
						out.print("Number of Stops&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						
						
						out.print("<td>");
						out.print("Destination&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						
						
						out.print("<td>");
						out.print("Origin&nbsp;&nbsp;		");
						out.print("			");
						out.print("</td>");
						out.print("<td>");
						out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
						out.print("			");
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
					  			 String b= rs.getString(10);
					   			

					   			
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

								out.print(rs.getString(8));
								out.print("</td>");
								out.print("<td>");

								out.print(rs.getString(9));
								out.print("</td>");
								out.print("<td>");
								out.print(rs.getString(10));
								out.print("</td>");
								out.print("<td>");
								out.print("</tr>");

							}
							out.print("</table>");

							}
							if (entity.equals("4"))  {

					   			ResultSet rs = st.executeQuery(query4);
					   			
				 
								
								//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
								//if (rs.next() ){
									//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
									//if(rs1.next()){
									
									//Make an HTML table to show the results in:
									out.print("<table>");

								//make a row
								out.print("<tr>");
								//make a column
								out.print("<td>");
								//print out column header
								out.print("Train ID&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								
								//make a column
								out.print("<td>");
								out.print("Transit Line Name&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								
								//make a column
								out.print("<td>");
								out.print("Departure Time&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								
								
								out.print("<td>");
								out.print("Arrival Time&nbsp;&nbsp;		");
							
								out.print("</td>");
							
								
								
								out.print("<td>");
								out.print("Travel Time&nbsp;&nbsp;		");
								out.print("</td>");
								
								
								
								out.print("<td>");
								out.print("Fare&nbsp;&nbsp;		");
								out.print("</td>");
								
								
								out.print("<td>");
								out.print("Number of Stops&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								
								
								out.print("<td>");
								out.print("Destination&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								
								
								out.print("<td>");
								out.print("Origin&nbsp;&nbsp;		");
								out.print("			");
								out.print("</td>");
								out.print("<td>");
								out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
								out.print("			");
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
							  			 String b = rs.getString(10);
							   			

							   			
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

										out.print(rs.getString(8));
										out.print("</td>");
										out.print("<td>");

										out.print(rs.getString(9));
										out.print("</td>");
										out.print("<td>");
										out.print(rs.getString(10));
										out.print("</td>");
										out.print("<td>");
										out.print("</tr>");

									}
									out.print("</table>");

									}
									if (entity.equals("5"))  {

							   			ResultSet rs = st.executeQuery(query5);
							   			
						 
										
										//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
										//if (rs.next() ){
											//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
											//if(rs1.next()){
											
											//Make an HTML table to show the results in:
											out.print("<table>");

										//make a row
										out.print("<tr>");
										//make a column
										out.print("<td>");
										//print out column header
										out.print("Train ID&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										
										//make a column
										out.print("<td>");
										out.print("Transit Line Name&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										
										//make a column
										out.print("<td>");
										out.print("Departure Time&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										
										
										out.print("<td>");
										out.print("Arrival Time&nbsp;&nbsp;		");
									
										out.print("</td>");
									
										
										
										out.print("<td>");
										out.print("Travel Time&nbsp;&nbsp;		");
										out.print("</td>");
										
										
										
										out.print("<td>");
										out.print("Fare&nbsp;&nbsp;		");
										out.print("</td>");
										
										
										out.print("<td>");
										out.print("Number of Stops&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										
										
										out.print("<td>");
										out.print("Destination&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										
										
										out.print("<td>");
										out.print("Origin&nbsp;&nbsp;		");
										out.print("			");
										out.print("</td>");
										out.print("<td>");
										out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
										out.print("			");
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
									  			 String b = rs.getString(10);
									   			

									   			
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

												out.print(rs.getString(8));
												out.print("</td>");
												out.print("<td>");

												out.print(rs.getString(9));
												out.print("</td>");
												out.print("<td>");
												out.print(rs.getString(10));
												out.print("</td>");
												out.print("<td>");
												out.print("</tr>");

											}
											out.print("</table>");

											}
											if (entity.equals("6"))  {

									   			ResultSet rs = st.executeQuery(query6);
									   			
								 
												
												//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
												//if (rs.next() ){
													//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
													//if(rs1.next()){
													
													//Make an HTML table to show the results in:
													out.print("<table>");

												//make a row
												out.print("<tr>");
												//make a column
												out.print("<td>");
												//print out column header
												out.print("Train ID&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												
												//make a column
												out.print("<td>");
												out.print("Transit Line Name&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												
												//make a column
												out.print("<td>");
												out.print("Departure Time&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												
												
												out.print("<td>");
												out.print("Arrival Time&nbsp;&nbsp;		");
											
												out.print("</td>");
											
												
												
												out.print("<td>");
												out.print("Travel Time&nbsp;&nbsp;		");
												out.print("</td>");
												
												
												
												out.print("<td>");
												out.print("Fare&nbsp;&nbsp;		");
												out.print("</td>");
												
												
												out.print("<td>");
												out.print("Number of Stops&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												
												
												out.print("<td>");
												out.print("Destination&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												
												
												out.print("<td>");
												out.print("Origin&nbsp;&nbsp;		");
												out.print("			");
												out.print("</td>");
												out.print("<td>");
												out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
												out.print("			");
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
											  			 String b= rs.getString(10);
											   			

											   			
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

														out.print(rs.getString(8));
														out.print("</td>");
														out.print("<td>");

														out.print(rs.getString(9));
														out.print("</td>");
														out.print("<td>");
														out.print(rs.getString(10));
														out.print("</td>");
														out.print("<td>");
														out.print("</tr>");

													}
													out.print("</table>");

													}
		//}
											}
		 
		//}
										else if ((destination.equals("")) && (!origin.equals("")) && (dateoft.equals("")))  {	if (entity.equals("1"))  {

		   			ResultSet rs = st.executeQuery(query7);
		   			
	 
			
			//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
			//if (rs.next() ){
				//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
				//if(rs1.next()){
				
				//Make an HTML table to show the results in:
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Train ID&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Transit Line Name&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Departure Time&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			
			
			out.print("<td>");
			out.print("Arrival Time&nbsp;&nbsp;		");
		
			out.print("</td>");
		
			
			
			out.print("<td>");
			out.print("Travel Time&nbsp;&nbsp;		");
			out.print("</td>");
			
			
			
			out.print("<td>");
			out.print("Fare&nbsp;&nbsp;		");
			out.print("</td>");
			
			
			out.print("<td>");
			out.print("Number of Stops&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			
			
			out.print("<td>");
			out.print("Destination&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			
			
			out.print("<td>");
			out.print("Origin&nbsp;&nbsp;		");
			out.print("			");
			out.print("</td>");
			out.print("<td>");
			out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
			out.print("			");
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
		  			 String b=rs.getString(10);
		   			

		   			
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

					out.print(rs.getString(8));
					out.print("</td>");
					out.print("<td>");

					out.print(rs.getString(9));
					out.print("</td>");
					out.print("<td>");
					out.print(rs.getString(10));
					out.print("</td>");
					out.print("<td>");
					out.print("</tr>");

				}
				out.print("</table>");

				}
				if (entity.equals("2"))  {

		   			ResultSet rs = st.executeQuery(query8);
		   			
	 
					
					//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
					//if (rs.next() ){
						//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
						//if(rs1.next()){
						
						//Make an HTML table to show the results in:
						out.print("<table>");

					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//print out column header
					out.print("Train ID&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					
					//make a column
					out.print("<td>");
					out.print("Transit Line Name&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					
					//make a column
					out.print("<td>");
					out.print("Departure Time&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					
					
					out.print("<td>");
					out.print("Arrival Time&nbsp;&nbsp;		");
				
					out.print("</td>");
				
					
					
					out.print("<td>");
					out.print("Travel Time&nbsp;&nbsp;		");
					out.print("</td>");
					
					
					
					out.print("<td>");
					out.print("Fare&nbsp;&nbsp;		");
					out.print("</td>");
					
					
					out.print("<td>");
					out.print("Number of Stops&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					
					
					out.print("<td>");
					out.print("Destination&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					
					
					out.print("<td>");
					out.print("Origin&nbsp;&nbsp;		");
					out.print("			");
					out.print("</td>");
					out.print("<td>");
					out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
					out.print("			");
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
				  			 
				   			String b= rs.getString(10);

				   			
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

							out.print(rs.getString(8));
							out.print("</td>");
							out.print("<td>");

							out.print(rs.getString(9));
							out.print("</td>");
							out.print("<td>");
							out.print(rs.getString(10));
							out.print("</td>");
							out.print("<td>");
							out.print("</tr>");

						}
						out.print("</table>");

						}
						if (entity.equals("3"))  {

				   			ResultSet rs = st.executeQuery(query9);
				   			
			 
							
							//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
							//if (rs.next() ){
								//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
								//if(rs1.next()){
								
								//Make an HTML table to show the results in:
								out.print("<table>");

							//make a row
							out.print("<tr>");
							//make a column
							out.print("<td>");
							//print out column header
							out.print("Train ID&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							
							//make a column
							out.print("<td>");
							out.print("Transit Line Name&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							
							//make a column
							out.print("<td>");
							out.print("Departure Time&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							
							
							out.print("<td>");
							out.print("Arrival Time&nbsp;&nbsp;		");
						
							out.print("</td>");
						
							
							
							out.print("<td>");
							out.print("Travel Time&nbsp;&nbsp;		");
							out.print("</td>");
							
							
							
							out.print("<td>");
							out.print("Fare&nbsp;&nbsp;		");
							out.print("</td>");
							
							
							out.print("<td>");
							out.print("Number of Stops&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							
							
							out.print("<td>");
							out.print("Destination&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							
							
							out.print("<td>");
							out.print("Origin&nbsp;&nbsp;		");
							out.print("			");
							out.print("</td>");
							out.print("<td>");
							out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
							out.print("			");
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
						  			 String b= rs.getString(10);
						   			

						   			
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

									out.print(rs.getString(8));
									out.print("</td>");
									out.print("<td>");

									out.print(rs.getString(9));
									out.print("</td>");
									out.print("<td>");
									out.print(rs.getString(10));
									out.print("</td>");
									out.print("<td>");
									out.print("</tr>");

								}
								out.print("</table>");

								}
								if (entity.equals("4"))  {

						   			ResultSet rs = st.executeQuery(query10);
						   			
					 
									
									//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
									//if (rs.next() ){
										//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
										//if(rs1.next()){
										
										//Make an HTML table to show the results in:
										out.print("<table>");

									//make a row
									out.print("<tr>");
									//make a column
									out.print("<td>");
									//print out column header
									out.print("Train ID&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									
									//make a column
									out.print("<td>");
									out.print("Transit Line Name&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									
									//make a column
									out.print("<td>");
									out.print("Departure Time&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									
									
									out.print("<td>");
									out.print("Arrival Time&nbsp;&nbsp;		");
								
									out.print("</td>");
								
									
									
									out.print("<td>");
									out.print("Travel Time&nbsp;&nbsp;		");
									out.print("</td>");
									
									
									
									out.print("<td>");
									out.print("Fare&nbsp;&nbsp;		");
									out.print("</td>");
									
									
									out.print("<td>");
									out.print("Number of Stops&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									
									
									out.print("<td>");
									out.print("Destination&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									
									
									out.print("<td>");
									out.print("Origin&nbsp;&nbsp;		");
									out.print("			");
									out.print("</td>");
									out.print("<td>");
									out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
									out.print("			");
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
								  			 String b = rs.getString(10);
								   			

								   			
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

											out.print(rs.getString(8));
											out.print("</td>");
											out.print("<td>");

											out.print(rs.getString(9));
											out.print("</td>");
											out.print("<td>");
											out.print(rs.getString(10));
											out.print("</td>");
											out.print("<td>");
											out.print("</tr>");

										}
										out.print("</table>");

										}
										if (entity.equals("5"))  {

								   			ResultSet rs = st.executeQuery(query11);
								   			
							 
											
											//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
											//if (rs.next() ){
												//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
												//if(rs1.next()){
												
												//Make an HTML table to show the results in:
												out.print("<table>");

											//make a row
											out.print("<tr>");
											//make a column
											out.print("<td>");
											//print out column header
											out.print("Train ID&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											
											//make a column
											out.print("<td>");
											out.print("Transit Line Name&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											
											//make a column
											out.print("<td>");
											out.print("Departure Time&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											
											
											out.print("<td>");
											out.print("Arrival Time&nbsp;&nbsp;		");
										
											out.print("</td>");
										
											
											
											out.print("<td>");
											out.print("Travel Time&nbsp;&nbsp;		");
											out.print("</td>");
											
											
											
											out.print("<td>");
											out.print("Fare&nbsp;&nbsp;		");
											out.print("</td>");
											
											
											out.print("<td>");
											out.print("Number of Stops&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											
											
											out.print("<td>");
											out.print("Destination&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											
											
											out.print("<td>");
											out.print("Origin&nbsp;&nbsp;		");
											out.print("			");
											out.print("</td>");
											out.print("<td>");
											out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
											out.print("			");
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
										  			 String b = rs.getString(10);
										   			

										   			
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

													out.print(rs.getString(8));
													out.print("</td>");
													out.print("<td>");

													out.print(rs.getString(9));
													out.print("</td>");
													out.print("<td>");
													out.print(rs.getString(10));
													out.print("</td>");
													out.print("<td>");
													out.print("</tr>");

												}
												out.print("</table>");

												}
												if (entity.equals("6"))  {

										   			ResultSet rs = st.executeQuery(query12);
										   			
									 
													
													//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
													//if (rs.next() ){
														//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
														//if(rs1.next()){
														
														//Make an HTML table to show the results in:
														out.print("<table>");

													//make a row
													out.print("<tr>");
													//make a column
													out.print("<td>");
													//print out column header
													out.print("Train ID&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													
													//make a column
													out.print("<td>");
													out.print("Transit Line Name&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													
													//make a column
													out.print("<td>");
													out.print("Departure Time&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													
													
													out.print("<td>");
													out.print("Arrival Time&nbsp;&nbsp;		");
												
													out.print("</td>");
												
													
													
													out.print("<td>");
													out.print("Travel Time&nbsp;&nbsp;		");
													out.print("</td>");
													
													
													
													out.print("<td>");
													out.print("Fare&nbsp;&nbsp;		");
													out.print("</td>");
													
													
													out.print("<td>");
													out.print("Number of Stops&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													
													
													out.print("<td>");
													out.print("Destination&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													
													
													out.print("<td>");
													out.print("Origin&nbsp;&nbsp;		");
													out.print("			");
													out.print("</td>");
													out.print("<td>");
													out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
													out.print("			");
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
												  			 String b = rs.getString(10);
												   			

												   			
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

															out.print(rs.getString(8));
															out.print("</td>");
															out.print("<td>");

															out.print(rs.getString(9));
															out.print("</td>");
															out.print("<td>");
															out.print(rs.getString(10));
															out.print("</td>");
															out.print("<td>");
															out.print("</tr>");

														}
														out.print("</table>");

														}	
													}
													else if ((!destination.equals("")) && (origin.equals(""))&& (dateoft.equals("")))  {	if (entity.equals("1"))  {

											   			ResultSet rs = st.executeQuery(query13);
											   			
										 
														
														//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
														//if (rs.next() ){
															//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
															//if(rs1.next()){
															
															//Make an HTML table to show the results in:
															out.print("<table>");

														//make a row
														out.print("<tr>");
														//make a column
														out.print("<td>");
														//print out column header
														out.print("Train ID&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														
														//make a column
														out.print("<td>");
														out.print("Transit Line Name&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														
														//make a column
														out.print("<td>");
														out.print("Departure Time&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														
														
														out.print("<td>");
														out.print("Arrival Time&nbsp;&nbsp;		");
													
														out.print("</td>");
													
														
														
														out.print("<td>");
														out.print("Travel Time&nbsp;&nbsp;		");
														out.print("</td>");
														
														
														
														out.print("<td>");
														out.print("Fare&nbsp;&nbsp;		");
														out.print("</td>");
														
														
														out.print("<td>");
														out.print("Number of Stops&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														
														
														out.print("<td>");
														out.print("Destination&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														
														
														out.print("<td>");
														out.print("Origin&nbsp;&nbsp;		");
														out.print("			");
														out.print("</td>");
														out.print("<td>");
														out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
														out.print("			");
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
													  			String b=rs.getString(10); 
													   			

													   			
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

																out.print(rs.getString(8));
																out.print("</td>");
																out.print("<td>");

																out.print(rs.getString(9));
																out.print("</td>");
																out.print("<td>");
																out.print(rs.getString(10));
																out.print("</td>");
																out.print("<td>");
																out.print("</tr>");

															}
															out.print("</table>");

															}
															if (entity.equals("2"))  {

													   			ResultSet rs = st.executeQuery(query14);
													   			
												 
																
																//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																//if (rs.next() ){
																	//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																	//if(rs1.next()){
																	
																	//Make an HTML table to show the results in:
																	out.print("<table>");

																//make a row
																out.print("<tr>");
																//make a column
																out.print("<td>");
																//print out column header
																out.print("Train ID&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																
																//make a column
																out.print("<td>");
																out.print("Transit Line Name&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																
																//make a column
																out.print("<td>");
																out.print("Departure Time&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																
																
																out.print("<td>");
																out.print("Arrival Time&nbsp;&nbsp;		");
															
																out.print("</td>");
															
																
																
																out.print("<td>");
																out.print("Travel Time&nbsp;&nbsp;		");
																out.print("</td>");
																
																
																
																out.print("<td>");
																out.print("Fare&nbsp;&nbsp;		");
																out.print("</td>");
																
																
																out.print("<td>");
																out.print("Number of Stops&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																
																
																out.print("<td>");
																out.print("Destination&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																
																
																out.print("<td>");
																out.print("Origin&nbsp;&nbsp;		");
																out.print("			");
																out.print("</td>");
																out.print("<td>");
																out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																out.print("			");
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
															  			String b=rs.getString(10); 
															   			

															   			
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

																		out.print(rs.getString(8));
																		out.print("</td>");
																		out.print("<td>");

																		out.print(rs.getString(9));
																		out.print("</td>");
																		out.print("<td>");
																		out.print(rs.getString(10));
																		out.print("</td>");
																		out.print("<td>");
																		out.print("</tr>");

																	}
																	out.print("</table>");

																	}
																	if (entity.equals("3"))  {

															   			ResultSet rs = st.executeQuery(query15);
															   			
														 
																		
																		//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																		//if (rs.next() ){
																			//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																			//if(rs1.next()){
																			
																			//Make an HTML table to show the results in:
																			out.print("<table>");

																		//make a row
																		out.print("<tr>");
																		//make a column
																		out.print("<td>");
																		//print out column header
																		out.print("Train ID&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		
																		//make a column
																		out.print("<td>");
																		out.print("Transit Line Name&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		
																		//make a column
																		out.print("<td>");
																		out.print("Departure Time&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		
																		
																		out.print("<td>");
																		out.print("Arrival Time&nbsp;&nbsp;		");
																	
																		out.print("</td>");
																	
																		
																		
																		out.print("<td>");
																		out.print("Travel Time&nbsp;&nbsp;		");
																		out.print("</td>");
																		
																		
																		
																		out.print("<td>");
																		out.print("Fare&nbsp;&nbsp;		");
																		out.print("</td>");
																		
																		
																		out.print("<td>");
																		out.print("Number of Stops&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		
																		
																		out.print("<td>");
																		out.print("Destination&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		
																		
																		out.print("<td>");
																		out.print("Origin&nbsp;&nbsp;		");
																		out.print("			");
																		out.print("</td>");
																		out.print("<td>");
																		out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																		out.print("			");
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
																	  			String bi =  rs.getString(10);
																	   			

																	   			
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

																				out.print(rs.getString(8));
																				out.print("</td>");
																				out.print("<td>");

																				out.print(rs.getString(9));
																				out.print("</td>");
																				out.print("<td>");
																				out.print(rs.getString(10));
																				out.print("</td>");
																				out.print("<td>");
																				out.print("</tr>");

																			}
																			out.print("</table>");

																			}
																			if (entity.equals("4"))  {

																	   			ResultSet rs = st.executeQuery(query16);
																	   			
																 
																				
																				//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																				//if (rs.next() ){
																					//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																					//if(rs1.next()){
																					
																					//Make an HTML table to show the results in:
																					out.print("<table>");

																				//make a row
																				out.print("<tr>");
																				//make a column
																				out.print("<td>");
																				//print out column header
																				out.print("Train ID&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				
																				//make a column
																				out.print("<td>");
																				out.print("Transit Line Name&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				
																				//make a column
																				out.print("<td>");
																				out.print("Departure Time&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				
																				
																				out.print("<td>");
																				out.print("Arrival Time&nbsp;&nbsp;		");
																			
																				out.print("</td>");
																			
																				
																				
																				out.print("<td>");
																				out.print("Travel Time&nbsp;&nbsp;		");
																				out.print("</td>");
																				
																				
																				
																				out.print("<td>");
																				out.print("Fare&nbsp;&nbsp;		");
																				out.print("</td>");
																				
																				
																				out.print("<td>");
																				out.print("Number of Stops&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				
																				
																				out.print("<td>");
																				out.print("Destination&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				
																				
																				out.print("<td>");
																				out.print("Origin&nbsp;&nbsp;		");
																				out.print("			");
																				out.print("</td>");
																				out.print("<td>");
																				out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																				out.print("			");
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
																			  			String meow=rs.getString(10); 
																			   			

																			   			
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

																						out.print(rs.getString(8));
																						out.print("</td>");
																						out.print("<td>");

																						out.print(rs.getString(9));
																						out.print("</td>");
																						out.print("<td>");
																						out.print(rs.getString(10));
																						out.print("</td>");
																						out.print("<td>");
																						out.print("</tr>");

																					}
																					out.print("</table>");

																					}
																					if (entity.equals("5"))  {

																			   			ResultSet rs = st.executeQuery(query17);
																			   			
																		 
																						
																						//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																						//if (rs.next() ){
																							//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																							//if(rs1.next()){
																							
																							//Make an HTML table to show the results in:
																							out.print("<table>");

																						//make a row
																						out.print("<tr>");
																						//make a column
																						out.print("<td>");
																						//print out column header
																						out.print("Train ID&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						
																						//make a column
																						out.print("<td>");
																						out.print("Transit Line Name&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						
																						//make a column
																						out.print("<td>");
																						out.print("Departure Time&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						
																						
																						out.print("<td>");
																						out.print("Arrival Time&nbsp;&nbsp;		");
																					
																						out.print("</td>");
																					
																						
																						
																						out.print("<td>");
																						out.print("Travel Time&nbsp;&nbsp;		");
																						out.print("</td>");
																						
																						
																						
																						out.print("<td>");
																						out.print("Fare&nbsp;&nbsp;		");
																						out.print("</td>");
																						
																						
																						out.print("<td>");
																						out.print("Number of Stops&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						
																						
																						out.print("<td>");
																						out.print("Destination&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						
																						
																						out.print("<td>");
																						out.print("Origin&nbsp;&nbsp;		");
																						out.print("			");
																						out.print("</td>");
																						out.print("<td>");
																						out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																						out.print("			");
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
																					  			 String meow=rs.getString(10);
																					   			

																					   			
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

																								out.print(rs.getString(8));
																								out.print("</td>");
																								out.print("<td>");

																								out.print(rs.getString(9));
																								out.print("</td>");
																								out.print("<td>");
																								out.print(rs.getString(10));
																								out.print("</td>");
																								out.print("<td>");
																								out.print("</tr>");

																							}
																							out.print("</table>");

																							}
																							if (entity.equals("6"))  {

																					   			ResultSet rs = st.executeQuery(query18);
																					   			
																				 
																								
																								//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																								//if (rs.next() ){
																									//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																									//if(rs1.next()){
																									
																									//Make an HTML table to show the results in:
																									out.print("<table>");

																								//make a row
																								out.print("<tr>");
																								//make a column
																								out.print("<td>");
																								//print out column header
																								out.print("Train ID&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								
																								//make a column
																								out.print("<td>");
																								out.print("Transit Line Name&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								
																								//make a column
																								out.print("<td>");
																								out.print("Departure Time&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								
																								
																								out.print("<td>");
																								out.print("Arrival Time&nbsp;&nbsp;		");
																							
																								out.print("</td>");
																							
																								
																								
																								out.print("<td>");
																								out.print("Travel Time&nbsp;&nbsp;		");
																								out.print("</td>");
																								
																								
																								
																								out.print("<td>");
																								out.print("Fare&nbsp;&nbsp;		");
																								out.print("</td>");
																								
																								
																								out.print("<td>");
																								out.print("Number of Stops&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								
																								
																								out.print("<td>");
																								out.print("Destination&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								
																								
																								out.print("<td>");
																								out.print("Origin&nbsp;&nbsp;		");
																								out.print("			");
																								out.print("</td>");
																								out.print("<td>");
																								out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																								out.print("			");
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
																							  			String meowwww= rs.getString(10);
																							   			

																							   			
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

																										out.print(rs.getString(8));
																										out.print("</td>");
																										out.print("<td>");

																										out.print(rs.getString(9));
																										out.print("</td>");
																										out.print("<td>");
																										out.print(rs.getString(10));
																										out.print("</td>");
																										out.print("<td>");
																										out.print("</tr>");

																									}
																									out.print("</table>");

																									}	
																								}
																								else if ((!destination.equals("")) && (origin.equals(""))&& (!dateoft.equals("")))  {	if (entity.equals("1"))  {

																						   			ResultSet rs = st.executeQuery(query31);
																						   			
																					 
																									
																									//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																									//if (rs.next() ){
																										//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																										//if(rs1.next()){
																										
																										//Make an HTML table to show the results in:
																										out.print("<table>");

																									//make a row
																									out.print("<tr>");
																									//make a column
																									out.print("<td>");
																									//print out column header
																									out.print("Train ID&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									
																									//make a column
																									out.print("<td>");
																									out.print("Transit Line Name&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									
																									//make a column
																									out.print("<td>");
																									out.print("Departure Time&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									
																									
																									out.print("<td>");
																									out.print("Arrival Time&nbsp;&nbsp;		");
																								
																									out.print("</td>");
																								
																									
																									
																									out.print("<td>");
																									out.print("Travel Time&nbsp;&nbsp;		");
																									out.print("</td>");
																									
																									
																									
																									out.print("<td>");
																									out.print("Fare&nbsp;&nbsp;		");
																									out.print("</td>");
																									
																									
																									out.print("<td>");
																									out.print("Number of Stops&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									
																									
																									out.print("<td>");
																									out.print("Destination&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									
																									
																									out.print("<td>");
																									out.print("Origin&nbsp;&nbsp;		");
																									out.print("			");
																									out.print("</td>");
																									out.print("<td>");
																									out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																									out.print("			");
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
																								  			String b=rs.getString(10); 
																								   			

																								   			
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

																											out.print(rs.getString(8));
																											out.print("</td>");
																											out.print("<td>");

																											out.print(rs.getString(9));
																											out.print("</td>");
																											out.print("<td>");
																											out.print(rs.getString(10));
																											out.print("</td>");
																											out.print("<td>");
																											out.print("</tr>");

																										}
																										out.print("</table>");

																										}
																										if (entity.equals("2"))  {

																								   			ResultSet rs = st.executeQuery(query32);
																								   			
																							 
																											
																											//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																											//if (rs.next() ){
																												//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																												//if(rs1.next()){
																												
																												//Make an HTML table to show the results in:
																												out.print("<table>");

																											//make a row
																											out.print("<tr>");
																											//make a column
																											out.print("<td>");
																											//print out column header
																											out.print("Train ID&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											
																											//make a column
																											out.print("<td>");
																											out.print("Transit Line Name&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											
																											//make a column
																											out.print("<td>");
																											out.print("Departure Time&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											
																											
																											out.print("<td>");
																											out.print("Arrival Time&nbsp;&nbsp;		");
																										
																											out.print("</td>");
																										
																											
																											
																											out.print("<td>");
																											out.print("Travel Time&nbsp;&nbsp;		");
																											out.print("</td>");
																											
																											
																											
																											out.print("<td>");
																											out.print("Fare&nbsp;&nbsp;		");
																											out.print("</td>");
																											
																											
																											out.print("<td>");
																											out.print("Number of Stops&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											
																											
																											out.print("<td>");
																											out.print("Destination&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											
																											
																											out.print("<td>");
																											out.print("Origin&nbsp;&nbsp;		");
																											out.print("			");
																											out.print("</td>");
																											out.print("<td>");
																											out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																											out.print("			");
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
																										  			String b=rs.getString(10); 
																										   			

																										   			
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

																													out.print(rs.getString(8));
																													out.print("</td>");
																													out.print("<td>");

																													out.print(rs.getString(9));
																													out.print("</td>");
																													out.print("<td>");
																													out.print(rs.getString(10));
																													out.print("</td>");
																													out.print("<td>");
																													out.print("</tr>");

																												}
																												out.print("</table>");

																												}
																												if (entity.equals("3"))  {

																										   			ResultSet rs = st.executeQuery(query33);
																										   			
																									 
																													
																													//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																													//if (rs.next() ){
																														//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																														//if(rs1.next()){
																														
																														//Make an HTML table to show the results in:
																														out.print("<table>");

																													//make a row
																													out.print("<tr>");
																													//make a column
																													out.print("<td>");
																													//print out column header
																													out.print("Train ID&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													
																													//make a column
																													out.print("<td>");
																													out.print("Transit Line Name&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													
																													//make a column
																													out.print("<td>");
																													out.print("Departure Time&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													
																													
																													out.print("<td>");
																													out.print("Arrival Time&nbsp;&nbsp;		");
																												
																													out.print("</td>");
																												
																													
																													
																													out.print("<td>");
																													out.print("Travel Time&nbsp;&nbsp;		");
																													out.print("</td>");
																													
																													
																													
																													out.print("<td>");
																													out.print("Fare&nbsp;&nbsp;		");
																													out.print("</td>");
																													
																													
																													out.print("<td>");
																													out.print("Number of Stops&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													
																													
																													out.print("<td>");
																													out.print("Destination&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													
																													
																													out.print("<td>");
																													out.print("Origin&nbsp;&nbsp;		");
																													out.print("			");
																													out.print("</td>");
																													out.print("<td>");
																													out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																													out.print("			");
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
																												  			String bi =  rs.getString(10);
																												   			

																												   			
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

																															out.print(rs.getString(8));
																															out.print("</td>");
																															out.print("<td>");

																															out.print(rs.getString(9));
																															out.print("</td>");
																															out.print("<td>");
																															out.print(rs.getString(10));
																															out.print("</td>");
																															out.print("<td>");
																															out.print("</tr>");

																														}
																														out.print("</table>");

																														}
																														if (entity.equals("4"))  {

																												   			ResultSet rs = st.executeQuery(query34);
																												   			
																											 
																															
																															//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																															//if (rs.next() ){
																																//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																//if(rs1.next()){
																																
																																//Make an HTML table to show the results in:
																																out.print("<table>");

																															//make a row
																															out.print("<tr>");
																															//make a column
																															out.print("<td>");
																															//print out column header
																															out.print("Train ID&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															
																															//make a column
																															out.print("<td>");
																															out.print("Transit Line Name&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															
																															//make a column
																															out.print("<td>");
																															out.print("Departure Time&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															
																															
																															out.print("<td>");
																															out.print("Arrival Time&nbsp;&nbsp;		");
																														
																															out.print("</td>");
																														
																															
																															
																															out.print("<td>");
																															out.print("Travel Time&nbsp;&nbsp;		");
																															out.print("</td>");
																															
																															
																															
																															out.print("<td>");
																															out.print("Fare&nbsp;&nbsp;		");
																															out.print("</td>");
																															
																															
																															out.print("<td>");
																															out.print("Number of Stops&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															
																															
																															out.print("<td>");
																															out.print("Destination&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															
																															
																															out.print("<td>");
																															out.print("Origin&nbsp;&nbsp;		");
																															out.print("			");
																															out.print("</td>");
																															out.print("<td>");
																															out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																															out.print("			");
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
																														  			String meow=rs.getString(10); 
																														   			

																														   			
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

																																	out.print(rs.getString(8));
																																	out.print("</td>");
																																	out.print("<td>");

																																	out.print(rs.getString(9));
																																	out.print("</td>");
																																	out.print("<td>");
																																	out.print(rs.getString(10));
																																	out.print("</td>");
																																	out.print("<td>");
																																	out.print("</tr>");

																																}
																																out.print("</table>");

																																}
																																if (entity.equals("5"))  {

																														   			ResultSet rs = st.executeQuery(query35);
																														   			
																													 
																																	
																																	//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																	//if (rs.next() ){
																																		//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																		//if(rs1.next()){
																																		
																																		//Make an HTML table to show the results in:
																																		out.print("<table>");

																																	//make a row
																																	out.print("<tr>");
																																	//make a column
																																	out.print("<td>");
																																	//print out column header
																																	out.print("Train ID&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	
																																	//make a column
																																	out.print("<td>");
																																	out.print("Transit Line Name&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	
																																	//make a column
																																	out.print("<td>");
																																	out.print("Departure Time&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	
																																	
																																	out.print("<td>");
																																	out.print("Arrival Time&nbsp;&nbsp;		");
																																
																																	out.print("</td>");
																																
																																	
																																	
																																	out.print("<td>");
																																	out.print("Travel Time&nbsp;&nbsp;		");
																																	out.print("</td>");
																																	
																																	
																																	
																																	out.print("<td>");
																																	out.print("Fare&nbsp;&nbsp;		");
																																	out.print("</td>");
																																	
																																	
																																	out.print("<td>");
																																	out.print("Number of Stops&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	
																																	
																																	out.print("<td>");
																																	out.print("Destination&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	
																																	
																																	out.print("<td>");
																																	out.print("Origin&nbsp;&nbsp;		");
																																	out.print("			");
																																	out.print("</td>");
																																	out.print("<td>");
																																	out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																	out.print("			");
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
																																  			 String meow=rs.getString(10);
																																   			

																																   			
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

																																			out.print(rs.getString(8));
																																			out.print("</td>");
																																			out.print("<td>");

																																			out.print(rs.getString(9));
																																			out.print("</td>");
																																			out.print("<td>");
																																			out.print(rs.getString(10));
																																			out.print("</td>");
																																			out.print("<td>");
																																			out.print("</tr>");

																																		}
																																		out.print("</table>");

																																		}
																																		if (entity.equals("6"))  {

																																   			ResultSet rs = st.executeQuery(query36);
																																   			
																															 
																																			
																																			//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																			//if (rs.next() ){
																																				//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																				//if(rs1.next()){
																																				
																																				//Make an HTML table to show the results in:
																																				out.print("<table>");

																																			//make a row
																																			out.print("<tr>");
																																			//make a column
																																			out.print("<td>");
																																			//print out column header
																																			out.print("Train ID&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			
																																			//make a column
																																			out.print("<td>");
																																			out.print("Transit Line Name&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			
																																			//make a column
																																			out.print("<td>");
																																			out.print("Departure Time&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			
																																			
																																			out.print("<td>");
																																			out.print("Arrival Time&nbsp;&nbsp;		");
																																		
																																			out.print("</td>");
																																		
																																			
																																			
																																			out.print("<td>");
																																			out.print("Travel Time&nbsp;&nbsp;		");
																																			out.print("</td>");
																																			
																																			
																																			
																																			out.print("<td>");
																																			out.print("Fare&nbsp;&nbsp;		");
																																			out.print("</td>");
																																			
																																			
																																			out.print("<td>");
																																			out.print("Number of Stops&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			
																																			
																																			out.print("<td>");
																																			out.print("Destination&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			
																																			
																																			out.print("<td>");
																																			out.print("Origin&nbsp;&nbsp;		");
																																			out.print("			");
																																			out.print("</td>");
																																			out.print("<td>");
																																			out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																			out.print("			");
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
																																		  			String meowwww= rs.getString(10);
																																		   			

																																		   			
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

																																					out.print(rs.getString(8));
																																					out.print("</td>");
																																					out.print("<td>");

																																					out.print(rs.getString(9));
																																					out.print("</td>");
																																					out.print("<td>");
																																					out.print(rs.getString(10));
																																					out.print("</td>");
																																					out.print("<td>");
																																					out.print("</tr>");

																																				}
																																				out.print("</table>");

																																				}	
																																			}
											
																																			else if ((destination.equals("")) && (!origin.equals(""))&& (!dateoft.equals("")))  {	if (entity.equals("1"))  {

																																	   			ResultSet rs = st.executeQuery(query25);
																																	   			
																																 
																																				
																																				//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																				//if (rs.next() ){
																																					//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																					//if(rs1.next()){
																																					
																																					//Make an HTML table to show the results in:
																																					out.print("<table>");

																																				//make a row
																																				out.print("<tr>");
																																				//make a column
																																				out.print("<td>");
																																				//print out column header
																																				out.print("Train ID&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				
																																				//make a column
																																				out.print("<td>");
																																				out.print("Transit Line Name&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				
																																				//make a column
																																				out.print("<td>");
																																				out.print("Departure Time&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				
																																				
																																				out.print("<td>");
																																				out.print("Arrival Time&nbsp;&nbsp;		");
																																			
																																				out.print("</td>");
																																			
																																				
																																				
																																				out.print("<td>");
																																				out.print("Travel Time&nbsp;&nbsp;		");
																																				out.print("</td>");
																																				
																																				
																																				
																																				out.print("<td>");
																																				out.print("Fare&nbsp;&nbsp;		");
																																				out.print("</td>");
																																				
																																				
																																				out.print("<td>");
																																				out.print("Number of Stops&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				
																																				
																																				out.print("<td>");
																																				out.print("Destination&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				
																																				
																																				out.print("<td>");
																																				out.print("Origin&nbsp;&nbsp;		");
																																				out.print("			");
																																				out.print("</td>");
																																				out.print("<td>");
																																				out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																				out.print("			");
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
																																			  			String b=rs.getString(10); 
																																			   			

																																			   			
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

																																						out.print(rs.getString(8));
																																						out.print("</td>");
																																						out.print("<td>");

																																						out.print(rs.getString(9));
																																						out.print("</td>");
																																						out.print("<td>");
																																						out.print(rs.getString(10));
																																						out.print("</td>");
																																						out.print("<td>");
																																						out.print("</tr>");

																																					}
																																					out.print("</table>");

																																					}
																																					if (entity.equals("2"))  {

																																			   			ResultSet rs = st.executeQuery(query26);
																																			   			
																																		 
																																						
																																						//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																						//if (rs.next() ){
																																							//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																							//if(rs1.next()){
																																							
																																							//Make an HTML table to show the results in:
																																							out.print("<table>");

																																						//make a row
																																						out.print("<tr>");
																																						//make a column
																																						out.print("<td>");
																																						//print out column header
																																						out.print("Train ID&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						
																																						//make a column
																																						out.print("<td>");
																																						out.print("Transit Line Name&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						
																																						//make a column
																																						out.print("<td>");
																																						out.print("Departure Time&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						
																																						
																																						out.print("<td>");
																																						out.print("Arrival Time&nbsp;&nbsp;		");
																																					
																																						out.print("</td>");
																																					
																																						
																																						
																																						out.print("<td>");
																																						out.print("Travel Time&nbsp;&nbsp;		");
																																						out.print("</td>");
																																						
																																						
																																						
																																						out.print("<td>");
																																						out.print("Fare&nbsp;&nbsp;		");
																																						out.print("</td>");
																																						
																																						
																																						out.print("<td>");
																																						out.print("Number of Stops&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						
																																						
																																						out.print("<td>");
																																						out.print("Destination&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						
																																						
																																						out.print("<td>");
																																						out.print("Origin&nbsp;&nbsp;		");
																																						out.print("			");
																																						out.print("</td>");
																																						out.print("<td>");
																																						out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																						out.print("			");
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
																																					  			String b=rs.getString(10); 
																																					   			

																																					   			
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

																																								out.print(rs.getString(8));
																																								out.print("</td>");
																																								out.print("<td>");

																																								out.print(rs.getString(9));
																																								out.print("</td>");
																																								out.print("<td>");
																																								out.print(rs.getString(10));
																																								out.print("</td>");
																																								out.print("<td>");
																																								out.print("</tr>");

																																							}
																																							out.print("</table>");

																																							}
																																							if (entity.equals("3"))  {

																																					   			ResultSet rs = st.executeQuery(query27);
																																					   			
																																				 
																																								
																																								//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																								//if (rs.next() ){
																																									//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																									//if(rs1.next()){
																																									
																																									//Make an HTML table to show the results in:
																																									out.print("<table>");

																																								//make a row
																																								out.print("<tr>");
																																								//make a column
																																								out.print("<td>");
																																								//print out column header
																																								out.print("Train ID&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								
																																								//make a column
																																								out.print("<td>");
																																								out.print("Transit Line Name&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								
																																								//make a column
																																								out.print("<td>");
																																								out.print("Departure Time&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								
																																								
																																								out.print("<td>");
																																								out.print("Arrival Time&nbsp;&nbsp;		");
																																							
																																								out.print("</td>");
																																							
																																								
																																								
																																								out.print("<td>");
																																								out.print("Travel Time&nbsp;&nbsp;		");
																																								out.print("</td>");
																																								
																																								
																																								
																																								out.print("<td>");
																																								out.print("Fare&nbsp;&nbsp;		");
																																								out.print("</td>");
																																								
																																								
																																								out.print("<td>");
																																								out.print("Number of Stops&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								
																																								
																																								out.print("<td>");
																																								out.print("Destination&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								
																																								
																																								out.print("<td>");
																																								out.print("Origin&nbsp;&nbsp;		");
																																								out.print("			");
																																								out.print("</td>");
																																								out.print("<td>");
																																								out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																								out.print("			");
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
																																							  			String bi =  rs.getString(10);
																																							   			

																																							   			
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

																																										out.print(rs.getString(8));
																																										out.print("</td>");
																																										out.print("<td>");

																																										out.print(rs.getString(9));
																																										out.print("</td>");
																																										out.print("<td>");
																																										out.print(rs.getString(10));
																																										out.print("</td>");
																																										out.print("<td>");
																																										out.print("</tr>");

																																									}
																																									out.print("</table>");

																																									}
																																									if (entity.equals("4"))  {

																																							   			ResultSet rs = st.executeQuery(query28);
																																							   			
																																						 
																																										
																																										//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																										//if (rs.next() ){
																																											//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																											//if(rs1.next()){
																																											
																																											//Make an HTML table to show the results in:
																																											out.print("<table>");

																																										//make a row
																																										out.print("<tr>");
																																										//make a column
																																										out.print("<td>");
																																										//print out column header
																																										out.print("Train ID&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										
																																										//make a column
																																										out.print("<td>");
																																										out.print("Transit Line Name&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										
																																										//make a column
																																										out.print("<td>");
																																										out.print("Departure Time&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										
																																										
																																										out.print("<td>");
																																										out.print("Arrival Time&nbsp;&nbsp;		");
																																									
																																										out.print("</td>");
																																									
																																										
																																										
																																										out.print("<td>");
																																										out.print("Travel Time&nbsp;&nbsp;		");
																																										out.print("</td>");
																																										
																																										
																																										
																																										out.print("<td>");
																																										out.print("Fare&nbsp;&nbsp;		");
																																										out.print("</td>");
																																										
																																										
																																										out.print("<td>");
																																										out.print("Number of Stops&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										
																																										
																																										out.print("<td>");
																																										out.print("Destination&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										
																																										
																																										out.print("<td>");
																																										out.print("Origin&nbsp;&nbsp;		");
																																										out.print("			");
																																										out.print("</td>");
																																										out.print("<td>");
																																										out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																										out.print("			");
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
																																									  			String meow=rs.getString(10); 
																																									   			

																																									   			
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

																																												out.print(rs.getString(8));
																																												out.print("</td>");
																																												out.print("<td>");

																																												out.print(rs.getString(9));
																																												out.print("</td>");
																																												out.print("<td>");
																																												out.print(rs.getString(10));
																																												out.print("</td>");
																																												out.print("<td>");
																																												out.print("</tr>");

																																											}
																																											out.print("</table>");

																																											}
																																											if (entity.equals("5"))  {

																																									   			ResultSet rs = st.executeQuery(query29);
																																									   			
																																								 
																																												
																																												//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																												//if (rs.next() ){
																																													//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																													//if(rs1.next()){
																																													
																																													//Make an HTML table to show the results in:
																																													out.print("<table>");

																																												//make a row
																																												out.print("<tr>");
																																												//make a column
																																												out.print("<td>");
																																												//print out column header
																																												out.print("Train ID&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												
																																												//make a column
																																												out.print("<td>");
																																												out.print("Transit Line Name&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												
																																												//make a column
																																												out.print("<td>");
																																												out.print("Departure Time&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												
																																												
																																												out.print("<td>");
																																												out.print("Arrival Time&nbsp;&nbsp;		");
																																											
																																												out.print("</td>");
																																											
																																												
																																												
																																												out.print("<td>");
																																												out.print("Travel Time&nbsp;&nbsp;		");
																																												out.print("</td>");
																																												
																																												
																																												
																																												out.print("<td>");
																																												out.print("Fare&nbsp;&nbsp;		");
																																												out.print("</td>");
																																												
																																												
																																												out.print("<td>");
																																												out.print("Number of Stops&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												
																																												
																																												out.print("<td>");
																																												out.print("Destination&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												
																																												
																																												out.print("<td>");
																																												out.print("Origin&nbsp;&nbsp;		");
																																												out.print("			");
																																												out.print("</td>");
																																												out.print("<td>");
																																												out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																												out.print("			");
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
																																											  			 String meow=rs.getString(10);
																																											   			

																																											   			
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

																																														out.print(rs.getString(8));
																																														out.print("</td>");
																																														out.print("<td>");

																																														out.print(rs.getString(9));
																																														out.print("</td>");
																																														out.print("<td>");
																																														out.print(rs.getString(10));
																																														out.print("</td>");
																																														out.print("<td>");
																																														out.print("</tr>");

																																													}
																																													out.print("</table>");

																																													}
																																													if (entity.equals("6"))  {

																																											   			ResultSet rs = st.executeQuery(query30);
																																											   			
																																										 
																																														
																																														//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																														//if (rs.next() ){
																																															//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																															//if(rs1.next()){
																																															
																																															//Make an HTML table to show the results in:
																																															out.print("<table>");

																																														//make a row
																																														out.print("<tr>");
																																														//make a column
																																														out.print("<td>");
																																														//print out column header
																																														out.print("Train ID&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														
																																														//make a column
																																														out.print("<td>");
																																														out.print("Transit Line Name&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														
																																														//make a column
																																														out.print("<td>");
																																														out.print("Departure Time&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														
																																														
																																														out.print("<td>");
																																														out.print("Arrival Time&nbsp;&nbsp;		");
																																													
																																														out.print("</td>");
																																													
																																														
																																														
																																														out.print("<td>");
																																														out.print("Travel Time&nbsp;&nbsp;		");
																																														out.print("</td>");
																																														
																																														
																																														
																																														out.print("<td>");
																																														out.print("Fare&nbsp;&nbsp;		");
																																														out.print("</td>");
																																														
																																														
																																														out.print("<td>");
																																														out.print("Number of Stops&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														
																																														
																																														out.print("<td>");
																																														out.print("Destination&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														
																																														
																																														out.print("<td>");
																																														out.print("Origin&nbsp;&nbsp;		");
																																														out.print("			");
																																														out.print("</td>");
																																														out.print("<td>");
																																														out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																														out.print("			");
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
																																													  			String meowwww= rs.getString(10);
																																													   			

																																													   			
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

																																																out.print(rs.getString(8));
																																																out.print("</td>");
																																																out.print("<td>");

																																																out.print(rs.getString(9));
																																																out.print("</td>");
																																																out.print("<td>");
																																																out.print(rs.getString(10));
																																																out.print("</td>");
																																																out.print("<td>");
																																																out.print("</tr>");

																																															}
																																															out.print("</table>");

																																															}	
																																														}
																																														else if ((!destination.equals("")) && (!origin.equals(""))&& (!dateoft.equals("")))  {	if (entity.equals("1"))  {

																																												   			ResultSet rs = st.executeQuery(query19);
																																												   			
																																											 
																																															
																																															//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																															//if (rs.next() ){
																																																//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																//if(rs1.next()){
																																																
																																																//Make an HTML table to show the results in:
																																																out.print("<table>");

																																															//make a row
																																															out.print("<tr>");
																																															//make a column
																																															out.print("<td>");
																																															//print out column header
																																															out.print("Train ID&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															
																																															//make a column
																																															out.print("<td>");
																																															out.print("Transit Line Name&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															
																																															//make a column
																																															out.print("<td>");
																																															out.print("Departure Time&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															
																																															
																																															out.print("<td>");
																																															out.print("Arrival Time&nbsp;&nbsp;		");
																																														
																																															out.print("</td>");
																																														
																																															
																																															
																																															out.print("<td>");
																																															out.print("Travel Time&nbsp;&nbsp;		");
																																															out.print("</td>");
																																															
																																															
																																															
																																															out.print("<td>");
																																															out.print("Fare&nbsp;&nbsp;		");
																																															out.print("</td>");
																																															
																																															
																																															out.print("<td>");
																																															out.print("Number of Stops&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															
																																															
																																															out.print("<td>");
																																															out.print("Destination&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															
																																															
																																															out.print("<td>");
																																															out.print("Origin&nbsp;&nbsp;		");
																																															out.print("			");
																																															out.print("</td>");
																																															out.print("<td>");
																																															out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																															out.print("			");
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
																																														  			String b=rs.getString(10); 
																																														   			

																																														   			
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

																																																	out.print(rs.getString(8));
																																																	out.print("</td>");
																																																	out.print("<td>");

																																																	out.print(rs.getString(9));
																																																	out.print("</td>");
																																																	out.print("<td>");
																																																	out.print(rs.getString(10));
																																																	out.print("</td>");
																																																	out.print("<td>");
																																																	out.print("</tr>");

																																																}
																																																out.print("</table>");

																																																}
																																																if (entity.equals("2"))  {

																																														   			ResultSet rs = st.executeQuery(query20);
																																														   			
																																													 
																																																	
																																																	//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																	//if (rs.next() ){
																																																		//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																		//if(rs1.next()){
																																																		
																																																		//Make an HTML table to show the results in:
																																																		out.print("<table>");

																																																	//make a row
																																																	out.print("<tr>");
																																																	//make a column
																																																	out.print("<td>");
																																																	//print out column header
																																																	out.print("Train ID&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	
																																																	//make a column
																																																	out.print("<td>");
																																																	out.print("Transit Line Name&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	
																																																	//make a column
																																																	out.print("<td>");
																																																	out.print("Departure Time&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Arrival Time&nbsp;&nbsp;		");
																																																
																																																	out.print("</td>");
																																																
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Travel Time&nbsp;&nbsp;		");
																																																	out.print("</td>");
																																																	
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Fare&nbsp;&nbsp;		");
																																																	out.print("</td>");
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Number of Stops&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Destination&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	
																																																	
																																																	out.print("<td>");
																																																	out.print("Origin&nbsp;&nbsp;		");
																																																	out.print("			");
																																																	out.print("</td>");
																																																	out.print("<td>");
																																																	out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																	out.print("			");
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
																																																  			String b=rs.getString(10); 
																																																   			

																																																   			
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

																																																			out.print(rs.getString(8));
																																																			out.print("</td>");
																																																			out.print("<td>");

																																																			out.print(rs.getString(9));
																																																			out.print("</td>");
																																																			out.print("<td>");
																																																			out.print(rs.getString(10));
																																																			out.print("</td>");
																																																			out.print("<td>");
																																																			out.print("</tr>");

																																																		}
																																																		out.print("</table>");

																																																		}
																																																		if (entity.equals("3"))  {

																																																   			ResultSet rs = st.executeQuery(query21);
																																																   			
																																															 
																																																			
																																																			//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																			//if (rs.next() ){
																																																				//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																				//if(rs1.next()){
																																																				
																																																				//Make an HTML table to show the results in:
																																																				out.print("<table>");

																																																			//make a row
																																																			out.print("<tr>");
																																																			//make a column
																																																			out.print("<td>");
																																																			//print out column header
																																																			out.print("Train ID&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			
																																																			//make a column
																																																			out.print("<td>");
																																																			out.print("Transit Line Name&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			
																																																			//make a column
																																																			out.print("<td>");
																																																			out.print("Departure Time&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Arrival Time&nbsp;&nbsp;		");
																																																		
																																																			out.print("</td>");
																																																		
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Travel Time&nbsp;&nbsp;		");
																																																			out.print("</td>");
																																																			
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Fare&nbsp;&nbsp;		");
																																																			out.print("</td>");
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Number of Stops&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Destination&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			
																																																			
																																																			out.print("<td>");
																																																			out.print("Origin&nbsp;&nbsp;		");
																																																			out.print("			");
																																																			out.print("</td>");
																																																			out.print("<td>");
																																																			out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																			out.print("			");
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
																																																		  			String bi =  rs.getString(10);
																																																		   			

																																																		   			
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

																																																					out.print(rs.getString(8));
																																																					out.print("</td>");
																																																					out.print("<td>");

																																																					out.print(rs.getString(9));
																																																					out.print("</td>");
																																																					out.print("<td>");
																																																					out.print(rs.getString(10));
																																																					out.print("</td>");
																																																					out.print("<td>");
																																																					out.print("</tr>");

																																																				}
																																																				out.print("</table>");

																																																				}
																																																				if (entity.equals("4"))  {

																																																		   			ResultSet rs = st.executeQuery(query22);
																																																		   			
																																																	 
																																																					
																																																					//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																					//if (rs.next() ){
																																																						//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																						//if(rs1.next()){
																																																						
																																																						//Make an HTML table to show the results in:
																																																						out.print("<table>");

																																																					//make a row
																																																					out.print("<tr>");
																																																					//make a column
																																																					out.print("<td>");
																																																					//print out column header
																																																					out.print("Train ID&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					
																																																					//make a column
																																																					out.print("<td>");
																																																					out.print("Transit Line Name&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					
																																																					//make a column
																																																					out.print("<td>");
																																																					out.print("Departure Time&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Arrival Time&nbsp;&nbsp;		");
																																																				
																																																					out.print("</td>");
																																																				
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Travel Time&nbsp;&nbsp;		");
																																																					out.print("</td>");
																																																					
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Fare&nbsp;&nbsp;		");
																																																					out.print("</td>");
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Number of Stops&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Destination&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					
																																																					
																																																					out.print("<td>");
																																																					out.print("Origin&nbsp;&nbsp;		");
																																																					out.print("			");
																																																					out.print("</td>");
																																																					out.print("<td>");
																																																					out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																					out.print("			");
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
																																																				  			String meow=rs.getString(10); 
																																																				   			

																																																				   			
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

																																																							out.print(rs.getString(8));
																																																							out.print("</td>");
																																																							out.print("<td>");

																																																							out.print(rs.getString(9));
																																																							out.print("</td>");
																																																							out.print("<td>");
																																																							out.print(rs.getString(10));
																																																							out.print("</td>");
																																																							out.print("<td>");
																																																							out.print("</tr>");

																																																						}
																																																						out.print("</table>");

																																																						}
																																																						if (entity.equals("5"))  {

																																																				   			ResultSet rs = st.executeQuery(query23);
																																																				   			
																																																			 
																																																							
																																																							//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																							//if (rs.next() ){
																																																								//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																								//if(rs1.next()){
																																																								
																																																								//Make an HTML table to show the results in:
																																																								out.print("<table>");

																																																							//make a row
																																																							out.print("<tr>");
																																																							//make a column
																																																							out.print("<td>");
																																																							//print out column header
																																																							out.print("Train ID&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							
																																																							//make a column
																																																							out.print("<td>");
																																																							out.print("Transit Line Name&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							
																																																							//make a column
																																																							out.print("<td>");
																																																							out.print("Departure Time&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Arrival Time&nbsp;&nbsp;		");
																																																						
																																																							out.print("</td>");
																																																						
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Travel Time&nbsp;&nbsp;		");
																																																							out.print("</td>");
																																																							
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Fare&nbsp;&nbsp;		");
																																																							out.print("</td>");
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Number of Stops&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Destination&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							
																																																							
																																																							out.print("<td>");
																																																							out.print("Origin&nbsp;&nbsp;		");
																																																							out.print("			");
																																																							out.print("</td>");
																																																							out.print("<td>");
																																																							out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																							out.print("			");
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
																																																						  			 String meow=rs.getString(10);
																																																						   			

																																																						   			
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

																																																									out.print(rs.getString(8));
																																																									out.print("</td>");
																																																									out.print("<td>");

																																																									out.print(rs.getString(9));
																																																									out.print("</td>");
																																																									out.print("<td>");
																																																									out.print(rs.getString(10));
																																																									out.print("</td>");
																																																									out.print("<td>");
																																																									out.print("</tr>");

																																																								}
																																																								out.print("</table>");

																																																								}
																																																								if (entity.equals("6"))  {

																																																						   			ResultSet rs = st.executeQuery(query24);
																																																						   			
																																																					 
																																																									
																																																									//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																									//if (rs.next() ){
																																																										//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																										//if(rs1.next()){
																																																										
																																																										//Make an HTML table to show the results in:
																																																										out.print("<table>");

																																																									//make a row
																																																									out.print("<tr>");
																																																									//make a column
																																																									out.print("<td>");
																																																									//print out column header
																																																									out.print("Train ID&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									
																																																									//make a column
																																																									out.print("<td>");
																																																									out.print("Transit Line Name&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									
																																																									//make a column
																																																									out.print("<td>");
																																																									out.print("Departure Time&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Arrival Time&nbsp;&nbsp;		");
																																																								
																																																									out.print("</td>");
																																																								
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Travel Time&nbsp;&nbsp;		");
																																																									out.print("</td>");
																																																									
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Fare&nbsp;&nbsp;		");
																																																									out.print("</td>");
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Number of Stops&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Destination&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									
																																																									
																																																									out.print("<td>");
																																																									out.print("Origin&nbsp;&nbsp;		");
																																																									out.print("			");
																																																									out.print("</td>");
																																																									out.print("<td>");
																																																									out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																									out.print("			");
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
																																																								  			String meowwww= rs.getString(10);
																																																								   			

																																																								   			
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

																																																											out.print(rs.getString(8));
																																																											out.print("</td>");
																																																											out.print("<td>");

																																																											out.print(rs.getString(9));
																																																											out.print("</td>");
																																																											out.print("<td>");
																																																											out.print(rs.getString(10));
																																																											out.print("</td>");
																																																											out.print("<td>");
																																																											out.print("</tr>");

																																																										}
																																																										out.print("</table>");

																																																										}	
																																																									}
																																	
																																			
																																																									else if ((destination.equals("")) && (origin.equals(""))&& (!dateoft.equals("")))  {	if (entity.equals("1"))  {

																																																							   			ResultSet rs = st.executeQuery(query37);
																																																							   			
																																																						 
																																																										
																																																										//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																										//if (rs.next() ){
																																																											//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																											//if(rs1.next()){
																																																											
																																																											//Make an HTML table to show the results in:
																																																											out.print("<table>");

																																																										//make a row
																																																										out.print("<tr>");
																																																										//make a column
																																																										out.print("<td>");
																																																										//print out column header
																																																										out.print("Train ID&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										
																																																										//make a column
																																																										out.print("<td>");
																																																										out.print("Transit Line Name&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										
																																																										//make a column
																																																										out.print("<td>");
																																																										out.print("Departure Time&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Arrival Time&nbsp;&nbsp;		");
																																																									
																																																										out.print("</td>");
																																																									
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Travel Time&nbsp;&nbsp;		");
																																																										out.print("</td>");
																																																										
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Fare&nbsp;&nbsp;		");
																																																										out.print("</td>");
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Number of Stops&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Destination&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										
																																																										
																																																										out.print("<td>");
																																																										out.print("Origin&nbsp;&nbsp;		");
																																																										out.print("			");
																																																										out.print("</td>");
																																																										out.print("<td>");
																																																										out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																										out.print("			");
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
																																																									  			String b=rs.getString(10); 
																																																									   			

																																																									   			
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

																																																												out.print(rs.getString(8));
																																																												out.print("</td>");
																																																												out.print("<td>");

																																																												out.print(rs.getString(9));
																																																												out.print("</td>");
																																																												out.print("<td>");
																																																												out.print(rs.getString(10));
																																																												out.print("</td>");
																																																												out.print("<td>");
																																																												out.print("</tr>");

																																																											}
																																																											out.print("</table>");

																																																											}
																																																											if (entity.equals("2"))  {

																																																									   			ResultSet rs = st.executeQuery(query38);
																																																									   			
																																																								 
																																																												
																																																												//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																												//if (rs.next() ){
																																																													//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																													//if(rs1.next()){
																																																													
																																																													//Make an HTML table to show the results in:
																																																													out.print("<table>");

																																																												//make a row
																																																												out.print("<tr>");
																																																												//make a column
																																																												out.print("<td>");
																																																												//print out column header
																																																												out.print("Train ID&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												
																																																												//make a column
																																																												out.print("<td>");
																																																												out.print("Transit Line Name&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												
																																																												//make a column
																																																												out.print("<td>");
																																																												out.print("Departure Time&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Arrival Time&nbsp;&nbsp;		");
																																																											
																																																												out.print("</td>");
																																																											
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Travel Time&nbsp;&nbsp;		");
																																																												out.print("</td>");
																																																												
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Fare&nbsp;&nbsp;		");
																																																												out.print("</td>");
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Number of Stops&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Destination&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												
																																																												
																																																												out.print("<td>");
																																																												out.print("Origin&nbsp;&nbsp;		");
																																																												out.print("			");
																																																												out.print("</td>");
																																																												out.print("<td>");
																																																												out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																												out.print("			");
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
																																																											  			String b=rs.getString(10); 
																																																											   			

																																																											   			
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

																																																														out.print(rs.getString(8));
																																																														out.print("</td>");
																																																														out.print("<td>");

																																																														out.print(rs.getString(9));
																																																														out.print("</td>");
																																																														out.print("<td>");
																																																														out.print(rs.getString(10));
																																																														out.print("</td>");
																																																														out.print("<td>");
																																																														out.print("</tr>");

																																																													}
																																																													out.print("</table>");

																																																													}
																																																													if (entity.equals("3"))  {

																																																											   			ResultSet rs = st.executeQuery(query39);
																																																											   			
																																																										 
																																																														
																																																														//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																														//if (rs.next() ){
																																																															//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																															//if(rs1.next()){
																																																															
																																																															//Make an HTML table to show the results in:
																																																															out.print("<table>");

																																																														//make a row
																																																														out.print("<tr>");
																																																														//make a column
																																																														out.print("<td>");
																																																														//print out column header
																																																														out.print("Train ID&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														
																																																														//make a column
																																																														out.print("<td>");
																																																														out.print("Transit Line Name&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														
																																																														//make a column
																																																														out.print("<td>");
																																																														out.print("Departure Time&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Arrival Time&nbsp;&nbsp;		");
																																																													
																																																														out.print("</td>");
																																																													
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Travel Time&nbsp;&nbsp;		");
																																																														out.print("</td>");
																																																														
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Fare&nbsp;&nbsp;		");
																																																														out.print("</td>");
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Number of Stops&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Destination&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														
																																																														
																																																														out.print("<td>");
																																																														out.print("Origin&nbsp;&nbsp;		");
																																																														out.print("			");
																																																														out.print("</td>");
																																																														out.print("<td>");
																																																														out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																														out.print("			");
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
																																																													  			String bi =  rs.getString(10);
																																																													   			

																																																													   			
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

																																																																out.print(rs.getString(8));
																																																																out.print("</td>");
																																																																out.print("<td>");

																																																																out.print(rs.getString(9));
																																																																out.print("</td>");
																																																																out.print("<td>");
																																																																out.print(rs.getString(10));
																																																																out.print("</td>");
																																																																out.print("<td>");
																																																																out.print("</tr>");

																																																															}
																																																															out.print("</table>");

																																																															}
																																																															if (entity.equals("4"))  {

																																																													   			ResultSet rs = st.executeQuery(query40);
																																																													   			
																																																												 
																																																																
																																																																//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																																//if (rs.next() ){
																																																																	//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																																	//if(rs1.next()){
																																																																	
																																																																	//Make an HTML table to show the results in:
																																																																	out.print("<table>");

																																																																//make a row
																																																																out.print("<tr>");
																																																																//make a column
																																																																out.print("<td>");
																																																																//print out column header
																																																																out.print("Train ID&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																
																																																																//make a column
																																																																out.print("<td>");
																																																																out.print("Transit Line Name&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																
																																																																//make a column
																																																																out.print("<td>");
																																																																out.print("Departure Time&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Arrival Time&nbsp;&nbsp;		");
																																																															
																																																																out.print("</td>");
																																																															
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Travel Time&nbsp;&nbsp;		");
																																																																out.print("</td>");
																																																																
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Fare&nbsp;&nbsp;		");
																																																																out.print("</td>");
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Number of Stops&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Destination&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																
																																																																
																																																																out.print("<td>");
																																																																out.print("Origin&nbsp;&nbsp;		");
																																																																out.print("			");
																																																																out.print("</td>");
																																																																out.print("<td>");
																																																																out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																																out.print("			");
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
																																																															  			String meow=rs.getString(10); 
																																																															   			

																																																															   			
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

																																																																		out.print(rs.getString(8));
																																																																		out.print("</td>");
																																																																		out.print("<td>");

																																																																		out.print(rs.getString(9));
																																																																		out.print("</td>");
																																																																		out.print("<td>");
																																																																		out.print(rs.getString(10));
																																																																		out.print("</td>");
																																																																		out.print("<td>");
																																																																		out.print("</tr>");

																																																																	}
																																																																	out.print("</table>");

																																																																	}
																																																																	if (entity.equals("5"))  {

																																																															   			ResultSet rs = st.executeQuery(query41);
																																																															   			
																																																														 
																																																																		
																																																																		//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																																		//if (rs.next() ){
																																																																			//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																																			//if(rs1.next()){
																																																																			
																																																																			//Make an HTML table to show the results in:
																																																																			out.print("<table>");

																																																																		//make a row
																																																																		out.print("<tr>");
																																																																		//make a column
																																																																		out.print("<td>");
																																																																		//print out column header
																																																																		out.print("Train ID&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		
																																																																		//make a column
																																																																		out.print("<td>");
																																																																		out.print("Transit Line Name&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		
																																																																		//make a column
																																																																		out.print("<td>");
																																																																		out.print("Departure Time&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Arrival Time&nbsp;&nbsp;		");
																																																																	
																																																																		out.print("</td>");
																																																																	
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Travel Time&nbsp;&nbsp;		");
																																																																		out.print("</td>");
																																																																		
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Fare&nbsp;&nbsp;		");
																																																																		out.print("</td>");
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Number of Stops&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Destination&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		
																																																																		
																																																																		out.print("<td>");
																																																																		out.print("Origin&nbsp;&nbsp;		");
																																																																		out.print("			");
																																																																		out.print("</td>");
																																																																		out.print("<td>");
																																																																		out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																																		out.print("			");
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
																																																																	  			 String meow=rs.getString(10);
																																																																	   			

																																																																	   			
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

																																																																				out.print(rs.getString(8));
																																																																				out.print("</td>");
																																																																				out.print("<td>");

																																																																				out.print(rs.getString(9));
																																																																				out.print("</td>");
																																																																				out.print("<td>");
																																																																				out.print(rs.getString(10));
																																																																				out.print("</td>");
																																																																				out.print("<td>");
																																																																				out.print("</tr>");

																																																																			}
																																																																			out.print("</table>");

																																																																			}
																																																																			if (entity.equals("6"))  {

																																																																	   			ResultSet rs = st.executeQuery(query42);
																																																																	   			
																																																																 
																																																																				
																																																																				//ResultSet rs2 = st.executeQuery("select * from train_schedule where date='" +  date +  "'");
																																																																				//if (rs.next() ){
																																																																					//ResultSet rs1 = st.executeQuery("select * from train_schedule where destination='" +  destination +  "'");
																																																																					//if(rs1.next()){
																																																																					
																																																																					//Make an HTML table to show the results in:
																																																																					out.print("<table>");

																																																																				//make a row
																																																																				out.print("<tr>");
																																																																				//make a column
																																																																				out.print("<td>");
																																																																				//print out column header
																																																																				out.print("Train ID&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				
																																																																				//make a column
																																																																				out.print("<td>");
																																																																				out.print("Transit Line Name&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				
																																																																				//make a column
																																																																				out.print("<td>");
																																																																				out.print("Departure Time&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Arrival Time&nbsp;&nbsp;		");
																																																																			
																																																																				out.print("</td>");
																																																																			
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Travel Time&nbsp;&nbsp;		");
																																																																				out.print("</td>");
																																																																				
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Fare&nbsp;&nbsp;		");
																																																																				out.print("</td>");
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Number of Stops&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Destination&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				
																																																																				
																																																																				out.print("<td>");
																																																																				out.print("Origin&nbsp;&nbsp;		");
																																																																				out.print("			");
																																																																				out.print("</td>");
																																																																				out.print("<td>");
																																																																				out.print("Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
																																																																				out.print("			");
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
																																																																			  			String meowwww= rs.getString(10);
																																																																			   			

																																																																			   			
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

																																																																						out.print(rs.getString(8));
																																																																						out.print("</td>");
																																																																						out.print("<td>");

																																																																						out.print(rs.getString(9));
																																																																						out.print("</td>");
																																																																						out.print("<td>");
																																																																						out.print(rs.getString(10));
																																																																						out.print("</td>");
																																																																						out.print("<td>");
																																																																						out.print("</tr>");

																																																																					}
																																																																					out.print("</table>");

																																																																					}	
																																																																				}
																																												
																																														
																																														
									

%>






