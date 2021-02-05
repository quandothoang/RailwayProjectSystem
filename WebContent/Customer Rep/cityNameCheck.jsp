<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String cityName = request.getParameter("cityName");  


	
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select * from train_schedule where origin='" + cityName + "' OR destination='"+cityName+"';");
    if(rs.next()){
    	session.setAttribute("cityName", cityName);
        response.sendRedirect("cityNameDB.jsp");
    } 
    else{
    	out.println("city does not exists in the database <a href = 'trainScheduleInfo.jsp'> try another </a>");
    }

%>