<%-- 
    Document   : animals
    Created on : Mar 22, 2026, 8:48:55 AM
    Author     : adinm
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animals</title>
    </head>
    <body>
        <h2>Animals Avaliable</h2>
        
        <c:forEach var="animal" items="${animals}">
            <p>
            ${animal.name} - ${animal.species}
            </p>
        </c:forEach>
        <a href="index.jsp">Home</a>
    </body>
</html>
