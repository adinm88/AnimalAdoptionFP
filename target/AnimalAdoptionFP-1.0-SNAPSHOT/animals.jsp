<%-- 
    Document   : animals
    Author     : adinm
--%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.mycompany.animaladoptionfp.Animal" %>

]

<div class="container mt-4">

    <h2 class="text-center">Available Animals to Adopt</h2>

    <c:if test="${empty animals}">
        <div class="alert alert-warning">No animals found!</div>
    </c:if>

    <div class="row">
        <c:forEach var="animal" items="${animals}">
            <div class="col-md-4 mb-3">
                <div class="card p-3">
                    <h5>${animal.name}</h5>
                    <p>${animal.species}</p>
                    <p>Age: ${animal.age}</p>

                    <c:if test="${sessionScope.role == 'ADMIN'}">
                        <a class="btn btn-danger btn-sm"
                           href="AnimalServlet?action=delete&id=${animal.id}">
                            Delete
                        </a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

</div>
    
<p>Contact 111-222-3333 or email example@animaladoptioncenter.com for inquires.</p>