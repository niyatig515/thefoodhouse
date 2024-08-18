<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link href="style.css" rel="stylesheet">
</head>
<body class="signupbody">
    <div class="signup-form">
        <h2>Signup</h2>  
        <% if ("exists".equals(request.getParameter("error"))) { %>
                    <div class="error-message">
                        User with this email already exists. Please <a href="login.jsp">login</a>.
                    </div>
                <% } %>
        <form action="SignupServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Create Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="role">Role:</label>
            <select class="form-control signform" name="role" required>
               <option value="" disabled selected hidden>Role</option>
               <option value="user">User</option>
                <option value="staff">Staff</option>
</select>
            <input type="submit" value="Signup">
        </form>
    </div>
</body>
</html>
