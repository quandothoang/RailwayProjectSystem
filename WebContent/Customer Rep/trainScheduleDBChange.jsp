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
    
    
    /*
	trainID
	tLine_name
	dtae
	
	String fareS = rs1.getString(1);
	double fare = Integer.parseInt(fareS);
	*/
    String trainID = session.getAttribute("trainID").toString();  
    String tLine_name = session.getAttribute("tLine_name").toString();   
    String date = session.getAttribute("date").toString();   
    
    String timeChange = request.getParameter("dTimeChange");
    String nFare = request.getParameter("nFare");
	// dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime))
	String query = "select * from train_schedule where trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime > (select cast('"+date+"' AS datetime)) AND dTime < (select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime));";
	ResultSet rs;
	rs = st.executeQuery(query);
	while(rs.next()){
	    Statement stmt = con.createStatement();
	    Statement stmt1 = con.createStatement();
	    Statement stmt3 = con.createStatement();



		ResultSet rrr;
		ResultSet a;
		
		String origin = rs.getString("origin");
		String destination = rs.getString("destination");
		String dTime = rs.getString("dTime");
		String aTime = rs.getString("aTime");
		String sto = rs.getString("stops");
		String fr = rs.getString("fare");
		
		int stops = Integer.parseInt(sto);
		int fare = Integer.parseInt(fr);
		
    	if(!timeChange.equals("") && !nFare.equals("")){ // time change and fare
    		// fare change
    		int nFareInt = Integer.parseInt(nFare); 
    		int nFareInsert = (stops + 1) * nFareInt;
    		String query1 = "UPDATE train_schedule SET fare = "+nFareInsert+" WHERE destination = '"+destination+"' AND origin = '"+origin+"' AND trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime ='"+dTime+"'";
    		int execute_one = stmt.executeUpdate(query1);
    		
    		// time change
    		String qD = "select cast((SELECT DATE_ADD('"+dTime+"', INTERVAL "+timeChange+" MINUTE)) AS datetime);";
    		String qA = "select cast((SELECT DATE_ADD('"+aTime+"', INTERVAL "+timeChange+" MINUTE)) AS datetime);";
    		rrr = stmt3.executeQuery(qD);
    		rrr.next();
    		String ndTime = rrr.getString(1);
    		
    		rrr = stmt1.executeQuery(qA);
    		rrr.next();
    		String naTime = rrr.getString(1);
			String query12 = "UPDATE train_schedule SET dTime = '"+ndTime+"', aTime = '"+naTime+"' WHERE destination = '"+destination+"' AND origin = '"+origin+"'AND trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime = '"+dTime+"';";
			int execute_three = stmt3.executeUpdate(query12);
    		
    	} else if (timeChange.equals("") && !nFare.equals("")){ // fare only
    		int nFareInt = Integer.parseInt(nFare); 
    		int nFareInsert = (stops + 1) * nFareInt;
    		String query1 = "UPDATE train_schedule SET fare = "+nFareInsert+" WHERE destination = '"+destination+"' AND origin = '"+origin+"' AND trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime ='"+dTime+"'";
    		int execute_one = stmt.executeUpdate(query1);
    	
    	} else if(!timeChange.equals("") && nFare.equals("")){ // time change only
    		//select cast((SELECT DATE_ADD('"+date+"', INTERVAL 1 DAY)) AS datetime)
    		String qD = "select cast((SELECT DATE_ADD('"+dTime+"', INTERVAL "+timeChange+" MINUTE)) AS datetime);";
    		String qA = "select cast((SELECT DATE_ADD('"+aTime+"', INTERVAL "+timeChange+" MINUTE)) AS datetime);";
    		rrr = stmt.executeQuery(qD);
    		rrr.next();
    		String ndTime = rrr.getString(1);
    		
    		rrr = stmt1.executeQuery(qA);
    		rrr.next();
    		String naTime = rrr.getString(1);
			String query1 = "UPDATE train_schedule SET dTime = '"+ndTime+"', aTime = '"+naTime+"' WHERE destination = '"+destination+"' AND origin = '"+origin+"'AND trainID=" + trainID + " AND tLine_name='"+tLine_name+"' AND dTime = '"+dTime+"';";
			
			int execute_three = stmt.executeUpdate(query1);

    		
    	} else if(timeChange.equals("") && nFare.equals("")){
    	
    	}
	}
    //rs = st.executeQuery("select * from person where username='" + username + "'");

    	//int y = stmt.executeUpdate("insert into customer values( '" +username+ "','" +email+ "')");
    	//session.setAttribute("user", username);
    response.sendRedirect("trainScheduleInfo.jsp");
    
%>