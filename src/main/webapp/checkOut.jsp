<%@page import="com.mycom.entity.User" %>
<%@page import="com.mycom.DAO.CategoryDao" %>
<%@page import="com.mycom.helper.FactoryProvider" %>
<%@page import="com.mycom.entity.Category" %>
<%@page import="com.mycom.DAO.ProductDao" %>



<%
    User user = (User) session.getAttribute("current-user");

if(user==null){

  session.setAttribute("message","You are not logged in !! Login First to access checkout page..");
  response.sendRedirect("login.jsp");
    return;
    }
    else{
    
    }
    %>
    
    

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
         <%@include file="components/common_css_js.jsp" %>
         <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         
         <div class="container">
             
             <div class="row mt-5">
                 <div class="row-md 6">
                     <!--cart details-->
                     <div class="card">
                     <div class="card-body">
                         <h3 class="text-center my-3">Your Cart</h3>
                         <div class="cart-body">
                     </div>
                     </div>
                     </div>
                 </div>
                 <div class="col-md 6">
                     <!--form-->
                     <div class="card">
                     <div class="card-body">
                         <h3 class="text-center my-3">Your Details For Order</h3>
                         <form action="action">
    <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%= user1.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                             
    <div class="form-group">
    <label for="name">Name</label>
    <input  value="<%= user1.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter-your-name">
    
  </div>
                             
                             <div class="form-group">
    <label for="number">Mobile Number</label>
    <input type="text" class="form-control" id="number" aria-describedby="emailHelp" placeholder="Enter-your-number">
    
  </div>
                             
                             
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
    <textarea value="<%= user1.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter-your-address"></textarea>
  </div>     
                             
                             <div class="container text-center">
                                 <button class="btn btn-outline-success">Order Now</button>
                                 <button class="btn btn-outline-primary">Continue Shopping</button>
                             </div>
                         </form>
                         
                     </div>
                     </div>
                 </div>   
                 
             </div>
         </div>
         
         <%@include file="components/commonModal.jsp" %> 
        
    </body>
</html>
