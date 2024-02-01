<%-- 
    Document   : admin_valid
    Created on : Feb 10, 2023, 9:13:40 PM
    Author     : SHIVAM ROY
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sid=request.getParameter("emprem");
            

            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="delete from employee where ID=?";
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(1, sid);
            
            p.executeUpdate();
                      
                out.println("User deleted Successfully");
                con.close();
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
         %>
    </body>
</html>
