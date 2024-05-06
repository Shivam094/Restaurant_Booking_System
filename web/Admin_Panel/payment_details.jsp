<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
       

        header {
            background: rgba(59, 130, 246, 0.8);
        }

        

        .loader {
            border-top: 4px solid #3498db;
            border-right: 4px solid transparent;
            border-bottom: 4px solid transparent;
            border-left: 4px solid transparent;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 0.8s linear infinite;
            margin-right: 8px;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
    <title>Admin Main Page</title>
</head>

<body bgcolor="#E3E3E3">

    <div class="min-h-screen flex flex-col">
        <header class="bg-blue-500 p-4 text-white">
            <div class="flex justify-between items-center">
                <div>
                    <h1 class="text-2xl font-bold">Admin Panel</h1>
                </div>
                <nav class="space-x-4">
                    <a href="index.html" class="hover:underline">Home</a>
                    <a href="table_details.html" class="hover:underline">Table Details</a>
                    <a href="#" class="hover:underline">Menu Details</a>
                    <a href="#" class="hover:underline">Payment Details</a>
                    <a href="#" class="hover:underline">Customer Feedbacks</a>
                    <a href="#" class="hover:underline">Logout</a>
                </nav>
            </div>
        </header>

        <main class="p-4">
            <center>
                <h1 class="text-2xl font-bold mb-4">Payment and Order Details</h1>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200 shadow-md bg-white">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Name
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Phone
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Address
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Food_Category
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Food_Name
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Price
                                </th>
                                <th scope="col"
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Status
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <%
                                try {
                                    String jdbcUrl = "jdbc:mysql://localhost:3306/Resturant";
                                    String username = "root";
                                    String password = "123456789";

                                    try (Connection con = DriverManager.getConnection(jdbcUrl, username, password);
                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("SELECT * FROM payment")) {

                                        while (rs.next()) {
                            %>
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(1) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(2) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(3) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(4) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(5) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(6) %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= rs.getString(7) %></td>
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
                        
                        
            </center>
        </main>
                        <center>
                        <div class="mb-4">
                            <a href="del_pay.html">
                    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                        Delete Records
                    </button>
                            </a>
                   
                </div>
                        </center>
    </div>
</body>

</html>
