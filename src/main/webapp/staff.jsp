<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Food House - Staff Panel</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link href="style.css" rel="stylesheet">
</head>
<body class="staffbody">
    <div class="staffcontainer">
        <div class="staffbox">
            <h2>The Food House</h2>
            <p>Welcome to The Food House, you can choose one of the actions below:</p> 
            <div class="text-center">
                <form action="updateItem.jsp" method="get">
                    <button type="submit" class="btn btn-primary btn-action">Update an Item</button>
                </form>
                <form action="deleteItem.jsp" method="get">
                    <button type="submit" class="btn btn-primary btn-action">Delete an Item</button>
                </form>
                <form action="insertItem.jsp" method="get">
                    <button type="submit" class="btn btn-primary btn-action">Insert an Item</button>
                </form>
                <form action="viewOrders.jsp" method="get">
                    <button type="submit" class="btn btn-primary btn-action">View All Orders</button>
                </form>
            </div>
            
            <div class="text-center mt-3">
                <button onclick="location.href='home.jsp'" class="btn btn-secondary">Home</button>
                <button onclick="location.href='logout.jsp'" class="btn btn-secondary">Logout</button>
            </div>
        </div>
    </div>
</body>
</html>
