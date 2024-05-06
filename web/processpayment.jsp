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
    String phone = request.getParameter("phone");
    String category = request.getParameter("category");
    String fname = request.getParameter("name");
    String uname = request.getParameter("nm");
    String price = request.getParameter("price");
    

    try {
        boolean status = false;
        boolean status1 = false;
        String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(connectionURL, "root", "123456789");

        if (!con.isClosed()) {
            String str = "SELECT address FROM user_reg WHERE phone=?";
            PreparedStatement p = con.prepareStatement(str);

            p.setString(1, phone);

            ResultSet rs = p.executeQuery();
            status = rs.next(); // Check if result set has any rows
            
            
            
            
            
            String address = rs.getString("address");
            String payment_status = "paid";

            
            
            
            String str1="insert into payment values(?,?,?,?,?,?,?)";
            
            PreparedStatement p1 = con.prepareStatement(str1);
            
            p1.setString(1, uname);
            p1.setString(2, phone);
            p1.setString(3, address);
            p1.setString(4, category);
            p1.setString(5, fname);
            p1.setString(6, price);
            p1.setString(7, payment_status);
            
            int rs1 = p1.executeUpdate();
            
            
            
            
            
            
            
            

            if (status && rs1>0) {
                //String addrss = rs.getString("address");
                // Store the price in a request attribute
                request.setAttribute("address", address);
                

                // Forward the request to the next JSP page
                RequestDispatcher dispatcher = request.getRequestDispatcher("process.jsp");
                dispatcher.forward(request, response);
                
            } else {
                // Food not found, you might want to handle this case appropriately
                out.println("User not registered");
            }
            out.println("Successfully connected");
            con.close();
        }
    } catch (Exception ex) {
        out.println("Error occurred: " + ex.getMessage());
    }
    
%>
</body>
</html>
