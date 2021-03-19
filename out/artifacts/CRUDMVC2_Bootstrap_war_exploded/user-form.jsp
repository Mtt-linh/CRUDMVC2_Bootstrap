<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/19/2021
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management application</title>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navdrk" style="...">
        <div >
            <a href="" class="navbar-brand">user management App</a>
        </div>
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a> </li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user!=null}">
                <form action="update" method="post"></form>
            </c:if>
            <c:if test="${user==null}">
                <form action="insert" method="post"></form>
            </c:if>
            <caption>
                <h2>
                    <c:if test="${user!=null}">edit user</c:if>
               <c:if test="${user!=null}">add new user</c:if>
                </h2>
            </caption>
            <c:if test="${user!=null}">
                <input type="hidden" name="id" value="<c:out value="${user.id}"/>"/>
            </c:if>
            <fieldset class="form-group">
                <label>User name</label>
                <input type="text" value="<c:out value="${user.name}"/>"
                class="form-control" name=" name" required="required">
            </fieldset>
            <fieldset class="form-group">
                <label>User email</label>
                <input type="text" value="<c:out value="${user.email}"/>"
                       class="form-control" name=" email" >
            </fieldset>
            <fieldset class="form-group">
                <label>User country</label>
                <input type="text" value="<c:out value="${user.country}"/>"
                       class="form-control" name=" country" >
            </fieldset>
            <button type="submit" class="btn btn-success">save</button>
        </div>
    </div>
</div>
</body>
</html>
