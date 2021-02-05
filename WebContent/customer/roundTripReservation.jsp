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
 	
	//String url = "jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/New_Railsystem5";
	Class.forName("com.mysql.jdbc.Driver");
// Object Made
	ApplicationDB db = new ApplicationDB();	
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com:3306/RailwaySystem0","admin","7g3R*C+gKFG+EZ");	
	Statement stmt = con.createStatement();
/* 
 	THIS IS REGISTERING.
 	*/
	//THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT
	Statement st = con.createStatement();

	
	// We are using the Person parameter to obtain the username, pass, fname, lname, and email.
	String origin = session.getAttribute("origin").toString();    
	String destination = session.getAttribute("destination").toString();
	String username = session.getAttribute("user").toString();
	String discount = request.getParameter("discount");
	String dTime = request.getParameter("dTime");
	String RdTime = request.getParameter("RdTime");
	String queryFare = "select fare from train_schedule where origin ='"+origin+"' AND destination = '"+destination+"' AND dTime = '"+dTime+"'";
	String queryFareR = "select fare from train_schedule where origin ='"+destination+"' AND destination = '"+origin+"' AND dTime = '"+RdTime+"'";

	ResultSet rs1;
	rs1 = st.executeQuery(queryFare);
	rs1.next();
	String fareS = rs1.getString(1);
	double fare = Integer.parseInt(fareS);
	
	ResultSet rs20;
	rs20 = st.executeQuery(queryFare);
	rs20.next();
	String fareSR = rs20.getString(1);
	double fareR = Integer.parseInt(fareS);
	
	if(discount.equals("child")){ // child
		fare = 0.75 * fare;
		fareR = 0.75 * fareR;
	} else if(discount.equals("disabled")){
		fare = 0.5 * fare;
		fareR = 0.5 * fareR;
	} else if(discount.equals("senior")){
		fare = 0.65 * fare;
		fareR = 0.65 * fareR;

	}

	// String url to obtain the New Railway System
	String currentDateQuery = "select CURRENT_TIMESTAMP AS current_date_time;";
	rs1 = st.executeQuery(currentDateQuery);
	rs1.next();
	String currentDate = rs1.getString(1);
    
	// passenger name
	String pNameQuery = "select fName, lName from person where username ='" +username+ "';";
	rs1 = st.executeQuery(pNameQuery);
	rs1.next();
	String name = rs1.getString(1) + " " + rs1.getString(2);
	
	// result rs type
    //if (rs.next()) {
    	//out.println("Username exists, please try another <a href='Register_Account.jsp'>try again</a>");
    //} 
    ResultSet rs;
    int execute_one = stmt.executeUpdate("insert into reservation(dateReserve, totalFare, passenger) values( '"+ currentDate +"','"+ fare +"','"+ name +"')");
    String cResNum = "select MAX(reservationNum) from reservation;";
    rs = st.executeQuery(cResNum);
    rs.next();
   	String cResNumString = rs.getString(1);
    int cResNumInt = Integer.parseInt(cResNumString);
    int execute_two = stmt.executeUpdate("insert into reserves(reservationNum, username) values( "+cResNumInt+",'" +username+"')");
				
    // trainID & tLine_name
    ResultSet rs3;
    String query69 = "select trainID, tLine_name from train_schedule where origin='"+origin+"' AND destination= '"+destination+"'AND dTime='"+dTime+"'";
    //String query70 = "select trainID, tLine_name from train_schedule where origin='"+origin+"' AND destination= '"+destination+"'AND dTime='"+RdTime+"'";
    rs3 = st.executeQuery(query69);
    rs3.next();
    String trainID = rs3.getString(1);
    String tLine_name = rs3.getString(2);
    int execute_three = stmt.executeUpdate("insert into matches(reservationNum,trainID, tLine_name, origin, destination, dTime) values( "+cResNumInt+","+trainID+",'" +tLine_name+ "', '" +origin+"', '"+destination+"', '"+dTime+"');");		
    			
    			
    			
    // return trip insert
   	ResultSet rs4, rs33;
    int execute_four = stmt.executeUpdate("insert into reservation(dateReserve, totalFare, passenger) values( '"+ currentDate +"','"+ fareR +"','"+ name +"')");
    String cResNumR = "select MAX(reservationNum) from reservation;";
    rs33 = st.executeQuery(cResNumR);
    rs33.next();
   	String cResNumRString = rs33.getString(1);
    int cResNumRInt = Integer.parseInt(cResNumRString);
    int execute_five = stmt.executeUpdate("insert into reserves(reservationNum, username) values( "+cResNumRInt+",'"+username+"')");
    String query70 = "select trainID, tLine_name from train_schedule where origin='"+destination+"' AND destination= '"+origin+"'AND dTime='"+RdTime+"'";
    rs4 = st.executeQuery(query70);
    rs4.next();
    String trainIDR = rs4.getString(1);
    String tLine_nameR = rs4.getString(2);
    int execute_six = stmt.executeUpdate("insert into matches(reservationNum, trainID, tLine_name, origin, destination, dTime) values("+cResNumRInt+", "+trainIDR+",'" +tLine_nameR+ "', '" +destination+"', '"+origin+"', '"+RdTime+"')");				
   
    response.sendRedirect("myReservations.jsp");

%>

</body>
</html>