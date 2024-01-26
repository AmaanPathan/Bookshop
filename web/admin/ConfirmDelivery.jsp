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
        	<h1>Confirm Delivery</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            
            <%
            DataFunctions obj=new DataFunctions();
    String sql="select * from my_orders where del_status=0";
    ResultSet r1=obj.fetchData(sql);
    
    int f=0;
    while(r1.next())
    {
        f=1;
        String name,author,subject,publisher,isbn,price,cartid;
        name=r1.getString("book_name");
        author=r1.getString("author");
        subject=r1.getString("book_subject");
        publisher=r1.getString("publisher");
        isbn=r1.getString("isbn");
        price=r1.getString("price");
        cartid=r1.getString("book_desc");
        String bookid=r1.getString("bookid");
        String orderid=r1.getString("orderid");
        String user_email=r1.getString("email");
        ResultSet ur1=obj.fetchData("select * from userdata where email='"+user_email+"'");
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
        <%
        if(ur1.next())
        {
            String uname,address,city,state,pin,mobile_no;
            uname=ur1.getString("name");
            address=ur1.getString("address");
            city=ur1.getString("city");
            state=ur1.getString("state");
            pin=ur1.getString("pin");
            mobile_no=ur1.getString("mobile_no");
            %>
            <p>
                Name : <%= uname %><br/>
                Address : <%= address %><br/>
                City : <%= city %><br/>
                State : <%= state %><br/>
                PIN : <%= pin %><br/>
                Mobile : <%= mobile_no %><br/>
                Email : <%= user_email %>
            </p>
            <%
        }
        %>
        <form method="post" action="ConfirmDelivery1.jsp">
            <input type="hidden" name="T1" value="<%= orderid %>" />
            <input type="submit" name="B1" value="Confirm" />
        </form>
      </div>
        
        <div style="width:200px; height:auto; float:right">
        <%
		String photo=obj.getPhoto(Integer.parseInt(bookid));
                %>
                    <img src="../admin/photos/<%= photo %>" width="150" height="150" />
                <%
                
		%>
        </div>
        
        </div>
        
        <%
    }
    if(f==0)
    {
        %>
        <h2>No Books in Cart Continue Shopping</h2>
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
