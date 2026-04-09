<%-- 
    Document   : admin
    Created on : Apr 4, 2026, 11:14:11?PM
    Author     : adinm
--%>
<link rel="stylesheet" href="headercss.css">
<%@ include file="header.jsp" %>
<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("ADMIN")) {
    response.sendRedirect("index.jsp");
    return;
}
%>
<h2>Admin Panel</h2>

<a href="createUser.jsp">Create User</a> <a href="listUsers.jsp">List Users</a><br/><br/>


<h3>Create Animal</h3>

<form action="CreateAnimalServlet" method="post">
    Name: <input type="text" name="name" required/><br/>
    Species: <input type="text" name="species" required/><br/>
    Age: <input type="number" name="age" required/><br/>

    <input type="submit" value="Create Animal"/>
</form>