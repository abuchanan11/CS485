<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Call API</title>
</head>
<body>
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="db.*" %> 

<form  action="apicall.jsp" method="get">
	<center><button value="1" name="choice">Get Current Weather</button></center>
	<center><button value="2" name="choice">Finalize</button></center>
</form>

<% 
	if(request.getParameter("choice") != null && Integer.parseInt(request.getParameter("choice")) == 1)
	{
		CurrentWeather curr = new CurrentWeather();
		System.out.println(curr.condition);
		System.out.println(curr.low);
		System.out.println(curr.high);
	}

	
%>
</body>
</html>