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
        	<h1>My Shoppings</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <%
    DataFunctions obj=new DataFunctions();
    String sql="select * from my_orders where email='"+username+"'";
    ResultSet r1=obj.fetchData(sql);
	int f=0;
    while(r1.next())
    {
		f=1;
        String name,author,subject,publisher,isbn,price,book_desc;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_desc=r1.getString(8);
        //qty=r1.getString(9);
        String bookid=r1.getString(1);
        String photo=obj.getPhoto(Integer.parseInt(bookid));
        
        String orderid,del_date,del_status,order_date;
        orderid=r1.getString(9);
        order_date=r1.getString(10);
        del_date=r1.getString(11);
        del_status=r1.getString(12);
        int ds=Integer.parseInt(del_status);
		%>
    
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
        <h3>Book Name : <%= name %> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Book ID : <%= bookid %>
        </h3>
    <p>Subject : <%= subject %><br />
        Author : <%= author %><br />
        Publisher : <%= publisher %><br />
        ISBN : <%= isbn %><br />
        Price : <%= price %><br />
        Description : <%= book_desc %>
    </p>
        <p>
            Order Id : <%= orderid %><br />
            Order Date : <%= order_date %><br />
            Delivery Date : <% if(del_date==null) out.println("Not Delivered"); else out.println(del_date); %><br />
            Delivery Status : <%
                if(ds==0) out.println("Not Delivered");
                else if(ds==1) out.println("Delivered");
                else out.println("Canceled of Returned");
            %>
        </p>  
        </div>
        
        <div style="width:200px; height:auto; float:right">
            <img src="../admin/photos/<%= photo %>" width="150" height="150" />
               
        </div>
        
        </div>
      
        <%
    }
	if(f==0)
	{
		%>
		<h2>No orders placed</h2>
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
