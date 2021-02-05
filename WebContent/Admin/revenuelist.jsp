<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %> 
<p style="float: right;"><a href="AdminLogout.jsp">Log out</a></p>

<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");

   // ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	ResultSet rs1;
	String tlinenamemeow  = request.getParameter("tlinenamemeow");
	String cusnamemeow  = request.getParameter("cusnamemeow");
	
	if (!(tlinenamemeow.equals("")) && cusnamemeow.equals("")){
		
		rs1 = st.executeQuery("SELECT tS.tLine_name as 'Transit Line', SUM(r.totalFare) as Revenue FROM train_schedule tS, matches m, reservation r WHERE tS.tLine_name = m.tLine_name AND tS.trainID = m.trainID AND tS.destination = m.destination AND tS.origin = m.origin AND tS.dTime = m.dTime AND m.reservationNum = r.reservationNum GROUP BY tS.tLine_name; ");	
	
	out.println("Revenue made by " + tlinenamemeow + " is:");
	 
	while(rs1.next()){
		out.println("$"+ rs1.getString("Revenue"));
		   
		  
	
	}}
if (tlinenamemeow.equals("") && (!cusnamemeow.equals(""))){
		
		rs1 = st.executeQuery("SELECT r.passenger as 'Passenger', SUM(r.totalFare) as Revenue FROM reservation r WHERE r.passenger = '"+cusnamemeow+"' GROUP BY r.passenger;");	
	
	out.println("Reservations made by " + cusnamemeow + " are:");
	 
	while(rs1.next()){
		out.println("$"+ rs1.getString("Revenue"));
	}}
	%>
	<br>
	
</body>
</html>