<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

<link rel="stylesheet" type="text/css" href="styles/guestmaster.css"/>
<link rel="stylesheet" type="text/css" href="styles/style.css"/>
</head>

<body>



<div id="main">
<div id="wrapper">
	<div id="banner">
    	
    </div>
    <div id="menu">
    
    	<!-- Start css3menu.com BODY section -->
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="index.jsp" style="height:32px;line-height:32px;"><img src="styles/home.png" alt=""/>Home</a></li>
	<li class="topmenu"><a href="About.jsp" style="height:32px;line-height:32px;">About</a></li>
	
	<li class="topmenu"><a href="Contact.jsp" style="height:32px;line-height:32px;">Contact</a></li>
	
    <li class="topmenu"><a href="UserReg.jsp" style="height:32px;line-height:32px;">Sign Up</a></li>
    
    <li class="topmenu"><a href="LoginForm.jsp" style="height:32px;line-height:32px;">Sign In</a></li>
    
    
    
    
    
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="kota" -->

        	<h1>User Registration</h1>
            <p><img class="strip_img" src="images/blue_strip.jpg" width="600" height="4" /></p>
            <form id="form1" name="form1" method="post" action="UserReg1.jsp">
              <p>Name
                <input type="text" name="T1" id="T1" />
              </p>
              <p>Address
                <input type="text" name="T2" id="T2" />
              </p>
              <p>City
                <input type="text" name="T3" id="T3" />
              </p>
              <p>State
                <input type="text" name="T4" id="T4" />
              </p>
              <p>PIN
                <input type="text" name="T5" id="T5" />
              </p>
              <p>Mobile Number
                <input type="text" name="T6" id="T6" />
              </p>
              <p>Email
                <input type="text" name="T7" id="T7" />
              </p>
              <p>Password
                <input type="password" name="T8" id="T8" />
              </p>
              <p>Confirm Password
                <input type="password" name="T9" id="T9" />
              </p>
              <p>
                <input type="submit" name="B1" id="B1" value="Register Me" />
              </p>
            </form>
            <p>&nbsp;</p>
		
		<!-- InstanceEndEditable -->        
        </div><!-- end of content -->
        <div id="ad">
        	<img src="images/ad2.jpg" width="190" height="400"  />
            
        </div> <!-- end of ad div -->
    </div> <!-- End of middle -->
    <div id="bottom"></div>
</div>
</div>


</body>
<!-- InstanceEnd --></html>
