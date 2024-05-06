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
            
           
            
            String snm = request.getParameter("full-name");
            String ph_num = request.getParameter("phone-number");
            String add = request.getParameter("address");
            String email = request.getParameter("email");
            String id = request.getParameter("id-proof");
            String pwd = request.getParameter("password");
            String cpwd = request.getParameter("confirm-password");
            
        //String originalPassword = pwd;
        
        // Hash a password
        String hpwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
        //System.out.println("Original Password: " + originalPassword);
        //System.out.println("Hashed Password: " + hashedPassword);
        
        


            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="insert into user_reg values(?,?,?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(2, snm);
            p.setString(3, ph_num);
            p.setString(5, email);
            p.setString(1, id);
            p.setString(6, hpwd);
            p.setString(4, add);
            
            

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