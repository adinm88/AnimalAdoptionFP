<%-- 
    Document   : listUsers
    Created on : Apr 19, 2026, 11:01:40?PM
    Author     : adinm
--%>

<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.mycompany.animaladoptionfp.User" %>
<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("ADMIN")) {
    response.sendRedirect("index.jsp");
    return;
}
%>
<div class="container mt-4">

<h2>Users</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Role</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.role}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</div>
    
<p style="color: red;">For admins only.</p>
