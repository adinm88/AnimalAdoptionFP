/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mycompany.animaladoptionfp.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author adinm
 */
@WebServlet(name = "CreateUserServlet", urlPatterns = {"/CreateUserServlet"})
public class CreateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simple validation
        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) {
            request.setAttribute("message", "All fields are required.");
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO USERS (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // TODO: Hash for production
            stmt.setString(3, "User");
            stmt.executeUpdate();

            request.setAttribute("message", "User created successfully!");
            request.getRequestDispatcher("createUser.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error creating user: " + e.getMessage());
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        }
    }
}