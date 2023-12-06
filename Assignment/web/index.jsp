<%-- 
    Document   : home
    Created on : Aug 17, 2023, 5:27:31 PM
    Author     : green
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
         <h1>Login</h1>
        
        <form action="MainServlet?action=10" method="POST">
            Username: <input type="text" name="txtusername" value="user"/>
            Password: <input type="password" name="txtpassword" value="user"/>
            
            <input type="submit" value="Login"/>
        </form>
        
        <h2>${error}</h2>
        
    </body>
</html>