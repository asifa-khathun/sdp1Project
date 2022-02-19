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
<div class="topnav">
 <a class="active" href="homepage.html" style="margin:10px;">Home</a><a class="active" href="contact.html" style="margin:10px;">Contact</a><a class="active" href="about.html" style="margin:10px;">About</a><br>
</div>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style>
         body {
            background-image: url("ls2.jpg");
	    background-repeat: no repeat;
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
  background-color: pink;
  color: black;
}
</style>

</head>
<body bgcolor="lightblue">


<%
PreparedStatement ps = null;
try {

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
String vsql="select distinct usertype from ems";
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(vsql);
%>

<form method="post" action="login.jsp">


<br>
<br>
<br>
<center><h1 style="color:black"><b></b>WELCOME TO OUR WEBSITE</b></h2></center>

<table border="1" align="center" >
<br>

<br>
<tr>
<td colspan=4> <centre><img src="l.png"  width="350" height="250"></centre>
</td>
</tr>
<tr>
<td>Enter Your Name :</td>
<td><input type="text" name="last"/></td>
</tr>
<tr>
<td>Enter Your Password :</td>
<td><input type="password" name="password"/></td>
</tr>
<tr>
<td>Select UserType</td>
<td><select name="usertype">
<option value="select">select</option>
<%
while(rs.next())
{
%>

<option value=<%=rs.getString("usertype")%>><%=rs.getString("usertype")%></option>

<% 

}
}

catch(SQLException sqe)
{
out.println("home"+sqe);
}
%>

</select>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="submit"/></td>
</tr>
<tr>
	<td colspan=2 align=center><a href="register.html">New User</a></td>
</tr>
</table>
</form>


</body>
</html>