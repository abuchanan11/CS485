<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%@ page import="java.io.*" %> 
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<%
//String user = request.getParameter("user");
//DBentry DBentry=new DBentry();
//ResultSet nameSet = DBentry.selectStatement("SELECT FirstName FROM users WHERE username = '"+user+"';");
//String name = nameSet.getString(0);
%>
<form action="logout.jsp" method="get">
<br/>
<h1>Welcome</h1><br/><br/>
<input type="submit" value="Logout"/>
</form>

</body>
</html>