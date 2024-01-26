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

<link rel="stylesheet" type="text/css" href="../styles/admin_links.css"/>

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
        	<h1>All Books</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />

<%
    DataFunctions obj=new DataFunctions();
    String sql="select * from books";
    
    ResultSet r1=obj.fetchData(sql);
    while(r1.next())
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
        String bookid=r1.getString(1);
		%>
    
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
        <h3 class="heading3_style"><%= name %> 
        &nbsp;&nbsp [<%= bookid %>]
</h3>
<p style="margin-top:0px;">
		Subject : <span style="color:#f00;"><%= subject %></span> <br />
        Author : <span style="color:#00F;"><%= author %></span><br />
        Publisher : <%= publisher %><br />
        ISBN : <%= isbn %><br />
        Price : <span style="color:#F0F; font-weight:bold;"><%= price %></span><br />
        Description : <span style="color:#0c0;"><%= book_desc %></span><br />
        Quantity	:	<%= qty %><br /><br />

        <a class="link_style1" href="EditBook.jsp?bookid=<%= bookid %>">EDIT</a> <a class="link_style1" href="AddBooks.jsp?bookid=<%= bookid %>">Add Books</a> <a class="link_style1" href="RemoveBook.jsp?bookid=<%= bookid %>">Remove</a></p>
        </div>
        
        <div style="width:200px; height:auto; float:right">
        <%
		String photo=obj.getPhoto(Integer.parseInt(bookid));
                if(photo.equalsIgnoreCase("nophoto"))
                {
                    %>
        			<form method="post" enctype="multipart/form-data" action="UploadPhoto.jsp?bookid=<%= bookid %>" >
        			  <p>Photo 
        			    <label for="F1"></label>
        			<input type="file" name="F1" id="F1" />
        			  </p>
        			  <p>
        			    <input type="submit" name="B1" id="B1" value="Upload Photo" />
                      </p>
        			</form>
                    <%
                }
                else
                {
                    %>
                    <img src="photos/<%= photo %>" width="150" height="150" />
                <%
                }
		%>
        </div>
        
        </div>
       
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
