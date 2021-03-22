<%-- 
    Document   : admin
    Created on : Mar 3, 2021, 10:49:28 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome, ${sessionScope.USER}</h1>
        <h2>Search User</h2>
        <form action="MainController" method="POST">
            Fullname: <input type="text" name="txtSearch" value="" />
            <input type="submit" value="Search" name="action" />
        </form>
        <c:if test="${requestScope.INFO != null}">
            <c:if test="${not empty requestScope.INFO}" var="checkList">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Fullname</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${requestScope.INFO}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.username}</td>
                            <td>${dto.fullname}</td>
                            <td>${dto.role}</td>
                            <td>
                                <c:url var="deleteLink" value="MainController">
                                    <c:param name="action" value="Delete"/>
                                    <c:param name="id" value="${dto.username}"/>
                                    <c:param name="txtSearch" value="${param.txtSearch}"/>
                                </c:url>
                                <a href="${deleteLink}">Delete</a>
                            </td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="txtID" value="${dto.username}" />
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                <input type="submit" name="action" value="Edit" />
                                </form>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
            
            <c:if test="${!checkList}">
                <font color="red">
                    No record found!
                </font>
            </c:if>
        </c:if>
    </body>
</html>
