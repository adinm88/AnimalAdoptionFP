<%-- 
    Document   : login
    Author     : adinm
--%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="LoginServlet" method="post">
    Username: <input type="text" name="username"/><br/>
    Password: <input type="password" name="password"/><br/>
    <input type="submit" value="Login"/>
</form>
<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<a href="index.jsp">Back to Home</a>
</body>
</html>