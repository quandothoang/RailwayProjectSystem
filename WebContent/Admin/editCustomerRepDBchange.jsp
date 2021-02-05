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
    
    String username = session.getAttribute("username").toString();   
    
    String password = request.getParameter("password");
    String fName = request.getParameter("fName");
    String lName = request.getParameter("lName");
    String ssn = request.getParameter("ssn");
    
    ResultSet rs;
    rs = st.executeQuery("select * from person where username='" + username + "'");
    if(rs.next()){
        if(!password.equals("") && !fName.equals("") && !lName.equals("") && !ssn.equals("")){ // 1 1 1 1
        	// executeUpdate UPDATE
        	String query = "UPDATE person SET password = '"+password+"', fName = '"+fName+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);


        } else if(password.equals("") && !fName.equals("") && !lName.equals("") && !ssn.equals("")) { // 0 1 1 1
        	String query = "UPDATE person SET fName = '"+fName+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(!password.equals("") && fName.equals("") && !lName.equals("") && !ssn.equals("")) { // 1 0 1 1
         	String query = "UPDATE person SET password = '"+password+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(!password.equals("") && !fName.equals("") && lName.equals("") && !ssn.equals("")){ // 1 1 0 1
        	String query = "UPDATE person SET password = '"+password+"', fName = '"+fName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(!password.equals("") && !fName.equals("") && !lName.equals("") && ssn.equals("")){ // 1 1 1 0
        	String query = "UPDATE person SET password = '"+password+"', fName = '"+fName+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(password.equals("") && fName.equals("") && !lName.equals("") && !ssn.equals("")){ // 0 0 1 1
        	String query = "UPDATE person SET lName = '"+lName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(!password.equals("") && fName.equals("") && lName.equals("") && !ssn.equals("")){ // 1 0 0 1
        	String query = "UPDATE person SET password = '"+password+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(!password.equals("") && !fName.equals("") && lName.equals("") && ssn.equals("")){ // 1 1 0 0
        	String query = "UPDATE person SET password = '"+password+"', fName = '"+fName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);

        	// no ssn
        	
        } else if(password.equals("") && !fName.equals("") && lName.equals("") && !ssn.equals("")){ // 0 1 0 1
        	String query = "UPDATE person SET fName = '"+fName+"' WHERE username = '"+username+"';";
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	int executeTwo = st.executeUpdate(query1);

        	
        } else if(password.equals("") && !fName.equals("") && !lName.equals("") && ssn.equals("")){ // 0 1 1 0
        	String query = "UPDATE person SET fName = '"+fName+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(!password.equals("") && fName.equals("") && !lName.equals("") && ssn.equals("")){ // 1 0 1 0
        	String query = "UPDATE person SET password = '"+password+"', lName = '"+lName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(!password.equals("") && fName.equals("") && lName.equals("") && ssn.equals("")){ // 1 0 0 0
        	String query = "UPDATE person SET password = '"+password+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(password.equals("") && !fName.equals("") && lName.equals("") && ssn.equals("")){ // 0 1 0 0 
        	String query = "UPDATE person SET fName = '"+fName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(password.equals("") && fName.equals("") && !lName.equals("") && ssn.equals("")){ // 0 0 1 0
        	String query = "UPDATE person SET lName = '"+lName+"' WHERE username = '"+username+"';";
        	int executeOne = st.executeUpdate(query);
        	// no ssn
        	
        } else if(password.equals("") && fName.equals("") && lName.equals("") && !ssn.equals("")){ // 0 0 0 1
        	String query1 = "UPDATE employees SET ssn = '"+ssn+"' WHERE username = '"+username+"';";		
        	int executeTwo = st.executeUpdate(query1);
        	
        } else if(password.equals("") && fName.equals("") && lName.equals("") && ssn.equals("")){ // 0 0 0 0
        	
        	// no ssn
        }	} 
    else{
    	out.println("Username does not exists already <a href = 'editCustomerRep.jsp'/a>");
    }

    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	//session.setAttribute("user", username);
        response.sendRedirect("editCustomerRep.jsp");
    
%>