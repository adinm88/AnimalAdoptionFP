/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.List;
import com.mycompany.animaladoptionfp.*;

/**
 *
 * @author adinm
 */
@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create Database object
        AnimalDAO dao = new AnimalDAO();

        // Get animals from database
        List<Animal> animals = dao.getAllAnimals();
    
        // Send to JSP
        request.setAttribute("animals", animals);
        String action = request.getParameter("action");

        if ("delete".equals(action)) {

            // SECURITY CHECK (important)
            String role = (String) request.getSession().getAttribute("role");

            if (role == null || !role.equals("ADMIN")) {
                response.sendRedirect("animals.jsp");
                return;
            }

            int id = Integer.parseInt(request.getParameter("id"));
            AnimalDAO.deleteAnimal(id);

            response.sendRedirect("AnimalServlet?action=list");
            return;
        }

        // Forward to view
        request.getRequestDispatcher("animals.jsp")
            .forward(request, response);
    }
}
