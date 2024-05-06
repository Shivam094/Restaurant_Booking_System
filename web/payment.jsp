<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 350px;
            max-width: 90%;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        .field {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #007bff;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .info {
            text-align: center;
            color: #999;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Make a Payment</h1>
        <form action="processpayment.jsp" method="post">
            <div class="field">
                <label>Category:</label>
                <input type="text" name="category" value="${param.foodTypes}" readonly>
            </div>

            <div class="field">
                <label>Name:</label>
                <input type="text" name="name" value="${param.foodNames}" readonly>
            </div>

            <div class="field">
                <label>Price:</label>
                <input type="text" name="price" value="Rs. ${param.finalTotalPrice}" readonly>
            </div>

            <div class="field">
                <label for="nm">Name:</label>
                <input type="text" id="nm" name="nm" required>
            </div>
            
            <div class="field">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required>
            </div>

            <div class="field">
                <label for="expiryDate">Expiry Date:</label>
                <input type="date" id="expiryDate" name="expiryDate" required>
            </div>

            <div class="field">
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required>
            </div>
            
            <div class="field">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <input type="submit" value="Proceed">
        </form>
        <p class="info">Secure payment powered by Axis Bank</p>
    </div>
</body>
</html>
