<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String tLine_name = request.getParameter("tLine_name");  
	String date = request.getParameter("date");   

	
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select * from matches WHERE tLine_name='"+tLine_name+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));");
    if(rs.next()){
    	//session.setAttribute("trainID", trainID);
    	session.setAttribute("tLine_name", tLine_name);
    	session.setAttribute("date", date);
        response.sendRedirect("reservationListDisplay.jsp");
    } 
    else{
    	out.println("empty reservations <a href = 'trainScheduleInfo.jsp'> try another </a>");
    }

%>