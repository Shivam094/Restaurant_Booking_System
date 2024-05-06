<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        .table-container {
            overflow-x: auto;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-semibold mb-8">Customer Feedback</h1>
        <div class="table-container">
            <table class="min-w-full divide-y divide-gray-200 shadow-lg rounded-lg overflow-hidden">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Mobile No</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rating</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Feedback</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Displaying data from the database -->
                    <%
                        try {
                            String jdbcUrl = "jdbc:mysql://localhost:3306/Resturant";
                            String username = "root";
                            String password = "123456789";

                            try (Connection con = DriverManager.getConnection(jdbcUrl, username, password);
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM feedback")) {

                                while (rs.next()) {
                    %>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(1) %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(2) %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(3) %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(4) %></td>
                    </tr>
                    <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
