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
import javax.servlet.http.HttpSession;

import com.database.DbConnection;


@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	

        String username = request.getParameter("username");
        String itemId = request.getParameter("item_id");
        String itemname = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String itemprice = request.getParameter("item_price");
        String itemType = request.getParameter("item_type");
        String customisation = request.getParameter("customisation");
        if(itemId == null || itemname == null  || itemprice == null || itemType == null ){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter");
           
        }
        int itemPrice=0;
       

      
            itemPrice = Integer.parseInt(itemprice);
        try {
            Connection conn = DbConnection.takeConnection();
            String query = "INSERT INTO cart(userid,itemid,name,type,price,quantity,customisation) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, itemId);
            ps.setString(3, itemname);
            ps.setString(4, itemType);
            ps.setInt(5, itemPrice);
            ps.setInt(6, quantity);
            ps.setString(7, customisation);
           
            
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("mycart.jsp");
    }
    }
