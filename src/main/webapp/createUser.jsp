<%-- 
    Document   : createUser
    Author     : adinm
--%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create User</title>
</head>
<body>
<h2>Create a New User</h2>

<form action="CreateUserServlet" method="post">
    Username: <input type="text" name="username" required/><br/>
    Password: <input type="password" name="password" required/><br/>
    <input type="submit" value="Create User"/>
</form>

<c:if test="${not empty message}">
    <p style="color:red">${message}</p>
</c:if>

<a href="admin.jsp">Back to Admin Page</a>
</body>
</html>