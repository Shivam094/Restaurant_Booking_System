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
    String cap = request.getParameter("cap");

    try {
        String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
        Connection con = null;

        con = DriverManager.getConnection(connectionURL, "root", "123456789");
        if (!con.isClosed()) {
        }

        // Get current value of 'left' column
        String selectQuery = "SELECT `left` FROM tables WHERE class=?";
        PreparedStatement selectStatement = con.prepareStatement(selectQuery);
        selectStatement.setString(1, tid);
        ResultSet resultSet = selectStatement.executeQuery();

        int currentLeft = 0;
        if (resultSet.next()) {
            currentLeft = resultSet.getInt("left");
        }

        // Update 'left' with current value plus cap
        String updateQuery = "UPDATE tables SET `left` = ? WHERE class=?";
        PreparedStatement updateStatement = con.prepareStatement(updateQuery);
        updateStatement.setInt(1, currentLeft + Integer.parseInt(cap));
        updateStatement.setString(2, tid);
        
        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("Table status updated to free Successfully");
        } else {
            out.println("Table with Class " + tid + " not found");
        }

        con.close();
    } catch (Exception ex) {
        out.println("Error occurred: " + ex.getMessage());
    }
%>


    </body>
</html>
