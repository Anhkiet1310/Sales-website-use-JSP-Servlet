<%-- 
    Document   : addItem
    Created on : Jun 16, 2023, 7:30:55 AM
    Author     : green
--%>

<%@page import="DBAccess.CateDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BasicObject.Categories"%>
<%@page import="BasicObject.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="MainServlet?action=0">Back</a><hr>
         <form action="MainServlet">
                <table border="1">
            <tr>
                <th>ID</th>
                <td><input type="text" required="" value="" name="txtid"></td>
            </tr>
            <tr>
                <th>Image</th>
                <td><input type="text" required="" value="" name="txtimage"></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" required="" value="" name="txtname"></td>
            </tr>
            <tr>
                <th>Price</th>
                <td><input type="text" required="" value="" name="txtprice"></td>
            </tr>
            <tr>
                <th>Category</th>
                <td><select name="txtcateid">
                        <% 
                        ArrayList<Categories> list=CateDAO.getAllCategorieses();
                        for(Categories c:list){
                            %>
                            <option value="<%= c.getCateID()%>"><%= c.getCateName() %></option> 
                        <%
                        }
                        %>
                    </select>
                </td>
            </tr>
        </table>
        <input type="hidden" value="5" name="action">
        <input type="submit" value="Create">
            </form>
    </body>
</html>
