<%@page import="org.vgt.model.DataFunctions"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
DataFunctions obj=new DataFunctions();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());
    
String orderid=request.getParameter("q");

    String sql="select * from book_orders where orderid="+orderid;
    PreparedStatement p1=cn.prepareStatement(sql);
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String del_date,del_status,order_date,bookid;
        orderid=r1.getString(1);
        order_date=r1.getString(5);
        del_date=r1.getString(6);
        del_status=r1.getString(7);
        int ds=Integer.parseInt(del_status);
        bookid=r1.getString(2);

        String sql2="select * from books where bookid="+bookid;
        //out.println(sql2);
        PreparedStatement p2=cn.prepareStatement(sql2);
        ResultSet r2=p2.executeQuery();
		
        String name="",author="",subject="",publisher="",isbn="",price="",book_desc="";
        if(r2.next())
	{
            name=r2.getString(2);
            author=r2.getString(3);
            subject=r2.getString(4);
            publisher=r2.getString(5);
            isbn=r2.getString(6);
            price=r2.getString(7);
            book_desc=r2.getString(8);
        
	}
        String photo=obj.getPhoto(Integer.parseInt(bookid));
        
        
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
            <img src="photos/<%= photo %>" width="150" height="150" />
               
        </div>
        
        </div>
        
        <%
    }
    %>