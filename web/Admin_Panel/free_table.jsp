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
    String tid = request.getParameter("tabfree");

    try {
        String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
        Connection con = null;

        con = DriverManager.getConnection(connectionURL, "root", "123456789");
        if (!con.isClosed()) {
        }

        // Update status to 'free'
        String updateQuery = "UPDATE tables SET status = 'Free' WHERE ID=?";
        PreparedStatement updateStatement = con.prepareStatement(updateQuery);

        updateStatement.setString(1, tid);

        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("Table status updated to free Successfully");
        } else {
            out.println("Table with ID " + tid + " not found");
        }

        con.close();
    } catch (Exception ex) {
        out.println("Error occurred: " + ex.getMessage());
    }
%>

    </body>
</html>
