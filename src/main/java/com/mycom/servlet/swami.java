/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycom.servlet;

import com.mycom.entity.User;
import com.mycom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import jakarta.servlet.http.HttpSession;

import org.hibernate.Transaction; 

/**
 *
 * @author VAISHNAVI
 */
@WebServlet(name = "swami", urlPatterns = {"/swami"})
public class swami extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            try{
               String userName= request.getParameter("user_name");
               String userEmail=request.getParameter("user_email");
               String userPassword=request.getParameter("user_password");
               String userPhone=request.getParameter("user_phone");
               String userAdd=request.getParameter("user_add");
               
               
               
//               validations
             if(userName.isEmpty()){
                 out.println("Name is blank");
                 return;
             }
             
             
//             creating user object to store data

             User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAdd,"normal");
             
               Session hibernateSession =FactoryProvider.getFactory().openSession();
               Transaction tx = hibernateSession.beginTransaction();
               
              int userId=(int) hibernateSession.save(user);
                        
                
               tx.commit();
               hibernateSession.close();
               
            HttpSession hs= request.getSession();
           hs.setAttribute("message", "Registration Successful !! " + userId);
           response.sendRedirect("register.jsp");
           return;
            
            }catch(Exception e){
                e.printStackTrace();
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
