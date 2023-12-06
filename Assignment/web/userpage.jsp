<%-- 
    Document   : userpage
    Created on : Aug 18, 2023, 5:32:58 PM
    Author     : Admin
--%>

<%@page import="BasicObject.Account"%>
<%@page import="DBAccess.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="MainServlet?action=11">Home</a><br>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <%
                    ArrayList<Account> list = AccountDAO.getAll();
                    if (list != null && list.size() > 0) {
                        for (Account acc : list) {
                %>
                <tr>
                    <td><%= acc.getId()%></td>
                    <td><%= acc.getUsername()%></td>
                    <td><%= acc.getPassword()%></td>
                    <td>
                        <%--  <a href="MainServlet?action=1&txtid=<%= acc.getItemID()%>">Edit</a> --%>
                        &ensp;<a href="MainServlet?action=13&txtid=<%= acc.getId()%>" onclick="return warning()">Delete</a>
                    </td>

                </tr>
                <%
                    }
                    String error = (String) request.getAttribute("error");
                %>
                <% if (error != null) {
                %>
            <h3> <%=error%> </h3>
            <%
                    }%>
            <%
            } else {
            %>
            <h3>No data!!!</h3>
            <%
                }
            %>

        </tbody>
    </table>
</body>
</html>
