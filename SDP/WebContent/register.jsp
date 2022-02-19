<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<div class="topnav">
 <a class="active" href="homepage.html" style="margin:5px;">Home</a><a class="active" href="contact.html" style="margin:5px;">Contact</a><a class="active" href="about.html" style="margin:5px;">About</a><br>
</div>
<meta charset="ISO-8859-1">
<title>Register Employee</title>
<style>
body {
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

.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

a {
  color: dodgerblue;
}
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<%
String aid;
String first;
String last;
String password;
String type;

Statement stmt=null;
Connection con=null;

aid=request.getParameter("userid");
first=request.getParameter("first");
last=request.getParameter("last");
password=request.getParameter("password");
type=request.getParameter("usertype");



try{

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
	String sql = "insert into ems(anum,first,last,password,usertype) values ("+aid+", '"+first+"', '"+last+"', '"+password+"', '"+type+"')";
	stmt=con.createStatement();
	stmt.executeUpdate(sql);
}

catch(SQLException sqe)
{
out.println(sqe);
} 
%>
<div class="container">
<p><b>ACCOUNT SUCCESSFULLY CREATED</b></p>
<p><b>Thank you for creating account.</b></p>
</div>
<div class="container signin">
<button type="submit" class="registerbtn" onclick="document.location='home.jsp'"><b>LOGIN HERE</b></button>
</div>
</body>
</html>
