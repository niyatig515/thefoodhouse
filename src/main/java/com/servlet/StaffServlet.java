package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.DbConnection;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Connection conn = DbConnection.takeConnection();
            PreparedStatement ps;
            switch (action) {
                case "updateItem":
                    String updateItemId = request.getParameter("itemId");
                    String updateName = request.getParameter("name");
                    String updatePrice = request.getParameter("price");
                    ps = conn.prepareStatement("UPDATE food SET name = ?, price = ? WHERE id = ?");
                    ps.setString(1, updateName);
                    ps.setString(2, updatePrice);
                    ps.setString(3, updateItemId);
                    ps.executeUpdate();
                    ps.close();
                    break;
                case "deleteItem":
                    String deleteItemId = request.getParameter("itemId");
                    ps = conn.prepareStatement("DELETE FROM food WHERE id = ?");
                    ps.setString(1, deleteItemId);
                    ps.executeUpdate();
                    ps.close();
                    break;
                case "insertItem":
                    String insertItemId = request.getParameter("itemId");
                    String insertName = request.getParameter("name");
                    String insertImage = request.getParameter("image");
                    String insertDescription = request.getParameter("description");
                    String insertType = request.getParameter("type");
                    String insertPrice = request.getParameter("price");
                    ps = conn.prepareStatement("INSERT INTO food (id, name, image, description, type, price) VALUES (?, ?, ?, ?, ?, ?)");
                    ps.setString(1, insertItemId);
                    ps.setString(2, insertName);
                    ps.setString(3, insertImage);
                    ps.setString(4, insertDescription);
                    ps.setString(5, insertType);
                    ps.setString(6, insertPrice);
                    ps.executeUpdate();
                    ps.close();
                    break;
                case "view":
                    // View logic handled in JSP
                    response.sendRedirect("viewOrders.jsp");
                    return;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("staff.jsp");
    }
}