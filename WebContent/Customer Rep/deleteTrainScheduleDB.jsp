<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
	//session.setAttribute("username", username);
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
    
    String trainID = session.getAttribute("trainID").toString();  
    String tLine_name = session.getAttribute("tLine_name").toString(); 
    String date = session.getAttribute("date").toString(); 



    ResultSet rs;

	int execute_one = st.executeUpdate("DELETE FROM train_schedule WHERE trainID = '"+trainID+"' AND tLine_name = '"+tLine_name+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));");
	//int execute_two = st.executeUpdate("DELETE FROM employees WHERE username = '"+username+"';");
	//int execute_three = st.executeUpdate("DELETE FROM person WHERE username = '"+username+"';");

	response.sendRedirect("trainScheduleInfo.jsp");
    
%>