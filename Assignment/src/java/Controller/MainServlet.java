/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

enum NameFunct{
    itemPage(0),editItemPage(1),editItem(2),deleteItem(3),addItemPage(4),addItem(5),
    faqpage(6),submitFAQpage(7),submitFAQ(8),loadFAQs(9), login(10), homePage(11),
    userPage(12), deleteAccount(13);
     private int value;

        private NameFunct(int value) {
            this.value = value;
        }
        
        String funct() {
            return String.valueOf(this.value);
        }
        
}

public class MainServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String path="index.jsp";
            String a = request.getParameter("action");
            System.out.println(a);
            if(a==null || a.isEmpty()){
                path="index.jsp";
            }else if(a.equals(NameFunct.itemPage.funct())){
                //case 0
                path="itempage.jsp";
            }else if(a.equals(NameFunct.editItemPage.funct())){
                //case 1
                path="editItem.jsp";
            }else if(a.equals(NameFunct.editItem.funct())){
                //case 2
                path="editItem";
            }else if(a.equals(NameFunct.deleteItem.funct())){
                //case 3
                path="deleteItem";
            }else if(a.equals(NameFunct.addItemPage.funct())){
                //case 4
                path="addItem.jsp";
            }else if(a.equals(NameFunct.addItem.funct())){
                //case 5
                path="addItem";
            }else if(a.equals(NameFunct.faqpage.funct())){
                //case 6
                path="faqpage.jsp";
            }else if(a.equals(NameFunct.submitFAQpage.funct())){
                //case 7
                path="submitfaq.jsp";
            }else if(a.equals(NameFunct.submitFAQ.funct())){
                //case 8
                path="submitfaq";
            }else if(a.equals(NameFunct.loadFAQs.funct())){
                //case 9
                path="loadFAQ";
            }else if(a.equals(NameFunct.login.funct())){
                //case 10
                path="login";
            }else if(a.equals(NameFunct.homePage.funct())){
                //case 11
                path="homepage.jsp";
            }else if(a.equals(NameFunct.userPage.funct())){
                //case 12
                path="userpage.jsp";
            }else if(a.equals(NameFunct.deleteAccount.funct())){
                //case 13
                path="deleteAccount";
            }
           
            
            
            
            request.getRequestDispatcher(path).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
