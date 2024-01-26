<%@page import="org.vgt.model.DataFunctions"%>
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
        	<h1>Edit Book Status</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <%
    DataFunctions obj=new DataFunctions();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());
    String sql="update books set book_name=?,author=?,book_subject=?,publisher=?,isbn=?,price=?,book_desc=?,qty=? where bookid=?";
    
    String name,author,subject,publisher,isbn,price,book_desc,qty;
    
    name=request.getParameter("T1");
    author=request.getParameter("T2");
    subject=request.getParameter("T3");
    publisher=request.getParameter("T4");
    isbn=request.getParameter("T5");
    price=request.getParameter("T6");
    book_desc=request.getParameter("T7");
    qty=request.getParameter("T8");
    int bookid=Integer.parseInt(request.getParameter("bookid"));
    PreparedStatement p1=cn.prepareStatement(sql);
    p1.setInt(9,bookid);
    p1.setString(1, name);
    p1.setString(2, author);
    p1.setString(3, subject);
    p1.setString(4, publisher);
    p1.setString(5, isbn);
    p1.setInt(6, Integer.parseInt(price));
    p1.setString(7, book_desc);
    p1.setInt(8, Integer.parseInt(qty));
    int a=p1.executeUpdate();
    if(a==1)
    {
    %>
    <h3>Data Saved Successfully</h3>
    <%
    }
    else
    {
      %>
    <h3>Error: Unable to Update Try Again</h3>
    <p>
      <%  
    }
    %>
    </p>
    <p><a href="ManageBooks.jsp">Continue</a></p>
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
