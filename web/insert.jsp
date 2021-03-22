<%-- 
    Document   : register
    Created on : Mar 5, 2021, 11:14:17 AM
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
        <h1>Create New Account</h1>
        <form action="MainController" method="POST">
            Username: <input type="text" name="txtUsername" value="${param.txtUsername}" />
            <font color="red">
            ${requestScope.INVALID.usernameError}
            </font>
            <br/>
            Fullname: <input type="text" name="txtFullname" value="${param.txtFullname}" />
            <font color="red">
            ${requestScope.INVALID.fullnameError}
            </font>
            <br/>
            Password <input type="password" name="txtPassword" value="" />
            <font color="red">
            ${requestScope.INVALID.passwordError}
            </font>
            <br/>
            Confirm: <input type="password" name="txtConfirm" value="" />
            <font color="red">
            ${requestScope.INVALID.confirmPassword}
            </font>
            <br/>
            Role: <select name="cboRole">
                <option>admin</option>
                <option>user</option>
            </select>
            <br/>
            <input type="submit" name="action" value="Create" />
        </form>
    </body>
</html>
