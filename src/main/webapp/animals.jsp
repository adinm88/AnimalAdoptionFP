<%-- 
    Document   : animals
    Author     : adinm
--%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.mycompany.animaladoptionfp.Animal" %>

<h2>Available Animals</h2>

<c:if test="${empty animals}">
    <p>No animals found!</p>
</c:if>

<c:forEach var="animal" items="${animals}">
    <p>${animal.id} - ${animal.name} - ${animal.species} - ${animal.age}</p>
</c:forEach>