/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycom.servlet;

import com.mycom.DAO.UserDao;
import com.mycom.entity.User;
import com.mycom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author VAISHNAVI
 */
@WebServlet(name = "newLoginServlet", urlPatterns = {"/newLoginServlet"})
public class newLoginServlet extends HttpServlet {

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
                String email = request.getParameter("email");
          String password = request.getParameter("password");
          
         UserDao userDao = new UserDao(FactoryProvider.getFactory());
        User user = userDao.getuserbyemailandpassword(email, password);
//        System.out.println(user);
         

        HttpSession httpsession = request.getSession();
        
         if(user==null){
           
          httpsession.setAttribute("message","Invalid details !!" );
          response.sendRedirect("login.jsp");
          return;
         }else{
            
             
             out.println("<h1>welcome "+user.getUserName()+"</h1>");
             
             httpsession.setAttribute("current-user", user);
             
             if(user.getUserType().equals("admin")){
                 response.sendRedirect("admin.jsp");
             }
                 else if(user.getUserType().equals("normal"))
                 {
                 response.sendRedirect("normal_user.jsp");
                   }
              
                else{
                 out.println("We have not identified user type");
             }

          }
         
         
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
