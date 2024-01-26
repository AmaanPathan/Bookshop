<%@page import="org.vgt.model.DataFunctions"%>
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

        	<h1>Registration Status</h1>
            <p><img class="strip_img" src="images/blue_strip.jpg" width="600" height="4" />
              <%
                    String name,address,city,state,pin,mobile,email,password;
                    name=request.getParameter("T1");
                    address=request.getParameter("T2");
                    city=request.getParameter("T3");
                    state=request.getParameter("T4");
                    pin=request.getParameter("T5");
                    mobile=request.getParameter("T6");
                    email=request.getParameter("T7");
                    password=request.getParameter("T8");
                    DataFunctions obj=new DataFunctions();
                    Class.forName(obj.getDriver());
                    Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());

                    String sql="insert into userdata values(?,?,?,?,?,?,?)";
                    String sql1="insert into logindata values(?,?,?)";
                    
                    PreparedStatement p1=cn.prepareStatement(sql);
                    PreparedStatement p2=cn.prepareStatement(sql1);
                    
                    p1.setString(1, name);
                    p1.setString(2, address);
                    p1.setString(3, city);
                    p1.setString(4, state);
                    p1.setString(5, pin);
                    p1.setString(6, mobile);
                    p1.setString(7, email);
                    
                    p2.setString(1, email);
                    p2.setString(2, password);
                    p2.setString(3, "user");
                    
                    p1.executeUpdate();
                    p2.executeUpdate();
                    
                    cn.close();
                    p1.close();
                    p2.close();
		%>
            </p>
            <p>Registration Completed Successfully</p>
            <p>&nbsp;</p>
            <p><a href="LoginForm.jsp">Go To Login</a></p>
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
