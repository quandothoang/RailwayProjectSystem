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
    String password = request.getParameter("password");
    String fName = request.getParameter("fName");
    String lName = request.getParameter("lName");
    String ssn = request.getParameter("ssn");
    
    ResultSet rs;
    rs = st.executeQuery("select * from person where username='" + username + "'");
	if(rs.next()){
		out.println("Username exists already <a href = 'addCustomerRep.jsp'/a>");
	} else {
	   	int execute_one = st.executeUpdate("insert into person(username, password, fName, lName) values( '" +username+ "','" +password+ "','" +fName+ "', '" +lName+ "');");
    	int execute_two = st.executeUpdate("insert into employees(username, ssn) values('"+username+"', '"+ssn+"');");
    	int execute_three = st.executeUpdate("insert into customerRep(username) values('"+username+"');");

    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	//session.setAttribute("user", username);
        response.sendRedirect("addCustomerRep.jsp");
	}
    
%>