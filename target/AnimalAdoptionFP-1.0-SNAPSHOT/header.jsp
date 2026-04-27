<%-- 
    Document   : header
    Author     : adinm
--%>
<link rel="stylesheet" href="headercss.css">
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="com.mycompany.animaladoptionfp.*" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
    session = request.getSession(false);
    User user = null;
    if (session != null) {
        user = (User) session.getAttribute("user");
    }
%>
<!-- Header Section -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">

        <!-- Brand -->
        <a class="navbar-brand fw-bold" href="index.jsp">
            Animal Adoption
        </a>

        <!-- Mobile toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/AnimalServlet">
                        View Animals
                    </a>
                </li>

                <% if (user != null && "ADMIN".equals(user.getRole())) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">Admin Dashboard</a>
                    </li>
                <% } %>

                <% if (user == null) { %>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-primary ms-lg-2" href="login.jsp">
                            Login
                        </a>
                    </li>
                <% } else { %>

                    <li class="nav-item">
                        <span class="nav-link text-muted">
                            Logged in as <strong><%= user.getUsername() %></strong>
                        </span>
                    </li>

                   <li class="nav-item ms-lg-2">
                        <a class="btn btn-danger" href="LogoutServlet">
                        Logout
                        </a>
                    </li>

                <% } %>

            </ul>
        </div>
    </div>
</nav>