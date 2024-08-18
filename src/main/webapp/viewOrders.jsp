<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link href="style.css" rel="stylesheet"> 
     <style>
        body, html {
    height: 100%;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
   }
h2 { 
    margin-top:80px;
    margin-bottom: 20px;
    color: #343a40;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
th, td {
    padding: 15px;
    text-align: center;
}
th {
    background-color: #007bff;
    color: white;
}
td {
    background-color: #f2f2f2;
}
tr:nth-child(even) td {
    background-color: #e9ecef;
}
tr:hover td {
    background-color: #d6d8db;
}
    </style>
    <%@ page import="java.sql.*, com.database.DbConnection" %>
</head>
<body>
    <div class="viewcontainer">
        <div class="viewbox">
            <h2>View Orders</h2>
            <table class="table table-bordered view">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Item ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Customisation</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = DbConnection.takeConnection();
                        if (conn != null) {
                            String query = "SELECT * FROM cart";
                            PreparedStatement ps = conn.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                String userId = rs.getString("userId");
                                String itemId = rs.getString("itemId");
                                String name = rs.getString("name");
                                int price = rs.getInt("price");
                                int quantity = rs.getInt("quantity");
                                String customisation = rs.getString("customisation");
                    %>
                    <tr>
                        <td><%= userId %></td>
                        <td><%= itemId %></td>
                        <td><%= name %></td>
                        <td><%= price %></td>
                        <td><%= quantity %></td>
                        <td><%= customisation %></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            ps.close();
                            conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
