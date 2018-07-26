<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Hyphenview-Reporting</title>
       <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
       <link href="../vendor/bootstrap/css/customlogin.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="../vendor/font-awesome/css/font-awesome-custom.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

        <form name="form" role="form" action ="forgotpass.jsp" onsubmit="return validation()" method="post">
            
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    
                     <div><center>
                  <img src="../Images/HyphenView_small.png"></center>
                  </div>
                    
                    <div class="panel-title" >
                        <h3  class="d-block"><b><i><center>Forgot your Password ? </center></i></b>
                        </h3>
                    </div>
                      <div class="panel-body">
                      <% String messageid= request.getParameter("id");
                      		if (messageid.equalsIgnoreCase("1"))
                      		{
                      			session.setAttribute("Message", "");
                      		}
							                      
                      %>
               <div class="form-group has-success">
       <b  class="d-block"> <i>${Message} </i></b>
      </div> 
              
                      
          <p class="d-block" >Enter your email address and we will send you instructions on how to reset your password.</p>
        </div><fieldset>
          <div class="form-group">
            <input class="form-control" name="email" id="email" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Enter email address">
          </div>
          <input type="submit" class="btn btn-lg  btn-block" value="Reset Password">
                                
          </fieldset>
        </form>
                <div class="text-center">
                
               
         
          <a class="d-block" href="login.jsp"><br>Login Page</a><br><br><br>
        </div>
        
        </div>
        
      </div>
    </div>
  </div>
     <footer class="footer">
  <p class="copyright"> <b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Copyrights 2018 </b></p>
  <p class="footerimage"> <img src="../Images/footer_image_hyphen.png">&nbsp;&nbsp;&nbsp;&nbsp;</p>
  
    </footer>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>


<script >

function validation()
{	
	var email = document.form.email.value;
	if(email=="")
	{
	alert("Please Enter Email");
	document.form.email.focus();
	return false;
	}
    return true;

}

</script>
</body>
<script>
$(document).ready(function () {
	
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}

});


</script>


</html>
