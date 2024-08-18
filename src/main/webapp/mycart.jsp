<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.database.DbConnection, javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
     body {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            position: relative;
            text-align: center;
            width: 100%;
            font-size: 20px;
        }
        .header-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .navbar {
            height: 100vh;
            overflow: hidden;
            object-fit: cover;
            padding: 20px;
            background-color: #f8f9fa;
            height: 100vh;
            overflow-y: auto;
        }
        .navbar .text-center {
            text-align: center;
            font-family: "Georgia", serif;
            font-style: italic;
            font-size: 35px;
        }
        .address-section
        {
        font-size:15px;
        }
        .cartcontent {
            overflow-x: hidden;
            height: 100%;
            overflow-y: auto;
            padding: 8px;
        }
        .cartcontent .mycart {
            text-align: center;
            font-family: "Georgia", serif;
            font-style: italic;
        }
        .generate-bill-container {
            text-align: right;
            margin-top: 20px;
            margin-bottom: 20px;
            
        }
        .generate-bill-btn {
            margin-right: 450px;
        }
    </style>
</head>
<body class="menubody">
<div class="container-fluid">
    <div class="row">
     <div class="sidebar">
        <div class="col-md-2 bg-light navbar fixed-top">
            <h2 class="text-center">The Food House</h2>
            <div class="address-section">
                <hr>
                <p>789 Masala Market, Flavor Street, Tastyville, Bhopal, Madhya Pradesh, 462001</p>
                <hr>
            </div>
            <div class="sidebar">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#menu" data-toggle="collapse">Menu</a>
                    <div id="menu" class="collapse">
                        <ul class="nav flex-column ml-3">
                            <li class="nav-item">
                                <a class="nav-link" href="appetizer.jsp">Appetizers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Mains</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Dessert.jsp">Desserts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="beverages.jsp">Beverages</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mycart.jsp">My Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Signup</a>
                </li>
                <li class="nav-item">
                <a class="nav-link active" href="logout.jsp">Logout</a>
            </li>
            </ul>
            </div>
        </div>
        <div class="col-md-10 offset-md-2 cartcontent">
          
        <img src="https://i.pinimg.com/474x/95/e8/4c/95e84cedfecfcbb0aa5d2a69c6f907b5.jpg" class="header-image" alt="Appetizers Header Image">
        <h1 class="mycart">My Cart</h1>
            <p class="mycart">Your Cart is ready press Generate Bill to generate the bill</p>
        <table class="table">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Customistaion</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
        String username=(String)session.getAttribute("username");

           %>
                <%
                    try {
                        Connection conn = DbConnection.takeConnection();
                        String query = "SELECT itemid,name,price,quantity,customisation FROM cart WHERE userid = ?";
                        PreparedStatement ps = conn.prepareStatement(query);
                        ps.setString(1, username);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                        	String itemid = rs.getString("itemid");
                            String itemName = rs.getString("name");
                            int itemprice = rs.getInt("price");
                            int quantity = rs.getInt("quantity");
                            String customisation = rs.getString("customisation");
                %>
                <tr>
                    
                    <td><%= itemName %></td>
                    <td><%= quantity %></td>
                    <td><%= customisation %></td>
                    <td><%= itemprice %></td>
                   
                    <td>
                         <form action="MyCartServlet" method="post">
                               <input type="hidden" name="itemid" value="<%= itemid %>">
                                <button type="submit" class="btn btn-danger">Remove</button>
                           </form>
                    </td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <br/>
        
                    <div class="generate-bill-container">
                <form action="generatebill.jsp" method="post">
                    <button type="submit" class="btn btn-primary generate-bill-btn">Generate Bill</button>
                </form>
            </div>
        
    </div>
    </div>
</div>  
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>