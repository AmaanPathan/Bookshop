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
        	<h1>Add To Cart Status</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <%
String bookid=request.getParameter("bookid");
DataFunctions obj=new DataFunctions();
Class.forName(obj.getDriver());
Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());

String sql="insert into cart values(?,?,?,?,?)";
PreparedStatement p1=cn.prepareStatement(sql);
int cartid=obj.generateId("cart", 1);
int bid=Integer.parseInt(bookid);
java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());

p1.setInt(1, cartid);
p1.setInt(2, bid);
p1.setDate(3, dt);
p1.setInt(4, 0);
p1.setString(5, username);
p1.executeUpdate();

 sql="select * from books where bookid="+bookid;
    ResultSet r1=obj.fetchData(sql);
    if(r1.next())
    {
        String name,author,subject,publisher,isbn,price,book_desc,qty;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_desc=r1.getString(8);
        qty=r1.getString(9);
        //String bookid=r1.getString(1);
		%>
    
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
        <h3>Book Name : <%= name %> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Book ID : <%= bookid %>
</h3>
<p>Subject : <%= subject %></p>
        <p>Author : <%= author %></p>
        <p>Publisher : <%= publisher %></p>
        <p>ISBN : <%= isbn %></p>
        <p>Price : <%= price %></p>
        <p>Description : <%= book_desc %></p>
        <p>Quantity	:	<%= qty %></p>
        <h1>Book Added to Cart Successfully</h1>
        <p><a href="ShowBooks.jsp">Continue Shopping</a></p>
      </div>
        
        <div style="width:200px; height:auto; float:right">
        <%
		String photo=obj.getPhoto(Integer.parseInt(bookid));
                %>
                    <img src="photos/<%= photo %>" width="150" height="150" />
                <%
                
		%>
        </div>
        
        </div>
        <hr />
        <%
    }
    %>
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
