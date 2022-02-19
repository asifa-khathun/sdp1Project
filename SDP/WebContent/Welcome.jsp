<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div class="topnav">
 <a class="active" href="homepage.html" style="margin:5px;">Home</a><a class="active" href="contact.html" style="margin:5px;">Contact</a><a class="active" href="about.html" style="margin:5px;">About</a><br>
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
}
</style>
</head>
<body bgcolor="lightblue">
<form method="post" action="action.jsp">
<div class="container">
<b><p>Welcome : <font style="color:red"><%=session.getAttribute("name")%></font> 
<br> Designation : <font style="color:red"><%=session.getAttribute("usertype")%></font> 
<br> Employee Id : <font style="color:red"><%=session.getAttribute("userid")%><br></font></p></b>
<center><h2 style="color:green">BOOKING</h2></center>

<table border="1" align="center">
<tr>
<td>Name :</td>
<td><input type="text" name="last" value=<%=session.getAttribute("name")%> enable="false"/></td>
</tr>
<tr>
<td>Date of Booking:</td>
<td><input type="date" name="bdate"></td>
</tr>
<tr>
<td>Type of Booking</td>
<td><input type="text" name="booking"></td>
</tr>
<tr>
<td></td>
<td align="center"><input type="submit" value="Apply"/></td>
</table>
<%
	ResultSet rst=null;
	Statement stmt=null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
		stmt=con.createStatement();
				
		rst=stmt.executeQuery("select * from events where aid="+session.getAttribute("userid")+"");
%>

<center>
			<h2>List of Bookings</h2>
			<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<td><b>S.No</b></td>
				<td><b>Booking ID</b></td>
				<td><b>Type of Booking</b></td>
				<td><b>Booking Date</b></td>
			</tr>
			 	<%
				int no=1;
				while(rst.next()){
				%>
				<tr>
				  <td><%=no%></td>
				  <td><%=rst.getString("aid")%></td>
				  <td><%=rst.getString("booking") %></td>
				  <td><%=rst.getString("bdate")%></td>
				</tr>
				<% 	
				no++; 
				}
				rst.close();
				stmt.close();
				con.close();
%>
			</table>
			
			</center>
<%	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
	
		
%>
</div>
<div class="container signin">
<center><button type="submit" class="logoutbtn" onclick="document.location='homepage.html'">LOGOUT</button></center>
<center><button type="submit" class="logoutbtn" onclick="document.location='sample.html'">ChatBot</button></center>
<center><button type="submit" class="logoutbtn" onclick="document.location='payment.html'">Proceed to Pay</button></center>
</div>
</form>


</body>
</html>