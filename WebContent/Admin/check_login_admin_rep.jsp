<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
    ResultSet rs;
   	ResultSet rs1;
   	ResultSet rs2;
   	ResultSet rs3;
    // if this is true then the person is an Admin 
    rs = st.executeQuery("select username from admin where username='" +  username +  "'");
    // if this is true then the person is a customerRep
 	if(rs.next()){    
   		rs1 = st.executeQuery("select password from person where username='" +  username +  "' AND password='"+password+"'"); 
    	if(rs1.next()){	
    		if(((password.length() == 0 ) || !(password == null))){
        		session.setAttribute("user", username); // the username will be stored in the session
        		out.println("welcome " + username);
        		out.println("<a href='logout_admin.jsp'>Log out</a>");
        		response.sendRedirect("index.jsp");	
    		}
    	}else{
    		out.println("<h1 align='center'> Invalid password please <a href='../login.jsp'>try again.</a> </h1>");
    	}
    }
    /* 
 	else if(!rs.next()){
    	rs2 = st.executeQuery("select username from customerRep where username='" +  username +  "'");
    	if(rs2.next()){
    		rs3 =st.executeQuery("select password from person where username='" +  username +  "' AND password='"+password+"'"); 
    		if(rs3.next()){
    			if(((password.length() == 0 ) || !(password == null))){
        			session.setAttribute("user", username); // the username will be stored in the session
        			out.println("welcome " + username);
        			out.println("<a href='logout_customer.jsp'>Log out</a>");
        			response.sendRedirect("success_rep.jsp");	
    			}
    		}
    	}else{
    		out.println("Invalid password <a href='WebContent/login.jsp'>try again</a>");	
    	}
    } 
    */
    /* Goes Back a directory */
    else {
    	out.println("<h1 align='center'> Invalid password please <a href='../login.jsp'>try again.</a> </h1>");
    } 
 
 
%>