 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
 <%@ page import = "javax.sql.*" %>            
 <%@ page import = "java.sql.*" %>
 <%@ page import = "javax.naming.*" %>
   
<%@ page import = "com.EraviewDBconnection" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hyphenview Reporting</title>
  
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/bootstrap/css/customlogin.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
 
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
             
                  <div><center>
                  <img src="../Images/HyphenView_small.png"></center>
                  </div>
                    <div class="panel-body">
                        <form name="form" role="form" action ="loginvalidate.jsp" onsubmit="return validation()" method="post">
                            
                            <div class="d-block">
      <h4> ${Message}<br></h4>
      </div> 
                            
                            
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                  <input type="submit" class="btn btn-lg btn-block" value="Login">
                                
                                
                            </fieldset>
                        </form>
                        <div class="text-center">
          
          <a class="d-block" href="forgot-password.jsp?id=1"><br>Forgot Password?</a><br><br><br>
               
       		 </div>
       		 
       		     </div>
                
                
                </div>
               
            </div>
        </div>
        
    </div>
     <footer class="footer">
  <p class="copyright"> <b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Copyrights 2018 </b></p>
  <p class="footerimage"> <img src="../Images/footer_image_hyphen.png">&nbsp;&nbsp;&nbsp;&nbsp;</p>
  
    </footer>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
<script>

function validation()
{
	
	var email = document.form.email.value;
	if(email=="")
	{
	alert("Please Enter Email");
	document.form.email.focus();
	return false;
	}
	var pass = document.form.password.value;
	if(pass=="")
	{
	alert("Please Enter Password");
	document.form.password.focus();
	return false;
	}
	
return true;

}

</script>


</body>
<script type="text/javascript">
$(document).ready(function () {
	
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}

});

</script>

</html>
