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
<h2>Users</h2>


<c:forEach var="user" items="${users}">
    <p style="color: black; font-family: Arial, sans-serif;">${user.id} - ${user.username} - ${user.role}</p>
</c:forEach>
    
<p style="color: red;">For admins only.</p>
