<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
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

<%! String userdbName;
String userdbPsw;
String dbUsertype;
String userid;
%>

<%
PreparedStatement ps = null;
ResultSet rs = null;

String sql = "select * from ems where last=? and password=? and usertype=?";

String name = request.getParameter("last");
String password = request.getParameter("password");
String usertype = request.getParameter("usertype");


if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) && !usertype.equals("select"))
{

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");

ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, password);
ps.setString(3, usertype);
rs = ps.executeQuery();

if(rs.next())
{ 
userid = rs.getString("anum");	
userdbName = rs.getString("last");
userdbPsw = rs.getString("password");
dbUsertype = rs.getString("usertype");

if(name.equals(userdbName) && password.equals(userdbPsw) && usertype.equals(dbUsertype))
{
session.setAttribute("userid", userid);
session.setAttribute("name",userdbName);
session.setAttribute("usertype", dbUsertype); 

if(usertype.equals("Employee"))
{
response.sendRedirect("Employee.jsp"); 
}

if(usertype.equals("Customer"))
{
response.sendRedirect("Welcome.jsp"); 
}
} 

}

else

response.sendRedirect("error.html");
rs.close();
ps.close();
}

catch(SQLException sqe)
{
out.println(sqe);
} 

}

else
{

%>

<center><p style="color:blue">Error In Login</p></center>

<% 
getServletContext().getRequestDispatcher("/home.jsp").include(request, 
response);
}

%>

</body>
</html>