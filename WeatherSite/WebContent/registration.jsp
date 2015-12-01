<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%@ page import="java.io.*" %> 
<%@ page import="db.*" %>

<form action="registration.jsp" method="get">
Register your account with us <br/><br/>

Username: <input type="text" name="user" id="user"/><br/>
Password: <input type="text" name="password" id="password"/><br/>
First Name: <input type="text" name="FName" id="FName"/><br/>
Last Name: <input type="text" name="LName" id="LName"/><br/>
<input type="submit" Value="Submit" ></input>
</form>
<%
String user=request.getParameter("user");
String pass=request.getParameter("password");
String FirstName=request.getParameter("FName");
String LastName=request.getParameter("LName");
if (user!= null&&!user.trim().equals("")){
	DBentry DBentry=new DBentry();
	boolean flag=DBentry.newUser(user, pass, FirstName, LastName);
	if(flag) {
		%><script type="text/javascript">window.location.replace("welcome.jsp");</script><%
	}
	else { 
		%><script type="text/javascript">window.location.replace("registration.jsp");</script><%
		
	}
}

 %>
</body>
</html>