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
 	/* 
 	THIS IS REGISTERING.
 	*/
	//THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT
	
	// We are using the Person parameter to obtain the username, pass, fname, lname, and email.
	String username = request.getParameter("Username");    
	String password = request.getParameter("Password");
	String fname = request.getParameter("fName");
	String lname = request.getParameter("lName");
	String email =  request.getParameter("email");

	// String url to obtain the New Railway System
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_RailwaySystem4";
    Class.forName("com.mysql.jdbc.Driver");
    // Object Made
	ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement stmt = con.createStatement();
    
	// result rs type
    ResultSet rs;
	//getting the query, selecting the table and obtaining the userid.
	// Using person table
    rs = stmt.executeQuery("select * from person where username='" + username + "'");
	// if it exists 
	// if TRUE the nit happens
    if (rs.next()) {
    	out.println("Username exists, please try another <a href='Register_Account.jsp'>try again</a>");
    } else {
    	int execute_one = stmt.executeUpdate("insert into person(username, password, fName, lName) values( '" +username+ "','" +password+ "','" +fname+ "', '" +lname+ "')");
    	int execute_two = stmt.executeUpdate("insert into customer(username, email) values('"+username+"', '"+ email +"')");
    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	session.setAttribute("user", username); // the username will be stored in the session
        response.sendRedirect("customer/index.jsp");
    	//String q1 = "insert into userid values('" +userid+ "', '" +pwd+ "')"; 	
    }
%>

</body>
</html>