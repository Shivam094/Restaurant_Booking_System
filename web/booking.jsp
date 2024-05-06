<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>

<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h2 {
            text-align: center;
        }
        .order-details {
            margin-top: 20px;
        }
        .order-item {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>Order Confirmation</h2>

    <div class="order-details">
        <%-- Initialize final total price --%>
        <% BigDecimal finalTotalPrice = BigDecimal.ZERO; %>
        
        <%-- Retrieve and display the first food item --%>
        <div class="order-item">
            <h3>Food Item 1:</h3>
            <p>Food Type: <%= request.getParameter("foodType1") %></p>
            <p>Food Name: <%= request.getParameter("foodName1") %></p>
            <p>Quantity: <%= request.getParameter("quantity1") %></p>
            <%-- Calculate and display price and total price for the first item --%>
            <%
                String foodType1 = request.getParameter("foodType1");
                String foodName1 = request.getParameter("foodName1");
                String quantity1 = request.getParameter("quantity1");
                String price1 = getPriceFromDatabase(foodType1, foodName1);
                BigDecimal totalPrice1 = new BigDecimal(calculateTotalPrice(quantity1, price1));
                out.println("<p>Price: " + price1 + "</p>");
                out.println("<p>Total Price: " + totalPrice1 + "</p>");
                // Add the total price of the first item to the final total
                finalTotalPrice = finalTotalPrice.add(totalPrice1);
            %>
        </div>

        <%-- Retrieve and display additional food items --%>
        <% 
            for (int i = 2; i <= 3; i++) { 
                String foodType = request.getParameter("foodType" + i);
                String foodName = request.getParameter("foodName" + i);
                if (foodType != null && !foodType.isEmpty() && foodName != null && !foodName.isEmpty()) { 
                    String quantity = request.getParameter("quantity" + i);
                    String price = getPriceFromDatabase(foodType, foodName);
                    BigDecimal totalPrice = new BigDecimal(calculateTotalPrice(quantity, price));
                    finalTotalPrice = finalTotalPrice.add(totalPrice); // Add total price of current item to final total
        %>
            <div class="order-item">
                <h3>Food Item <%= i %>:</h3>
                <p>Food Type: <%= foodType %></p>
                <p>Food Name: <%= foodName %></p>
                <p>Quantity: <%= quantity %></p>
                <p>Price: <%= price %></p>
                <p>Total Price: <%= calculateTotalPrice(quantity, price) %></p>
            </div>
        <% 
                } 
            } 
        %>
        <%-- Display final total price --%>
        <div class="final-total">
            <h3>Final Total Price:</h3>
            <p><%= finalTotalPrice.toString() %></p>
        </div>
    </div>

    <div class="proceed-button">
        <button onclick="redirectToPayment()">Proceed</button>
    </div>

    <%!
        // Method to retrieve price from the database
        public String getPriceFromDatabase(String foodType, String foodName) {
            try {
                // Establish database connection
                String connectionURL = "jdbc:mysql://localhost:3306/Resturant";
                Connection con = null;
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(connectionURL, "root", "123456789");

                // Query to retrieve price from the database
                String query = "SELECT price FROM food WHERE category = ? AND food_name = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, foodType);
                pstmt.setString(2, foodName);
                ResultSet rs = pstmt.executeQuery();

                // Check if result set has any rows
                if (rs.next()) {
                    return rs.getString("price");
                } else {
                    return "Price not available";
                }
            } catch (Exception e) {
                e.printStackTrace();
                return "Error occurred: " + e.getMessage();
            }
        }
        
        // Method to calculate total price
        public String calculateTotalPrice(String quantity, String price) {
            try {
                BigDecimal totalPrice = new BigDecimal(quantity).multiply(new BigDecimal(price));
                return totalPrice.toString();
            } catch (NumberFormatException e) {
                return "Invalid quantity or price";
            }
        }
    %>

    <%
    // Initialize i in a JSP scriptlet
    int i = 2;
%>

 <script>
    function redirectToPayment() {
        var foodTypes = '<%= request.getParameter("foodType1") %>';
        var foodNames = '<%= request.getParameter("foodName1") %>';
        var category1 = '<%= request.getParameter("category1") %>';
        var name1 = '<%= request.getParameter("name1") %>';

        // Loop through additional food items and concatenate their types and names
       
            foodTypes += ',' + '<%= request.getParameter("foodType" + 2) %>';
            foodNames += ',' + '<%= request.getParameter("foodName" + 2) %>';
            
            foodTypes += ',' + '<%= request.getParameter("foodType" + 3) %>';
            foodNames += ',' + '<%= request.getParameter("foodName" + 3) %>';
            
        

        var finalTotalPrice = '<%= finalTotalPrice.toString() %>';
        var url = "payment.jsp?foodTypes=" + encodeURIComponent(foodTypes) + "&foodNames=" + encodeURIComponent(foodNames) + "&category1=" + encodeURIComponent(category1) + "&name1=" + encodeURIComponent(name1) + "&finalTotalPrice=" + encodeURIComponent(finalTotalPrice);
        
        // Redirect to the payment page with concatenated parameters
        window.location.href = url;
    }
</script>



</body>
</html>
