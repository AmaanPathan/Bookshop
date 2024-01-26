<%@page import="org.vgt.model.DataFunctions"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
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
        	<h1>Book Photo</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            
            
            <%
			String bookid=request.getParameter("bookid");
            String saveFile="";
            String contentType = request.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
            totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1,contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			
			
			saveFile=bookid+"_"+saveFile;
			File f = new File("E:/temp/vikram/BookShop/web/admin/photos/"+saveFile);
            FileOutputStream fileOut = new FileOutputStream(f);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();

            
            //Send page details in table
            DataFunctions obj=new DataFunctions();
            
Class.forName(obj.getDriver());
Connection cn=DriverManager.getConnection(obj.getConnectionString(), obj.getUserName(), obj.getPassword());
String sql="update books set photo=? where bookid=?";
PreparedStatement p1=cn.prepareStatement(sql);
p1.setString(1,saveFile);
p1.setInt(2,Integer.parseInt(bookid));
p1.executeUpdate();
            }
            %>
            <h2>Photo Uploaded</h2>
            <p><a href="ManageBooks.jsp" >Continue</a></p>
            
            
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
