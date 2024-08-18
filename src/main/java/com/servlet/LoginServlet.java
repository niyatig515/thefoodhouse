package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DbConnection;


/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("role", role);
        try {
            Connection conn = DbConnection.takeConnection();
            String query = "SELECT * FROM login WHERE email = ? AND password = ? AND role = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	 if ("staff".equals(role)) {
                     response.sendRedirect("staff.jsp");
                 } else {
                     response.sendRedirect("home.jsp");
                 }
            } else {
            	
                response.sendRedirect("login.jsp?error=Noaccount");
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
        
    }
}
