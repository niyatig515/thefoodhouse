<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="style.css" rel="stylesheet">  
</head>
<body class="loginbody">
    <div class="logincontainer">
        <h2>Login</h2>
        <% if ("Noaccount".equals(request.getParameter("error"))) { %>
    <div class="error-message">
        You need to sign up first! 
    </div>
<% } %>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
             <select class="form-control" name="role" required>
           <option value="" disabled selected hidden>Role</option>
          <option value="user">User</option>
            <option value="staff">Staff</option>
</select>
            <input class="text-success" type="submit" value="Signin">
        </form>
        <div class="text-center mt-3">
                    <a href="signup.jsp">Don't have an account? Sign up here.</a>
                </div>
    </div>
    
</body>
</html>
