<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body{
font-family: Arial;
}
.aligncenter {
    text-align: center;
}
</style>
   <head>
      <title>Login Form for Admins and Customer Reps</title>
      <p class="aligncenter"> 
      <img src="temp4.jpg" alt="admin_pic" style="width:400px;height=400px;">
      </p>
      <h1 align='center' >Admin and Customer Rep Portal.</h1> 
   </head>
   <body>
   	<h3 align='center'>Login here!</h3>
     <form action="check_login_admin_rep.jsp" method="POST" align="center">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form> 
   </body>
</html>