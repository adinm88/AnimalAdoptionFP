/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import com.mycompany.animaladoptionfp.AnimalDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author adinm
 */
@WebServlet(name = "CreateAnimalServlet", urlPatterns = {"/CreateAnimalServlet"})
public class CreateAnimalServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }

        String name = request.getParameter("name");
        String species = request.getParameter("species");
        String ageStr = request.getParameter("age");

        // validation
        if (name == null || name.isEmpty() ||
            species == null || species.isEmpty() ||
            ageStr == null || ageStr.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }

        int age;

        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Age must be a valid number.");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }

        // database insert
        AnimalDAO dao = new AnimalDAO();
        dao.createAnimal(name, species, age);

        response.sendRedirect("admin.jsp");
    }
}