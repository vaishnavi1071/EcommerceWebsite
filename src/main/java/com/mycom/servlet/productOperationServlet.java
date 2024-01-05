/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycom.servlet;

import com.mycom.entity.Category;
import com.mycom.entity.Product;
import com.mycom.DAO.ProductDao;
import com.mycom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mycom.DAO.CategoryDao;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

 
@MultipartConfig
@WebServlet(name = "productOperationServlet", urlPatterns = {"/productOperationServlet"})
public class productOperationServlet extends HttpServlet {

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
            
           String op=request.getParameter("operation");
           if(op.trim().equals("addcategory")){
               
           String title=  request.getParameter("catTitle");
           String description=  request.getParameter("catDescription");
           
               Category category = new Category();
               category.setCategoryTitle(title);
               category.setCategoryDesc(description);
               
//               save category
               CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
              int catId= categoryDao.saveCategory(category);
              
              
             HttpSession httpsession = request.getSession();
             httpsession.setAttribute("message", "Category added successfully!!  : CategoryId " +catId );
             response.sendRedirect("admin.jsp");
             return;
              
            
               
           }else if(op.trim().equals("addproduct")){
              String pName= request.getParameter("pName");
              String pDesc = request.getParameter("pdesc");
              int pPrice=Integer.parseInt(request.getParameter("pPrice"));
              int pDisc= Integer.parseInt(request.getParameter("pDisc"));
              int pQuantity= Integer.parseInt(request.getParameter("pQuantity"));
              int catId= Integer.parseInt(request.getParameter("catId"));
              Part part = request.getPart("pPic");
              
             Product p = new Product();
             p.setpName(pName);
             p.setPdesc(pDesc);
             p.setpPrice(pPrice);
             p.setpDisc(pDisc);
             p.setpQuantity(pQuantity);
             p.setpPhoto(part.getSubmittedFileName());
             
             
//             get category by id

           CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
           Category category = cdao.getCategoryById(catId);
           
           p.setCategory(category);
           
//           product save

          ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
          pdao.saveProduct(p);


          
//          pic upload

       String path = getServletContext().getRealPath("images")+File.separator + "product" + File.separator+part.getSubmittedFileName();
       
       System.out.println(path+"hello");
       try{
       
       FileOutputStream fos= new FileOutputStream(path);
       
       InputStream is = part.getInputStream();
       
//       reading data
          byte []data = new byte[is.available()];
          is.read(data);
          
//          writing data
          fos.write(data);
          fos.close();
       } catch(Exception e){
           e.printStackTrace();
       }
       
           
          
          
            HttpSession httpsession = request.getSession();
             httpsession.setAttribute("message", "Product added successfully!! ");
             response.sendRedirect("admin.jsp");
           
             
              
           }
            
            
            
            
            
            
          
//            fetching category data
          
           
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
