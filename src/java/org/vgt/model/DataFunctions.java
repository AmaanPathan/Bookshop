package org.vgt.model;

import java.sql.*;
import javax.swing.*;
public class DataFunctions
{
    public String getDatabaseName()
    {
            return "eshop";
    }
    public String getPassword()
    {
            return "";
    }
    public String getUserName()
    {
            return "root";
    }
    public String getDriver()
    {
            return "com.mysql.jdbc.Driver";
    }
    public String getConnectionString()
    {
            return "jdbc:mysql://localhost:3306/"+getDatabaseName();
    }
    public String getPhoto(int bookid)
    {
        String photo="";
        try
        {
            String sql="select photo from books where bookid="+bookid;
            ResultSet r1=fetchData(sql);
            if(r1.next())
            {
                photo=r1.getString(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return photo;
    }
    public int checkLogin(int id,String pass)
    {
            int ans=0;
            try
            {

                    Class.forName(getDriver()).newInstance();
                    Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());
                    String sql="select role from logindata where id=? and password=?";
                    PreparedStatement pst=cn.prepareStatement(sql);

                    pst.setInt(1,id);
                    pst.setString(2,pass);

                    ResultSet rs=pst.executeQuery();

                    if(rs.next())
                    {
                            ans=rs.getInt(1);
                    }
            }
            catch(Exception e)
            {
                    //JOptionPane.showMessageDialog(null,""+e);
            }
            return ans;
    }
    public int generateId(String tableName,int startvalue)
    {
            int id=startvalue;
            try
            {

                    Class.forName(getDriver()).newInstance();
                    Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());
                    String sql="select * from " + tableName;
                    PreparedStatement pst=cn.prepareStatement(sql);

                    ResultSet rs=pst.executeQuery();

                    if(rs.next())
                    {
                            while(rs.next())
                            {
                                    id=rs.getInt(1);
                            }
                            id=id+1;
                    }
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
            return id;
    }
    public void createLogin(int id,String pass,String role,int status)
    {
            try
            {
                    Class.forName(getDriver()).newInstance();
                    Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());

                    String sql="Insert into logindata values(?,?,?,?)";
                    PreparedStatement pst=cn.prepareStatement(sql);

                    pst.setInt(1,id);
                    pst.setString(2,pass);
                    pst.setString(3,role);
                    pst.setInt(4,status);

                    pst.executeUpdate();
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
    }
    public ResultSet fetchData(String sql)
    {
            ResultSet rs=null;
            try
            {

                    Class.forName(getDriver()).newInstance();
                    Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());
                    PreparedStatement pst=cn.prepareStatement(sql);
                    rs=pst.executeQuery();
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
            return rs;
    }
    public void updateOrderInCart(String cartid)
    {
        try
            {

                    Class.forName(getDriver()).newInstance();
                    Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());
                    PreparedStatement pst=cn.prepareStatement("update cart set order_status=1 where cartid="+cartid);
                    pst.executeUpdate();
                    cn.close();
                    pst.close();
            }       

            catch(Exception e)
            {
                System.out.println(e);
            }
    }
    
}