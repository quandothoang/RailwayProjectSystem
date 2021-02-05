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
<br>
	<form method="get" action="adminfunctions.jsp">
	
		<input type="submit" value="< Back">
	</form>

<br>
<%
	
			//Get the database connection
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");

   // ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement st = con.createStatement();
	ResultSet rs1;
	String tlinename  = request.getParameter("tlinename");
	String cusname  = request.getParameter("cusname");
	
	if (!(tlinename.equals("")) && cusname.equals("")){
		
		rs1 = st.executeQuery("SELECT r.reservationNum, r.passenger FROM matches m, reservation r WHERE r.reservationNum = m.reservationNum AND m.tLine_name = '"+ tlinename  +"'; ");	
	
	out.println("Reservations made by " + tlinename + " are:");
	 
	while(rs1.next()){
		   out.println(rs1.getString("reservationNum"));
		   
		   out.println(rs1.getString("passenger"));
	
	}}
if (tlinename.equals("") && (!cusname.equals(""))){
		
		rs1 = st.executeQuery("SELECT r.reservationNum, r.passenger FROM matches m, reservation r WHERE r.reservationNum = m.reservationNum AND r.passenger = '"+ cusname  +"'; ");	
	
	out.println("Reservations made by " + cusname + " are:");
	 
	while(rs1.next()){
		   out.println(rs1.getString("reservationNum"));
		   
		   out.println(rs1.getString("passenger"));
	
	}}
	%>
	<br>
	
</body>
</html>