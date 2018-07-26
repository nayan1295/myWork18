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
<%@ page import = "com.*" %>
<%
String emailId = request.getParameter("email");
System.out.println("email" + emailId);
session.setAttribute("emailId", emailId);
System.setProperty("java.net.preferIPv4Stack", "true");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

EraviewDBconnection dbConn = new EraviewDBconnection();
java.sql.Connection conn = dbConn.getDBConnection();
PasswordHashingDemo passEncrypt = new PasswordHashingDemo();

String resetEncrypt = passEncrypt.dbencrypt("system123");

Statement stmnt = conn.createStatement();
ResultSet res = stmnt.executeQuery("select * from useraccount where emailid = '" + emailId + "'");
String userid;
if(res.next()){
	
	  userid= res.getString(1);
		System.out.print("userid" + userid);
		PreparedStatement stmnt2 = conn.prepareStatement("update useraccount set userpassword=? where userid='"+userid + "'");
		
		stmnt2.setString(1, resetEncrypt);
		int i =stmnt2.executeUpdate();
		
		 
		if (i > 0)

		{
			
			SendEmailOffice365 mail = new SendEmailOffice365();
			mail.sendEmailResetPass("system123",emailId );
			session.setAttribute("Message", "Mail sent to user");
			response.sendRedirect("forgot-password.jsp?id=0");
		}
		else
		{
			session.setAttribute("Message", "Invalid User");
			response.sendRedirect("forgot-password.jsp?id=0");	
		}
}

else
{
	session.setAttribute("Message", "Invalid Email-id");
	response.sendRedirect("forgot-password.jsp?id=0");
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