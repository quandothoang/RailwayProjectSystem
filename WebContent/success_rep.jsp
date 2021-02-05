<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login_admin_customer_rep.jsp">Please Login</a>
<%} else {
%>
<style>
body{
font-family: Arial;
}
.aligncenter {
    text-align: center;
}
</style>
<p class="aligncenter"> 
      <img src="temp3.jpg" alt="Mountain" style="width:400px;height=400px;">
      </p>
<h1 align = 'center'> Welcome <%=session.getAttribute("user")%>. REPPPPPPPPPPPPPP ONLY. We hope you enjoy your trip! </h1>
<br>
<br> 
Done with your session? Log out here:
<a href='logout_customer.jsp' align="center">Log out</a>
<%
    }
%>