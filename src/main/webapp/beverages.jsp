<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
<%@ page import="java.sql.*,com.database.DbConnection" %>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
  <style type="text/css">
  .address-section {
    word-wrap: break-word; 
    overflow-x: hidden;
    
}  
</style>
</head>
<body class="menubody">
<%     
 String username =(String) session.getAttribute("username"); 
%>
<div class="container-fluid">
    <div class="row">
    
        <div class="col-md-2 bg-light navbar  fixed-top">
            <h2 class="text-center">The Food House</h2>
            <div class="address-section">
                <hr>
                <p>789 Masala Market, Flavor Street, Tastyville, Bhopal, Madhya Pradesh, 462001</p>
                <hr>
            </div>
            <div class="sidebar ">
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
                <a class="nav-link active" href="logout">Logout</a>
            </li>
            </ul>
            </div>
        </div>
          <div class="col-md-10 offset-md-2 content">
            <!-- Header Image -->
            <img src="https://www.cactuslanguage.com/wp-content/uploads/2022/08/drinks-around-the-world.jpg" class="header-image" alt="Beverages Header Image">
            
            <!-- Page Content -->
            <h1 class="main">Beverages</h1>
            <p class="main">Explore our beverages section for a refreshing array of drinks to complement your meal.</p>
            <!-- Additional content here -->
        <div class="row1">
               <table class="table table-hover table-striped" >
                  <tr>
                  		<th>Id</th>
                       <th>Image</th>
                       <th>Name</th>
                       <th>Description</th>
                       <th>Price</th>
                       <th>Quantity</th>
                       <th>Customisation</th>
                        <th>Add to Cart</th>
                       </tr>
   <%
    try {
        Connection conn = DbConnection.takeConnection();
        if (conn == null) {
            out.println("Failed to establish connection.");
        } else {
            String query = "SELECT id,image, name, description, price FROM food WHERE type = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "beverages");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	String bvid = rs.getString("id");
                String image = rs.getString("image");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int price = rs.getInt("price");
%>
<tr>
	<td><%= bvid %></td>
    <td><img src="<%= image %>" alt="<%= name %>" class="img-fluid" style="width: 100px; height: auto;"></td>
    <td><%= name %></td>
    <td><%= description %></td>
    <td><%= price %></td>
     <form action="AddToCartServlet" method="post">
       <td>
       <input type="hidden" name="item_id" value="<%= bvid %>">
        <input type="hidden" name="item_name" value="<%= name %>">
       <input type="hidden" name="username" value="<%= username%>">
       <input type="hidden" name="item_price" value="<%= price %>">
       <input type="hidden" name="item_type" value="beverages">
       <input type="number" name="quantity" value="1">
       </td>
       <td>
          <select name="customisation" class="form-control">
            <option value="Normal" selected>Normal</option>
            <option value="Ice">Ice</option>
            <option value="Chilled">Chilled</option>
        </select>
       </td>
     
    <td>
        <input type="submit" class="btn btn-primary" value="Add to cart">
    </td>
    </form>
</tr>
<%
            }
            rs.close();
            ps.close();
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
  </table>
  </div>
      </div>
    </div>
</div>  
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>