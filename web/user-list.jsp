<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/19/2021
  Time: 9:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Mannagement Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
          crossorigin="anonymous">

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
<div class="row">
    <div class="Container">
        <h3 class="text-center"> list of user</h3>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add new User</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td>
                        <c:out value="${user.id}"/>
                    </td> <td>
                        <c:out value="${user.name}"/>
                    </td> <td>
                        <c:out value="${user.email}"/>
                    </td> <td>
                        <c:out value="${user.country}"/>
                    </td>
                    <td><a href="edit?id=<c:out value="$(user.id"/>">Edit</a>
                    <a href="delete?id=<c:out value="${user.id}"/>"></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
