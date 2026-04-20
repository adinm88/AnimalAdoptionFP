/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;
import com.mycompany.animaladoptionfp.*;

/**
 *
 * @author adinm
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create Database object
        UserDAO dao = new UserDAO();

        // Get animals from database
        List<User> users = dao.getAllUsers();
    
        // Send to JSP
        request.setAttribute("users", users);

        // Forward to view
        request.getRequestDispatcher("listUsers.jsp")
            .forward(request, response);
        
        }
    }