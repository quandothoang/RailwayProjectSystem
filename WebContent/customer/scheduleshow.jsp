<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");
    // Object Made
	ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp	
   			String dTime = request.getParameter("Time") + "";   
   			String aTime = request.getParameter("aTime") + "";
   			String tTime = request.getParameter("tTime")  + "";
   			String fare = request.getParameter("fare") + "";
   			String stops = request.getParameter("stops") + "";
   			String origin = request.getParameter("origin") + "";   
  			 String destination = request.getParameter("destination") + "";
   			String trainID = request.getParameter("trainID") + "";
   			String tLine_name = request.getParameter("tLine_name") + "";
   			String dateoft = request.getParameter ("date");
   			String stopmeow= request.getParameter("stopsS");
   			session.setAttribute("dateoft", dateoft);  
   		session.setAttribute("origin", origin);  
   		session.setAttribute("destination", destination);
   		session.setAttribute("fare", fare); 
   		ResultSet rs;
   		String query = "";
   		if (!(destination.equals("")) && (!origin.equals(""))&& (!dateoft.equals("")))  {
   		
   			String s = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"' AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime));";
   			query = s;
   			
			}
			
   		else if ((destination.equals("")) && (!origin.equals(""))&& (!dateoft.equals("")))  {
   			
   			query = "select * from train_schedule where origin='" +  origin +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime));";
   		
			}
   		if (!(destination.equals("")) && (origin.equals(""))&& (!dateoft.equals("")))  {
   			
   			query = "select * from train_schedule where destination='" +  destination +  "'  AND dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime));";
   	
			}
   		
   		
   		else if (!(destination.equals("")) && (!origin.equals(""))&& dateoft.equals(""))  {
				query = "select * from train_schedule where origin='" +  origin +  "' AND destination='"+destination+"';";}
	
   			else if(!(origin.equals("")) && destination.equals("") && dateoft.equals(""))  {
   			query = "select * from train_schedule where origin='" +  origin +  "';";
   	
			
			
			
			 
			}
			else if (!(destination.equals("")) && origin.equals("")&& dateoft.equals(""))  {
				query = "select * from train_schedule where destination='" +  destination +  "';";
	   	
				} else if((destination.equals("")) && origin.equals("")&& !dateoft.equals("")){
				 query = "select * from train_schedule where dTime > (select cast('"+dateoft+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+dateoft+"', INTERVAL 1 DAY)) AS datetime));";
				}
				rs = st.executeQuery(query);
				
				out.print("<table>");

				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//print out column header
				out.print("Train ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		");
				out.print("			");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				out.print("Transit Line Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("			");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				out.print("Departure Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Arrival Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	");
			
				out.print("</td>");
			
				
				
				out.print("<td>");
				out.print("Travel Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		");
				out.print("</td>");
				
				
				
				out.print("<td>");
				out.print("Fare&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Number of Stops&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
				out.print("			");
				out.print("</td>");
				
				
				out.print("<td>");
				out.print("Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ");
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
			  			String stopmeomeo= rs.getString(10); 
			   			

			   			
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
				 
			
			
		%>  
		
		<br>

Let's sort the results:
<br>
	<form method="get" action="schedulesort.jsp">
		<select name="sortmethod" size=1>
			<option value="1">Arrival time: ascending</option>
			<option value="2">Arrival time: descending</option>
			<option value="3">Depature time: ascending</option>
			<option value="4">Depature time: descending</option>
			<option value="5">Fare: ascending</option>
			<option value="6">Fare: descending</option>
			
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
	<div class="alert alert-primary" role="alert" align='center'> 
	<form method="get" action="customerfunction.jsp">	
		<input type="submit" value="Go back" class='form-control'>
	</form>
</div>
<br>
		
		
		
	
		
	
