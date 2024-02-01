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
            
           
            String id = request.getParameter("empId");
            String snm = request.getParameter("empName");
            String pos = request.getParameter("empPos");
            String sal = request.getParameter("sal");
            String dob = request.getParameter("empdob");
            String doj = request.getParameter("empdoj");
            String gen = request.getParameter("gender");
            String ph = request.getParameter("phone");
            String eml = request.getParameter("email");

        
        


            try{
                
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,"root","123456789");
                if(!con.isClosed()){}
                
            String str="insert into employee values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(str);
            
            p.setString(1, id);
            p.setString(2, snm);
            p.setString(3, pos);
            p.setString(4, sal);
            p.setString(5, dob);
            p.setString(6, doj);
            p.setString(7, gen);
            p.setString(8, ph);
            p.setString(9, eml);
            
            

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