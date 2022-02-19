<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</style>
<style>  
.searchbox {  
text-align: right;
}  
input[type=text] {  
padding: 6px;  
margin-top: 8px;  
font-size: 17px;  
border: none;  
}  
.searchbox button {  
  
padding: 8px;  
margin-top: 10px;  
margin-left: 10px;  
background: orange;  
font-size: 20px;  
border: none;  
cursor: pointer;  
}  
.searchbox button:hover {  
background: blue;  
}  
</style>  
</head>
<body bgcolor="lightblue">
<div class="searchbox"> 
<input type="text" placeholder=" Search...." name="search">   
<button type="submit" class="searchbtn" onclick="document.location='search.jsp'">Search</button> </div>
<form method="post" action="home.jsp">
<div class="container">
<b><p>Welcome : <font style="color:red"><%=session.getAttribute("name")%></font> <br> Designation : <font style="color:red"><%=session.getAttribute("usertype")%></font> <br> Employee Id : <font style="color:red"><%=session.getAttribute("userid")%><br></font></p></b>


<center><h2 style="color:green">BOOKINGS</h2></center>
<%
	ResultSet rst=null;
	Statement stmt=null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
		stmt=con.createStatement();
		rst=stmt.executeQuery("select * from events where events.aid=190031686");
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
</div>
</form>


</body>
</html>