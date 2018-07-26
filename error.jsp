<%@ page language="java" contentType="text/html; charset=UTF-8"
    isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hyphenview-Reporting</title>
</head>
<body>
<h2>

<% if (exception.getClass().getName().equalsIgnoreCase("java.lang.NullPointerException")) 
{
    session.setAttribute("Message", "Your Session has Expired.");
	response.sendRedirect("login.jsp");
      } else { %>
     
      Error: <%= exception.getClass().getName() %> <% } %>
</h2>
</body>
</html>