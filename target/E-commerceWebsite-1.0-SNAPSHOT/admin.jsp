<%@page import="com.mycom.entity.User" %>
<%@page import="com.mycom.DAO.CategoryDao" %>
<%@page import="com.mycom.helper.FactoryProvider" %>
<%@page import="com.mycom.entity.Category" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="com.mycom.helper.helper1" %>
<%
User user = (User) session.getAttribute("current-user");

if(user==null){

  session.setAttribute("message","You are not logged in !! Login First..");
  response.sendRedirect("login.jsp");
    return;
    }else
    {
    if(user.getUserType().equals("normal"))
    {
    session.setAttribute("message","You are not admin ! Do not access this page");
    response.sendRedirect("login.jsp");
    return;
    }
    }
%>

<%
                 CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                 List<Category> list = cdao.getCategories();
                 
//getting count
               Map<String,Long> m = helper1.getCount(FactoryProvider.getFactory());
                
                 
                  %>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
         <%@include file="components/common_css_js.jsp" %>
         <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container admin">
             <div class="container-fluid-mt-3">
                 
                 <%@include file="components/message.jsp" %>
             </div>
             
             
             
             <div class="row mt-3">
                 <!--first col-->
                 <div class="col-md-4">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="images/icons/group.png" alt=""> 
                             </div>
                             <h1><%= m.get("userCount")%></h1>
                             <h1 class="text-uppercase text-muted">Users</h1>
                         </div>
                     </div>  
                     
                 </div>
                  <!--second col-->
                 <div class="col-md-4">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="images/icons/list.png" alt=""> 
                             </div>
                             <h1><%= list.size()%></h1>
                             <h1 class="text-uppercase text-muted">Category</h1>
                         </div>
                     </div> 
                     
                 </div>
                  <!--thirdbox-->
                 <div class="col-md-4">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="images/icons/category.png" alt=""> 
                             </div>
                             <h1><%= m.get("productCount")%></h1>
                             <h1 class="text-uppercase text-muted">Products</h1>
                         </div>
                     </div> 
                     
                 </div>
                 
             </div>
             
            <div class="row mt-3">
                 <!--first col-->
                 <div class="col-md-6">
                     <div class="card" data-toggle="modal" data-target="#add-category-modal">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="images/icons/ecommerce.png" alt=""> 
                             </div>
                             <p class="mt-2">click here to add category</p>
                             <h1 class="text-uppercase text-muted">Add category</h1>
                         </div>
                     </div>  
                     
                 </div>
                  <!--second col-->
                 <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="images/icons/plus.png" alt=""> 
                             </div>
                             <p class="mt-2">click here to add products</p>
                                   <h1 class="text-uppercase text-muted">Add Product</h1>
                         </div>
                     </div>
             
             
         </div>
                  
                  <!--start modal-->
                  
                  <!-- Button trigger modal -->


<!-- Category Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          
          <form action="productOperationServlet" method="post">
              <input type="hidden" name="operation" value="addcategory">
              
              
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required>
                  
              </div>
              
              <div class="form-group">
                  <textarea style="height:300px" class="form-control" placeholder="Enter category description" name="catDescription" placaeholder="Categiry description" required></textarea>
                  
              </div>
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
         </form>
     </div>
   </div>
  </div>
</div>
                  
<!--end modal-->


<!--Product model start-->

<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Products Details</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          
          <form action="productOperationServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addproduct">
              
              <div class="form-group">
                  <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required>
               </div>
              
              <div class="form-group">
                  <textarea style="height:150px" class="form-control" placeholder="Enter Product description" name="pdesc" placaeholder="Categiry description" required></textarea>
                  
              </div>
              <!--product price-->
              <div class="form-group">
                  <input type="number" class="form-control" name="pPrice" placeholder="Enter price here" required> 
              </div>
              
              <!--product dicsount-->
              <div class="form-group">
                  <input type="number" class="form-control" name="pDisc" placeholder="Product discount" required> 
              </div>
              <!--product Quantity-->
              <div class="form-group">
                  <input type="number" class="form-control" name="pQuantity" placeholder="Product quantity" required> 
              </div>
              
              
              
              
              
              <!--product category-->
              <div class="form-group">
                  <select name="catId"class="form-control" id="">
                      
                      <%
                          for(Category c :list){
                          
                         
                          %>
                          <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle() %></option>
                      <% } %>
                  </select> 
                  
              </div>
              <div class="form-group">
                  <label for="pPic">Select Product Picture</label>
                  </br>
                  <input type="file" name="pPic" required/>
              </div>
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Products</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
                          
         </form>
     </div>
   </div>
  </div>
</div>
              

<!--product model end-->
                  
                  
         
      <%@include file="components/commonModal.jsp" %>    
        
    </body>
</html>
