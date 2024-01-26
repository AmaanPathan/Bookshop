<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/adminmaster.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
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
            if(usertype==null || usertype.equals("admin")==false)
            {
                    response.sendRedirect("../AuthError.jsp");
            }
        %>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable --><link rel="stylesheet" type="text/css" href="../styles/adminmaster.css"/>
<link rel="stylesheet" type="text/css" href="../styles/style.css"/>
</head>

<body><div id="main">
<div id="wrapper">
	<div id="banner"></div>
    <div id="menu">
    
    	<!-- Start css3menu.com BODY section -->
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="AdminHome.jsp" style="height:32px;line-height:32px;"><img src="../styles/home.png" alt=""/>Home</a></li>
	
	
	<li class="topmenu"><a href="BookUpload.jsp" style="height:32px;line-height:32px;">Add Book</a></li>
	<li class="topmenu"><a href="ManageBooks.jsp" style="height:32px;line-height:32px;">Manage Books</a></li>
    <li class="topmenu"><a href="ConfirmDelivery.jsp" style="height:32px;line-height:32px;">Confirm Orders</a></li>
    
    
    <li class="topmenu"><a href="ChangePassword.jsp" style="height:32px;line-height:32px;">Change Password</a></li>
    
    <li class="topmenu"><a href="../Logout.jsp" style="height:32px;line-height:32px;">Logout</a></li>
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="jpr" -->
        	<h1>Add New Book</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <form id="form1" name="form1" method="post" action="BookUpload1.jsp">
              <p>Name
                <label for="T1"></label>
                <input type="text" name="T1" id="T1" />
              </p>
              <p>Author
                <label for="T2"></label>
                <input type="text" name="T2" id="T2" />
              </p>
              <p>Subject
                <label for="T3"></label>
                <input type="text" name="T3" id="T3" />
              </p>
              <p>Publisher
                <label for="T4"></label>
                <input type="text" name="T4" id="T4" />
              </p>
              <p>ISBN
                <label for="T5"></label>
                <input type="text" name="T5" id="T5" />
              </p>
              <p>Unit Price
                <label for="T7"></label>
                <input type="text" name="T6" id="T7" />
              </p>
              <p>Description
                <label for="T8"></label>
                <textarea name="T7" cols="60" rows="5" id="T8"></textarea>
              </p>
              <p>Quantity
                <label for="T9"></label>
                <input type="text" name="T8" id="T9" />
              </p>
              <p>
                <input type="submit" name="B1" id="B1" value="Submit" />
              </p>
            </form>
            <p>&nbsp;</p>
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
