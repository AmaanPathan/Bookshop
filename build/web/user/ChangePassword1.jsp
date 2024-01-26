<%@page import="org.vgt.model.DataFunctions"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/usermaster.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>


<%
session=request.getSession(false);
if(session==null)
{
	response.sendRedirect("../AuthError.jsp");
}
String username,usertype;
username=session.getAttribute("username").toString();
usertype=session.getAttribute("role").toString();
if(usertype==null || usertype.equals("user")==false)
{
	response.sendRedirect("../AuthError.jsp");
}
%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

<link rel="stylesheet" type="text/css" href="../styles/usermaster.css"/>
<link rel="stylesheet" type="text/css" href="../styles/style.css"/>
</head>

<body><div id="main">
<div id="wrapper">
	<div id="banner"></div>
    <div id="menu">
    
    	<!-- Start css3menu.com BODY section -->
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="UserHome.jsp" style="height:32px;line-height:32px;"><img src="../styles/home.png" alt=""/>Home</a></li>
	<li class="topmenu"><a href="ShowCart.jsp" style="height:32px;line-height:32px;">My Cart</a></li>
	<li class="topmenu"><a href="ShowBooks.jsp" style="height:32px;line-height:32px;"><span>Books</span></a>
	  </li>
	<li class="topmenu"><a href="MyAccount.jsp" style="height:32px;line-height:32px;">My Account</a></li>
	<li class="topmenu"><a href="ChangePassword.jsp" style="height:32px;line-height:32px;">Change Password</a></li>
    <li class="topmenu"><a href="../Logout.jsp" style="height:32px;line-height:32px;">Logout</a></li>
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="jpr" -->
        	<h1>Password Change Status</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <%
            String oldpass,newpass;
            oldpass=request.getParameter("T1");
            newpass=request.getParameter("T2");
            DataFunctions obj=new DataFunctions();
            Class.forName(obj.getDriver());
            Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());
            String sql="update logindata set password=? where username=? and password=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1, oldpass);
            p1.setString(3, newpass);
            p1.setString(2, username);
            p1.executeUpdate();
        %>
        <h2>Password Changed Successfully</h2>
<!-- InstanceEndEditable -->
        
    	</div><!-- end of content -->
        <div id="ad">
        	
         <img src="../images/ad1.jpg" width="190" height="400"  />        
        </div> <!-- end of ad div -->
    </div> <!-- End of middle -->
    <div id="bottom"></div>
</div>
</div>

</body>
<!-- InstanceEnd --></html>
