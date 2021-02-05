<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
	
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
    ResultSet rs;
	ResultSet rs1;
	ResultSet rs2; 
	ResultSet rs3;


    rs = st.executeQuery("select username from customerRep where username='" +  username +  "'");
   	//rs1 = st.executeQuery("select password from person where username='" +  username +  "'"); 
   	//rs2 = st.executeQuery("select username from customerRep where username= '" +username+"'");
   	if (rs.next()){    
   		session.setAttribute("username", username);
        response.sendRedirect("editCustomerRepDB.jsp");
    } else {
        out.println("Invalid username <a href='editCustomerRep.jsp'>try again</a>");
    }

%>