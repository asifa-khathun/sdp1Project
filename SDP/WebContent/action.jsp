<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div class="topnav">
 <a class="active" href="homepage.html" style="margin:10px;">Home</a><a class="active" href="contact.html" style="margin:10px;">Contact</a><a class="active" href="about.html" style="margin:10px;">About</a><br>
</div>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
<style>
body
{
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.logoutbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.logoutbtn:hover {
  opacity: 1;
}
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
.topnav a:hover {
  background-color: white;
  overflow: hidden;
}

.topnav a:hover {
  background-color: white;
  color: black;
}

.topnav a.active {
  background-color: black;
  color: blue;
</style>
</head>
<div class="container">
<body>


<%
String empid;
String booking;
Statement stmt=null;
empid=session.getAttribute("userid").toString();
booking=request.getParameter("booking");
String bdate = request.getParameter("bdate");
if(!(booking.equals(null) || booking.equals("")) && !(bdate.equals(null) || bdate.equals("")))
{
try{
	%>
	<p>Type of Booking : <%=request.getParameter("booking")%>  
<br>Booking Date <%=request.getParameter("bdate")%> 
<br>Customer Id : <%=session.getAttribute("userid") %>
	
	<%

	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
	stmt=con.createStatement();
	stmt.executeUpdate("insert into events(aid,booking,bdate) values ("+empid+", '"+booking+"','"+bdate+"')");
	System.out.println("Booking done successfully !!!");
}

catch(SQLException sqe)
{
out.println(sqe);
} 
}
%>

<p>
<button type="submit" class="logoutbtn" onclick="document.location='sample.html'"><b>ChatBot</b></button>
<button type="submit" class="logoutbtn" onclick="document.location='payment.html'"><b>Proceed to Pay</b></button>
<button type="submit" class="logoutbtn" onclick="document.location='Welcome.jsp'"><b>Return to your account?</b></button>
<button type="submit" class="logoutbtn" onclick="document.location='homepage.html'"><b>LOGOUT</b></button>
</div>
</body>
</html>