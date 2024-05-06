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
            
           
            String nm = request.getParameter("name");
            String mob = request.getParameter("mobile");
            String rat = request.getParameter("rating");
            String fed = request.getParameter("feedback");
            
        
        


            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="insert into feedback values(?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(1, nm);
            p.setString(2, mob);
            p.setString(3, rat);
            p.setString(4, fed);
            
            

            p.executeUpdate();
            out.println("Thanks for giving review");
            con.close();
            
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
        %>
    </body>
</html>