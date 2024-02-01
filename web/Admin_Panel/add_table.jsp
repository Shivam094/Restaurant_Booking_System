<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
           
            String tabid = request.getParameter("tabid");
            String clas = request.getParameter("class");
            String seat = request.getParameter("seat");
            String status = request.getParameter("status");
            String prize = request.getParameter("prize");
            
        
        


            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="insert into tables values(?,?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(1, tabid);
            p.setString(2, clas);
            p.setString(3, seat);
            p.setString(4, status);
            p.setString(5, prize);
            
            
            

            p.executeUpdate();
            out.println("Table added...");
            con.close();
            
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
        %>
    </body>
</html>