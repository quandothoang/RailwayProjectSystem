<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String questionID = request.getParameter("questionID");  
	String answer = request.getParameter("answer");   

	
	//session.setAttribute("password", password); 
	//myStorage = window.sessionStorage;
	//sessionStorage.setItem("username", username);
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select * from question_table where questionID="+ questionID +";");
    if(rs.next()){
    	
    	session.setAttribute("questionID", questionID);
    	session.setAttribute("answer", answer);
        response.sendRedirect("answerInputDB.jsp");
    } 
    else{
    	out.println("Question ID invalid <a href = 'FAQ.jsp'> try another </a>");
    }

%>