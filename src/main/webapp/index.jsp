<%-- 
    Document   : index
    Created on : 20-Dec-2023, 4:03:45 pm
    Author     : VAISHNAVI
--%>
<%@page import="com.mycom.helper.FactoryProvider"%>
<%@page import="com.mycom.DAO.ProductDao" %>
<%@page import="com.mycom.entity.Category" %>
<%@page import="com.mycom.DAO.CategoryDao" %>
<%@page import="com.mycom.helper.FactoryProvider" %>
<%@page import="com.mycom.helper.helper1" %>
<%@page import="com.mycom.entity.Product" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce Website</title>
        <%@include file="components/common_css_js.jsp" %>
         <link rel="stylesheet" href="css/style.css">
         <script defer src="javascript/script.js"></script>
         
        
    </head>
    <body>
        
        
        <%@include file="components/navbar.jsp" %>
        
        <section class="main-home"style=" background-image: url(images/img2.jpg);">
            <div class="main-text">
                <h5>Ladies Collection</h5>
                <h1>New Attractive</br>Collection 2024</h1>
                <p>There's Nothing Like Trend</p>
               
            </div>
        </section>
        
        <div class="container-fluid">
        
        <div class="row mt-3 mx-2">
            
            
            
            <% 
               String cat= request.getParameter("category");
               
                
           ProductDao dao= new ProductDao(FactoryProvider.getFactory());
           List<Product> list = dao.getAllProducts();
           CategoryDao cad= new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cad.getCategories();
            
            %>
            
            
            
            
            
            
            
            
            <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group-mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Categories
  </a>
                
                
                
                <%
                     for(Category c:clist){
                     %>
                    
                       <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                    
                    <% 
                        }
                    %>
                </div>
                
            </div>
            <!--show product-->
             <div class="col-md-10">
                 
                 <div class="row-mt-4">
                     
                     <div class="col-md-12">
                         
                         
                         <div class="card-columns">
                             
                             <!--traversing product-->
                             <%
                                 for(Product p:list){
                                 %>
                                 
                                 <div class="card >
                                      
                                     <span class="text-secondary"><%= p.getpDisc() %>% off</span>
                                
                                     
                                     <div class="container text-center">
                                         <img  src="images/product/<%= p.getpPhoto()%>" style="max-height: 270px;max-width: 100%;
                                        width: auto;  " class="card-img-top m-2" alt="alt"/>
                                         
                                     </div>
                                     
                                     <div class="card-body">
                                         <h5 class="card-title"><%= p.getpName() %></h5>
                                         <p class="card-text"> <%=helper1.get10words(p.getPdesc())  %> </p>
                                          
                                        
                                     </div>
                                         <div class="card-footer">
    
                                             <button class="btn text-white" onclick="addToCart(<%= p.getpId() %> , '<%= p.getpName() %>',<%= p.getpPrice() %>) "style="background: purple">Add to Cart</button>
                                             <button class="btn btn-outline-primary text-white" style="background: green">&#8377; 
                                                 <%= p.getpPrice()%></button>
                                             
                                         </div>
                                     
                                 </div>
                                 
                                 
                                 <%  }
                                 %>
                             
                             
                         </div>
                         
                         
                     </div>
                     </div>
                 
                 
            </div>
            
        </div>
    
          
        </div>
        
                                 <%@include file="components/commonModal.jsp" %> 
    </body>
</html>
