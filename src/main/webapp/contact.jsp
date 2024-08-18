<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, com.database.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Contact Form Submission</title>
</head>
<body>
    <%
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("conemail");
       String mobile = request.getParameter("mobile");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DbConnection.takeConnection();
            String query = "INSERT INTO contact(firstname, lastname, email, mobile, message) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, message);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h1>Thank you for contacting us! We will reach you soon.</h1>");
            } else {
                out.println("<h1>Failed to submit contact information.</h1>");
            }
        } catch (SQLException e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.println("<h1>Error closing database connection: " + e.getMessage() + "</h1>");
            }
        }
    %>
</body>
</html>