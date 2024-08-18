<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Item</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="box">
            <h2>Delete Item</h2>
            <form action="StaffServlet" method="post">
                <input type="hidden" name="action" value="deleteItem">
                <div class="form-group">
                    <label for="itemId">Item ID:</label>
                    <input type="text" class="form-control" id="itemId" name="itemId" required>
                </div>
                <button type="submit" class="btn btn-primary">Delete</button>
            </form>
        </div>
    </div>
</body>
</html>
