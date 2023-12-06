<%-- 
    Document   : faqpage
    Created on : Jun 16, 2023, 8:08:38 AM
    Author     : green
--%>

<%@page import="BasicObject.FAQ"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBAccess.ItemDAO"%>
<%@page import="BasicObject.Items"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQs Page</title>
    </head>
    <body>
        <a href="MainServlet?action=11">Home</a>
        <a href="MainServlet?action=7">Submit FAQs</a>
        <hr>

        <form action="MainServlet">
            <%
                ArrayList<Items> list = ItemDAO.getAllItem();
            %>
            <input type="hidden" name="action" value="9">
            <h3>Choose the item to get FAQs: <select name="txtitem" onchange="this.form.submit()">
                    <option disabled selected value> --- select item --- </option>
                    <% for (Items item : list) {
                    %><option value="<%= item.getItemID()%>"><%= item.getItemName()%></option><%
                        }%>
                </select></h3>
        </form>


        <%
            ArrayList<FAQ> listFAQ = (ArrayList<FAQ>) request.getAttribute("result");
            if (listFAQ != null) {
        %>
        <!-- item name -->
        <h3><%= ItemDAO.getItemById((int) request.getAttribute("itemid")).getItemName()%></h3>

        <%
            if (listFAQ.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Content</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (FAQ lFaq : listFAQ) {
                %>
                <tr>
                    <td><%= lFaq.getCustName()%></td>
                    <td><%= lFaq.getCustContent()%></td>
                </tr>                              
                <%
                    }
                %>
            </tbody>
        </table>


        <%
        } else {
        %>
        <h3>No FAQs!!!</h3>
        <%
    }%>

        <%
            }
        %>


    </body>
</html>
