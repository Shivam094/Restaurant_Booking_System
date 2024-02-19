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
            
           
            String category = request.getParameter("category");
            String code = request.getParameter("code");
            String food = request.getParameter("food");
            String prize = request.getParameter("price");
            

        
        


            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="insert into food values(?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(2, category);
            p.setString(1, code);
            p.setString(3, food);
            p.setString(4, prize);
            
            
            

            p.executeUpdate();
            out.println("Thanks for registering..You will get a confirmation mail shortly");
            con.close();
            
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
        %>
    </body>
</html>