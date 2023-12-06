<%-- 
    Document   : itempage
    Created on : Jun 13, 2023, 8:31:36 AM
    Author     : green
--%>

<%@page import="DBAccess.CateDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BasicObject.Items"%>
<%@page import="DBAccess.ItemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Page</title>
    </head>
    <body>
        <a href="MainServlet?action=11">Home</a><br>
        <a href="MainServlet?action=4">Add item</a>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

        <% 
        ArrayList<Items> list = ItemDAO.getAllItem();
        if(list!=null && list.size()>0){
        for(Items item:list){
            %>
            <tr>
                    <td><%= item.getItemID() %></td>
                    <td>
                        <img src="<%= item.getImage() %>" width="200" height="200" />
                    </td>
                    <td><%= item.getItemName()%></td>
                    <td><%= item.getPrice()%></td>
                    <td><%= CateDAO.getCateByID(item.getCateID()).getCateName() %></td>
                    <td><a href="MainServlet?action=1&txtid=<%= item.getItemID() %>">Edit</a>
                        &ensp;<a href="MainServlet?action=3&txtid=<%= item.getItemID() %>" onclick="return warning()">Delete</a>
                    </td>
                </tr>
            <%
        }
String error= (String)request.getAttribute("error");
%>
            <% if(error!=null){
                %>
            <h3> <%=error%> </h3>
                <%
            }%>
<%
}else{
%>
            <h3>No data!!!</h3>
<%
}
        %>
        
        </tbody>
        </table>
    </body>
    <script>
        function warning(){
            var ans=window.confirm("Are you sure to delete?");
            if(ans){
                return true;
            }
            return false;
        }
    </script>
</html>
