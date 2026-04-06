<%-- 
    Document   : header
    Author     : adinm
--%>
<link rel="stylesheet" href="headercss.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="com.mycompany.animaladoptionfp.*" %>
<%
    session = request.getSession(false);
    User user = null;
    if (session != null) {
        user = (User) session.getAttribute("user");
    }
%>
<!-- Header Section -->
<div id='heading'>
    <div>
        <strong>Animal Adoption‎ </strong>
        <% if (user != null) { %>
        ‎<p>‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ Logged in as: <strong><%= user.getUsername() %></strong></p>
        
    </div>
    <div>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
        <% if (user != null) { %>
            <a href="index.jsp">Home</a>‎ |‎ <a href="<%= request.getContextPath() %>/AnimalServlet">View Animals</a>
            <% if ("ADMIN".equals(user.getRole())) { %>‎ |‎  
                <a href="admin.jsp">‎ Admin Dashboard</a>
            <% } %>‎ |‎ 
            <a href="LogoutServlet">‎ Logout</a>
            <% } %>
    </div>
</div>
