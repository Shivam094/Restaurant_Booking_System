<%-- 
    Document   : admin_valid
    Created on : Feb 10, 2023, 9:13:40 PM
    Author     : SHIVAM ROY
--%>
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
            String unm=request.getParameter("unm");
            String pwd=request.getParameter("pwd");
            String phn=request.getParameter("phn");
            String hpwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
            

            try{
                
                boolean status=false;
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="select * from user_reg where email=?";
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(1, unm);
            //p.setString(2, hpwd);
            
            ResultSet rs=p.executeQuery();
            status=rs.next();
            
            if(status==true)
            {
                String pass = rs.getString("password");
                if (BCrypt.checkpw(pwd, pass)) 
                {
                    System.out.println("Password matches!");
                    String qry = "insert into user_login values(?,?,?)";
            
                    PreparedStatement temp = con.prepareStatement(qry);
            
                    temp.setString(1, unm);
                    temp.setString(2, pwd);
                    temp.setString(3, phn);
                    
                    temp.executeUpdate();
                    
                    
                    response.sendRedirect("user.html");
                } 
                
                 
            }
            
          
                out.println("Incorrect Password, Successfully connected");
                con.close();
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
         %>
    </body>
</html>
