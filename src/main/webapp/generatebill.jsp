<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.database.DbConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Generate Bill</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <style>
        .bill-container {
            margin: 50px auto;
            max-width: 800px;
        }
        .bill-box {
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .bill-table {
            width: 100%;
        }
        .bill-table th, .bill-table td {
            padding: 10px;
            text-align: left;
        }
        .bill-table th {
            background-color: #f2f2f2;
        }
        .total-amount {
            text-align: right;
            font-size: 20px;
            margin-top: 20px;
        }
        .button-container {
            margin-top: 20px;
            text-align: center;
            
        }
        .button-container a {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container bill-container">
        <div class="bill-box">
            <h2 class="text-center">Your Bill</h2>
            <table class="table table-bordered bill-table">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String username = (String) session.getAttribute("username");
                        int totalAmount = 0;

                        try {
                            Connection conn = DbConnection.takeConnection();
                            String query = "SELECT name, price, quantity FROM cart WHERE userid = ?";
                            PreparedStatement ps = conn.prepareStatement(query);
                            ps.setString(1, username);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                                String itemName = rs.getString("name");
                                int itemPrice = rs.getInt("price");
                                int quantity = rs.getInt("quantity");
                                int itemTotal = itemPrice * quantity;
                                totalAmount += itemTotal;
                            
                    %>
                    <tr>
                        <td><%= itemName %></td>
                        <td><%= quantity %></td>
                        <td><%= itemPrice*quantity %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
            <div class="total-amount">
                <strong>Total: &#8377;<%=totalAmount %></strong>
            </div>
            <div class="button-container">
                <a href="home.jsp" class="btn btn-secondary">Home</a>
                <a href="logout.jsp" class="btn btn-danger">Logout</a>
            </div>
             <%
                            
                            rs.close();
                            ps.close();
                            String deleteQuery = "DELETE FROM cart WHERE userid = ?";
                            PreparedStatement deletePs = conn.prepareStatement(deleteQuery);
                            deletePs.setString(1, username);
                            deletePs.executeUpdate();
                            deletePs.close();
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>