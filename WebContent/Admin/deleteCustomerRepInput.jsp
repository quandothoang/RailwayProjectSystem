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
    
    String username = request.getParameter("username");   

    ResultSet rs;
    rs = st.executeQuery("select * from person where username='" + username + "'");
	if(!rs.next()){
		out.println("Username does not exists <a href = 'addCustomerRep.jsp'/a>");
	} else {
		// proper
	   	//int execute_one = st.executeUpdate("DELETE FROM person(username) WHERE person = '"+username+"';");

		// 
		int execute_one = st.executeUpdate("DELETE FROM customerRep WHERE username = '"+username+"';");
		int execute_two = st.executeUpdate("DELETE FROM employees WHERE username = '"+username+"';");
		int execute_three = st.executeUpdate("DELETE FROM person WHERE username = '"+username+"';");

		response.sendRedirect("deleteCustomerRep.jsp");
	}
    
%>