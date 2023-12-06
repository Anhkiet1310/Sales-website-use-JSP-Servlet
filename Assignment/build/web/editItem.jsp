<%-- 
    Document   : editItem
    Created on : Jun 13, 2023, 8:30:44 PM
    Author     : green
--%>

<%@page import="DBAccess.ItemDAO"%>
<%@page import="BasicObject.Items"%>
<%@page import="DBAccess.CateDAO"%>
<%@page import="BasicObject.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <a href="MainServlet?action=0">Back</a><hr>
        <% int id =Integer.parseInt(request.getParameter("txtid"));
            Items item =ItemDAO.getItemById(id); %>
            <form action="MainServlet">
                <table border="1">
            <tr>
                <th>ID</th>
                <td><input type="text" required="" value="<%= item.getItemID() %>" name="txtid"></td>
            </tr>
            <tr>
                <th>Image</th>
                <td><input type="text" required="" value="<%= item.getImage()%>" name="txtimage"></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" required="" value="<%= item.getItemName()%>" name="txtname"></td>
            </tr>
            <tr>
                <th>Price</th>
                <td><input type="text" required="" value="<%= item.getPrice()%>" name="txtprice"></td>
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
        <input type="hidden" value="<%=id%>" name="itemupdate">
        <input type="hidden" value="2" name="action">
        <input type="submit" value="Save" onclick="return warning()">
            </form>

    </body>
    <script>
        function warning(){
            var ans=window.confirm("Do you want to save?");
            if(ans){
                return true;
            }
            return false;
        }
    </script>
</html>
