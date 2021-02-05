<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
 	
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem1";
	Class.forName("com.mysql.jdbc.Driver");
// Object Made
	ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement stmt = con.createStatement();
	Statement st = con.createStatement();

	/* 
 	THIS IS DELETING RESERVATION
 	*/
	//THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT
	// DELETE FROM table_name WHERE condition;
	String reservationNumber = request.getParameter("reservationNumber");
	int resNum = Integer.parseInt(reservationNumber);
	//String queryReserves = "DELECT FROM reserves WHERE reservationNum = "+reservationNumber+";";
	//String queryMatches = "DELECT FROM matches WHERE reservationNum = "+reservationNumber+";";
	String queryReservation = "DELETE FROM reservation WHERE reservationNum = "+reservationNumber+";";
	ResultSet rs1;
	ResultSet rs2;
	ResultSet rs3;
	//int a = st.executeUpdate(queryReserves);
	//int b = st.executeUpdate(queryMatches);
	int c = st.executeUpdate(queryReservation);

    response.sendRedirect("myReservations.jsp");

%>

</body>
</html>