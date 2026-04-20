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
<h2>Admin Panel</h2>

<a href="createUser.jsp">Create User</a> <a href="UserServlet">List Users</a><br/><br/>


<h3>Create Animal</h3>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form action="CreateAnimalServlet" method="post">
    Name: <input type="text" name="name" required/><br/>
    Species: <input type="text" name="species" required/><br/>
    Age: <input type="number" name="age" min="0" required/><br/>

    <input type="submit" value="Create Animal"/>
</form>