<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
	String trainID = request.getParameter("trainID");
	String tLine_name = request.getParameter("tLine_name");
	if(tLine_name.length() > 20) tLine_name = tLine_name.substring(0, 20);
	String date = request.getParameter("date");


    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin", "7g3R*C+gKFG+EZ");
    Statement st = con.createStatement();
    
    //String trainID = session.getAttribute("trainID").toString();  
    //String tLine_name = session.getAttribute("tLine_name").toString();   
    //String date = session.getAttribute("date").toString();   

    ResultSet rs;
    rs = st.executeQuery("select * from train_schedule where trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));");
    if(rs.next()){
    	session.setAttribute("trainID", trainID);
    	session.setAttribute("tLine_name", tLine_name);
    	session.setAttribute("date", date);
        response.sendRedirect("trainScheduleEdit.jsp");
    } 
    else{
    	out.println("transit line does not exists <a href = 'trainScheduleInfo.jsp'> try again </a>");
    }

    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	//session.setAttribute("user", username    
%>