
<%@page import="org.vgt.model.DataFunctions"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String user,password;
        user=request.getParameter("T1");
        password=request.getParameter("T2");

        DataFunctions obj=new DataFunctions();
        Class.forName(obj.getDriver());
        Connection cn=DriverManager.getConnection(obj.getConnectionString(),obj.getUserName(),obj.getPassword());

        String sql="select * from logindata where username=? and password=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1,user);
        p1.setString(2,password);
        ResultSet r1=p1.executeQuery();
        if(r1.next())
        {
                String user_type=r1.getString(3);
                //create session
                session=request.getSession(true); //create session if does not exist
                //add some to data to sesssion
                session.setAttribute("username",user);
                session.setAttribute("role",user_type);

                if(user_type.equals("admin")==true)
                {
                        response.sendRedirect("admin/AdminHome.jsp");
                }
                else if(user_type.equals("user")==true)
                {
                        response.sendRedirect("user/UserHome.jsp");
                }
        }
        else
        {
                response.sendRedirect("LorginError.jsp");
        }
    %>
    </body>
</html>