<%-- 
    Document   : submitfaq
    Created on : Jun 16, 2023, 8:36:41 AM
    Author     : green
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DBAccess.ItemDAO"%>
<%@page import="BasicObject.Items"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit FAQs Page</title>
    </head>
    <body>
        <a href="MainServlet?action=6">Back</a><hr>
        <%
            ArrayList<Items> list = ItemDAO.getAllItem();
        %>
        <form action="MainServlet">
            <h3>Your name: <input type="text" name="txtname"></h3>
            <h3>What are you concerned about our product?</h3>
            <textarea required="" name="txtcontent" style=" width: 300px; height: 150px;"></textarea><br>
            <select name="txtitem" required="">
                <option disabled selected value> --- select item --- </option>
                <% for (Items item : list) {
                %><option value="<%= item.getItemID()%>"><%= item.getItemName()%></option><%}%>
            </select>
            <input type="hidden" value="8" name="action">
            <input type="submit" value="Send">
        </form>
    </body>
</html>
