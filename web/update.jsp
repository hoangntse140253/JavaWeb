<%-- 
    Document   : update
    Created on : Mar 5, 2021, 10:49:40 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Page</h1>
        <form action="MainController" method="POST">
            Username <input type="text" name="txtUsername" value="${requestScope.DTO.username}" readonly="true" />
            Fullname <input type="text" name="txtFullname" value="${requestScope.DTO.fullname}" />
            <font color="red">
            ${requestScope.INVALID.fullnameError}
            </font>
            <br/>
            Role: <select name="cboRole">
                <option 
                    <c:if test="${requestScope.DTO.role eq 'admin'}">
                         value="admin" selected="true"
                    </c:if>
                    >admin</option>   
                <option  <c:if test="${requestScope.DTO.role eq 'user'}">
                     value="user" selected="true"
                    </c:if>
                    >user</option>
            </select>
            <br/>
            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
            <input type="submit" value="Update" name="action" />
        </form>
    </body>
</html>
