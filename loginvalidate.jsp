<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hyphenview-Reporting</title>
<link rel="stylesheet" href="css/Style.css">
</head>
<body>
<div class="result">
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "com.EraviewDBconnection" %>
<%@ page import = "com.PasswordHashingDemo" %>
<%@ page import = "java.net.InetAddress" %>
<%@ page import = "org.apache.log4j.Logger" %>

<%
final Logger LOGGER = Logger.getLogger(this.getClass());

String emailId = request.getParameter("email");
System.out.println("email" + emailId);
session.setAttribute("emailId", emailId);
session.setAttribute("Message","");
String pwd = request.getParameter("password");
System.setProperty("java.net.preferIPv4Stack", "true");

EraviewDBconnection dbConn = new EraviewDBconnection();
java.sql.Connection conn = dbConn.getDBConnection();
PasswordHashingDemo passEncrypt = new PasswordHashingDemo();

InetAddress localhost = InetAddress.getLocalHost();
System.out.println("System IP Address : " +
              (localhost.getHostAddress()).trim());

LOGGER.info("System IP Address : " +(localhost.getHostAddress()).trim());

LOGGER.info("Login Email ID : " +emailId);
	

String decryptPass ="";

Statement stmnt = conn.createStatement();
ResultSet res = stmnt.executeQuery("select * from useraccount where emailid = '" + emailId + "'");

if(res.next()){
	
	String passwordUser = passEncrypt.dbdecrypt(pwd);
	if(res.getString(4).equals(passwordUser)){
		session.setAttribute("username", res.getString(2));
		session.setAttribute("roleId", res.getString(3));
		session.setAttribute("userId", res.getString(1));
		
		System.out.print("role Id " + session.getAttribute("roleId").toString());
		Statement stmnt2 = conn.createStatement();
		String roleid = session.getAttribute("roleId").toString();
		
		ResultSet res2 = stmnt2.executeQuery("select * from  userrole a,accessgroup b where a.groupid = b.groupid and roleid='"+roleid +"'" );

		if(res2.next())
		{
			session.setAttribute("groupId", res2.getString(3));
		
			
		}
		System.out.print("Group Id " + session.getAttribute("groupId").toString());
	
		LOGGER.info("Successfully Logged in with the " +emailId + " at "+ new java.util.Date());
		
		response.sendRedirect("Newhome.jsp");
	}else{
		session.setAttribute("Message", "Invalid login details");
		LOGGER.info("Invalid login details");
		response.sendRedirect("login.jsp");
	}
}else{
	
	session.setAttribute("Message", "Invalid user name");
	LOGGER.info("Invalid User Name");
	response.sendRedirect("login.jsp");
	}
stmnt.close();


conn.close();

%>
<p><a href="login.jsp">Login Again</a></p>
</div> 
</body>
<script>
$(document).ready(function () {
	
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}

});


</script>
</html>