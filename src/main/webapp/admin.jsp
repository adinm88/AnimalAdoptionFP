<%-- 
    Document   : admin
    Created on : Apr 4, 2026, 11:14:11?PM
    Author     : adinm
--%>
<link rel="stylesheet" href="headercss.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("ADMIN")) {
    response.sendRedirect("index.jsp");
    return;
}
%>
<div class="container mt-4">

    <h2 class="mb-4 text-center">Admin Dashboard</h2>

    <!-- Quick Links -->
    <div class="row mb-4">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">User Management</h5>
                    <a href="createUser.jsp" class="btn btn-primary me-2">Create User</a>
                    <a href="UserServlet" class="btn btn-outline-primary">List Users</a>
                    <div class="alert alert-warning">Only Users with role User can be created. Admins must be manually created from the database owner for security reasons.</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Animal Form -->
    <div class="card shadow-sm">
        <div class="card-header bg-success text-white">
            <h5 class="mb-0">Create New Animal</h5>
        </div>

        <div class="card-body">

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <form action="CreateAnimalServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Species</label>
                    <input type="text" name="species" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Age</label>
                    <input type="number" name="age" min="0" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success w-100">
                    Create Animal
                </button>

            </form>

        </div>
    </div>

</div>