<%-- 
    Document   : animals
    Author     : adinm
--%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.mycompany.animaladoptionfp.Animal" %>

<h2>Available Animals to Adopt</h2>

<c:if test="${empty animals}">
    <p style="color: black; font-family: Arial, sans-serif;">No animals found!</p>
</c:if>

<c:forEach var="animal" items="${animals}">
    <p style="color: black; font-family: Arial, sans-serif;">${animal.id} - ${animal.name} - ${animal.species} - ${animal.age}</p>
</c:forEach>
    
<p>Contact 111-222-3333 or email example@animaladoptioncenter.com for inquires.</p>