<%-- 
    Document   : index
    Created on : Mar 1, 2021, 11:22:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Login Page</h2>
        <form action="MainController" method="POST">
            Username: <input type="text" name="txtUsername" value="${param.txtUsername}" /> 
            <font color="red">
            ${requestScope.INVALID.usernameError}
            <br/>
            </font>
            Password: <input type="password" name="txtPassword" value="" /> 
            <font color="red">
            ${requestScope.INVALID.passwordError}
            </font>
            <br/>
            <input type="submit" value="Login" name="action" />
        </form>
            <a href="insert.jsp">Registration Account</a>
    </body>
</html>
