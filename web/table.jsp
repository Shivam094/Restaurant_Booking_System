<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Form</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-8">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-2xl font-bold mb-4">Reservation Form</h1>
        <table class="border-collapse w-full mb-8">
            <thead>
                <tr>
                    <th class="border border-gray-400 px-6 py-3 text-left">Table ID</th>
                    <th class="border border-gray-400 px-6 py-3 text-left">Class</th>
                    <th class="border border-gray-400 px-6 py-3 text-left">Seating Capacity</th>
                    <th class="border border-gray-400 px-6 py-3 text-left">Price</th>
                    <th class="border border-gray-400 px-6 py-3 text-left">Table Left</th>
                </tr>
            </thead>
            <tbody>
                <!-- Displaying data from the database -->
                <%
                    try {
                        String jdbcUrl = "jdbc:mysql://localhost:3306/Resturant";
                        String username = "root";
                        String password = "123456789";

                        try (Connection con = DriverManager.getConnection(jdbcUrl, username, password);
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM tables")) {

                            while (rs.next()) {
                %>
                <tr>
                    <td class="border border-gray-400 px-6 py-4 whitespace-nowrap"><%= rs.getString(1) %></td>
                    <td class="border border-gray-400 px-6 py-4 whitespace-nowrap"><%= rs.getString(2) %></td>
                    <td class="border border-gray-400 px-6 py-4 whitespace-nowrap"><%= rs.getString(3) %></td>
                    <td class="border border-gray-400 px-6 py-4 whitespace-nowrap">Rs. <%= rs.getString(4) %></td>
                    <td class="border border-gray-400 px-6 py-4 whitespace-nowrap"><%= rs.getString(5) %></td>
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
        
        <!-- Booking Form -->
        <form class="bg-white p-6 rounded-lg shadow-md">
            <!-- Form inputs go here -->
        </form>
    </div>
        
        <!-- Booking Form -->
        <form class="bg-white p-6 rounded-lg shadow-md" action="reservation.jsp" method="post">
            <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input type="text" id="name" name="name" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile Number</label>
                <input type="text" id="mobile" name="mobile" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="table-type" class="block text-sm font-medium text-gray-700">Table Type</label>
                <select id="table-type" name="table-type" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    <option value="silver">Silver</option>
                    <option value="platinum">Platinum</option>
                    <option value="gold">Gold</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="num-members" class="block text-sm font-medium text-gray-700">Number of Members</label>
                <input type="number" id="num-members" name="num-members" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Butler Service</label>
                <div class="flex items-center">
                    <input type="checkbox" id="butler-service" name="butler-service" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded">
                    <label for="butler-service" class="ml-2 block text-sm text-gray-900">Yes</label>
                </div>
            </div>
            <div class="mb-4">
                <label for="time" class="block text-sm font-medium text-gray-700">Time</label>
                <input type="time" id="time" name="time" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="meal-type" class="block text-sm font-medium text-gray-700">Meal Type</label>
                <select id="meal-type" name="meal-type" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    <option value="breakfast">Breakfast</option>
                    <option value="lunch">Lunch</option>
                    <option value="dinner">Dinner</option>
                </select>
            </div>
            
            <button type="submit" class="bg-indigo-500 text-white px-4 py-2 rounded-md hover:bg-indigo-600">Submit</button>
        </form>
    </div>
</body>
</html>
