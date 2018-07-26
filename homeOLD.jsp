
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.EraviewDBconnection" %>
  <%@ page import = "org.apache.log4j.Logger" %>
    <%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List"%>
	<%@page import="com.CreateXmlFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- To fetch chart data  -->
<%
	EraviewDBconnection dbConn = new EraviewDBconnection();
	java.sql.Connection conn = dbConn.getDBConnection(); 
	
	String sql="SELECT SEV.severity, Isnull(INC.count,0) "
			+ "FROM (SELECT 1 AS severity_code, 'CRITICAL' AS severity UNION SELECT 2 AS severity_code, 'HIGH' AS severity "
					+ "UNION SELECT 3 AS severity_code, 'MEDIUM' AS severity UNION SELECT 4 AS severity_code, 'LOW' AS severity) AS SEV "
					+ "LEFT JOIN (SELECT i.SEVERITY AS severity_code, count(i.INCIDENT_ID) AS count "
					+ "FROM hpsm.dbo.INCIDENTSM1 i WHERE i.CONTACT_NAME = 'AARON, JIM' AND i.CURRENT_PHASE <> 'Closure' "
					+ "GROUP BY  i.SEVERITY) AS INC ON SEV.severity_code = INC.severity_code";
	
	// Execute the query.
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery(sql);
	
	List<String> xList = new ArrayList<String>();
	List<String> yList = new ArrayList<String>();
	while(rs.next())
    {
		xList.add(rs.getString(1));
		yList.add(rs.getString(2));
    }
	System.out.println("invoking CreateSourceXml....");
	CreateXmlFile createXmlFile = new CreateXmlFile();
	createXmlFile.CreateSourceXml(xList, yList, "Number of incidents", "");
%>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title> HyphenView-Reporting </title>
    
    <!-- Included for xml charts -->     
    <script language="javascript">AC_FL_RunContent = 0;</script>
	<script language="javascript"> DetectFlashVer = 0; </script>
	<script src="../AC_RunActiveContent.js" language="javascript"></script>
	<script language="JavaScript" type="text/javascript">
		<!--
		var requiredMajorVersion = 10;
		var requiredMinorVersion = 0;
		var requiredRevision = 45;
		-->
	</script>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    


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

<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>

</head>

<body>

    <!-- <div id = "wrapper">
   

        Navigation
        <nav class="navbar navbar-default " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    
                </button>
                
                
                   <a class="pull=left" href="home.jsp">
                <img src="../Images/HyphenView_header.png">
            </a>
              </div>
            /.navbar-header
      
            <ul class="nav navbar-top-links navbar-right">
         
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-envelope fa-lg"></span> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Message 1</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Message 2</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Message 3</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    /.dropdown-messages
                </li>
                /.dropdown
                    /.dropdown-alerts
                </li>
                /.dropdown
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user fa-lg"></span> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                       
                        <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    /.dropdown-user
                </li>
                /.dropdown
            </ul>
            /.navbar-top-links

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                
                       
                        <li>
                            <a href="home.jsp"><span class="glyphicon glyphicon-home"></span><i><b> Home</b> </i></a>
                        </li>
 --> <%
final Logger LOGGER = Logger.getLogger(this.getClass());

String uname = null;
try {
	
	HttpSession session1 = request.getSession();
	
	if (session1 == null)
	{
	    response.sendRedirect("logout.jsp");	
	}
	
    uname = (String) session1.getAttribute("username");
} catch (Exception e) {
	
	LOGGER.info("Exception : " + e.getMessage());
} 
if (uname.equalsIgnoreCase(null)) {
    response.sendRedirect("logout.jsp");
} %>                             
  
    <%--                 <!-- /.dropdown-user -->
                </li>
               
                <!-- /.dropdown -->
            </ul>
                       </ul>
                       </div>
                       </div>
                     
                       </nav>
                       
                               <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                
                
                    <div class="col-lg-12">
                    <div style="background-color:#D1D0CE;">
                    <h1> Open Incidents based on severity</h1></div>
                    
                    <!-- script for chart -->
                    <script type="text/javascript">
        	<!--
				if (AC_FL_RunContent == 0 || DetectFlashVer == 0) {
					alert("This page requires AC_RunActiveContent.js.");
				} else {
					var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
					if(hasRightVersion) { 
						AC_FL_RunContent(
							'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,45,2',
							'width', '400',
							'height', '250',
							'top', '200',
							'scale', 'noscale',
							'salign', 'TL',
							'bgcolor', '#777788',
							'wmode', 'opaque',
							'movie', 'charts',
							'src', 'charts',
							'FlashVars', 'library_path=../charts_library&xml_source=../source_xmls/sourceSample.xml', 
							'id', 'my_chart',
							'name', 'my_chart',
							'menu', 'true',
							'allowFullScreen', 'true',
							'allowScriptAccess','sameDomain',
							'quality', 'high',
							'align', 'middle',
							'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
							'play', 'true',
							'devicefont', 'false'
							); 
					} else { 
						var alternateContent = 'This content requires the Adobe Flash Player. '
						+ '<u><a href=http://www.macromedia.com/go/getflash/>Get Flash</a></u>.';
						document.write(alternateContent); 
					}
				}
        		-->
			</script>
                   
                    </div>
                   
                    <!-- /.col-lg-12 -->
                         </div>
              
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


<footer class="sticky-footer">
      <jsp:include page="footer.jsp"/>
    </footer>


 --%>
 <!--Main Navigation-->

<header>

  <!-- SideNav slide-out button -->
  <a href="#" data-activates="slide-out" class="btn btn-primary p-3 button-collapse"><i class="fa fa-bars"></i></a>

  <!-- Sidebar navigation -->
  <div id="slide-out" class="side-nav fixed">
    <ul class="custom-scrollbar">
      <!-- Logo -->
      <li>
        <div class="logo-wrapper waves-light">
        	<a class="pull=left" href="home.jsp">
                <img src="../Images/HyphenView_header.png">
            </a>  
		</div>
      </li>
      <!--/. Logo -->
      
	<!-- Side navigation links --><!-- SideNav slide-out button -->
	<a href="#" data-activates="slide-out" class="btn btn-primary p-3 button-collapse"><i class="fa fa-bars"></i></a>
      <li>
        <ul class="collapsible collapsible-accordion">
         
		 <li><a class="collapsible-header waves-effect arrow-r"><i class="fa fa-eye"></i> About <i class="fa fa-angle-down rotate-icon"></i></a>
            <div class="collapsible-body">
              <ul>
                <li><a href="#" class="waves-effect">Introduction</a></li>
                <li><a href="#" class="waves-effect">Monthly meetings</a></li>
              </ul>
            </div>
          </li>
          <li><a class="collapsible-header waves-effect arrow-r"><i class="fa fa-envelope-o"></i> Contact us <i class="fa fa-angle-down rotate-icon"></i></a>
            

          </li>
        </ul>
      </li>
      <!--/. Side navigation links -->
    </ul>
  </div>
  <!--/. Sidebar navigation -->
  <script>
  // SideNav Initialization
  $(".button-collapse").sideNav();
</script>
  </header>
<!--Main Navigation-->

<!--Main layout-->
<main>

</main>
<!--Main layout-->

<!--Footer-->
<footer>

</footer>
<!--Footer-->
 </body>

<script>
$(document).ready(function () {
	
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}

});


</script>


</html>
