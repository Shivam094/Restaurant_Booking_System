<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    // Retrieve form data
    String snm = request.getParameter("name");
    String mob = request.getParameter("mobile");
    String tab = request.getParameter("table-type");
    String mem = request.getParameter("num-members");
    String but = request.getParameter("butler-service");
    String tim = request.getParameter("time");
    String meal = request.getParameter("meal-type");
    
    // Initialize database connection
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        try (Connection con = DriverManager.getConnection(connectionURL, "root", "123456789")) {
            String insertQuery = "INSERT INTO reservation (name, mobile, table_type, num_members, butler_service, time, meal_type) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement pInsert = con.prepareStatement(insertQuery)) {
                // Set parameters for insertion
                pInsert.setString(1, snm);
                pInsert.setString(2, mob);
                pInsert.setString(3, tab);
                pInsert.setString(4, mem);
                pInsert.setString(5, but);
                pInsert.setString(6, tim);
                pInsert.setString(7, meal);

                // Execute insertion query
                int rowsInserted = pInsert.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("Data inserted successfully.");

                    // Update available seats for the specific class
                   String updateQuery = "UPDATE `tables` SET `left` = `left` - 1 WHERE class = ?";
try (PreparedStatement pUpdate = con.prepareStatement(updateQuery)) {
    pUpdate.setString(1, tab); // assuming 'tab' is the parameter for the class
    int rowsUpdated = pUpdate.executeUpdate();
    
    if (rowsUpdated > 0) {
        out.println("Seating capacity decremented successfully.");
    } else {
        out.println("No rows updated. Class not found.");
    }
} catch (SQLException ex) {
    out.println("SQL Error: " + ex.getMessage());
} catch (Exception ex) {
    out.println("Error: " + ex.getMessage());
}


                } else {
                    out.println("Failed to insert data.");
                }
            }
        }
    } catch (Exception ex) {
        // Print detailed error message or log the exception
        out.println("An error occurred: " + ex.getMessage());
    }
%>

    </body>
</html>
