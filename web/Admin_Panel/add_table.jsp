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
    //String tabid = request.getParameter("tabid");
    String clas = request.getParameter("class");
    String seat = request.getParameter("seat");
    //String status = request.getParameter("status");
    String prize = request.getParameter("prize");

    try {
        String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(connectionURL, "root", "123456789");

        if (!con.isClosed()) {
            String str = "UPDATE tables SET Seating_capacity = ?, Prize = ? WHERE Class = ?";
            PreparedStatement p = con.prepareStatement(str);
            
            p.setString(1, seat);
            //p.setString(2, status);
            p.setString(2, prize);
            p.setString(3, clas); // Set the value of 'clas' here
            
            int rowsUpdated = p.executeUpdate();
            if (rowsUpdated > 0) {
                out.println("Table updated...");
            } else {
                out.println("No table updated. Check if class exists.");
            }
            
            con.close();
        }
    } catch (SQLException ex) {
        out.println("SQL Error: " + ex.getMessage());
    } catch (ClassNotFoundException ex) {
        out.println("Class Not Found: " + ex.getMessage());
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>

    </body>
</html>