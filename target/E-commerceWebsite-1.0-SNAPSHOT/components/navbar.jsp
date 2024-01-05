
<%@page import="com.mycom.entity.User" %>
<%
    User user1 = (User) session.getAttribute("current-user");
    %>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="images/icons/illustrator.png" width="30px" height="30px" alt="alt"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="about.jsp">About <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#"></a>
      </li>
    </ul>
    
      
          
         
          <ul class="navbar-nav ml-auto">
                               <li class="nav-item active">
                                   <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><img class="img1" src="images/icons/ecommerce.png" width="55px" height="35px" alt="alt"/><span class ="ml-0 cart-tems" style="font-size: 20px">()</span></a>
                                                                                                                                                                
                                                                                                               
                                    
      </li>
              
              
              <%
                  if(user1==null){
                 %>
                       <li class="nav-item active">
             <a class="nav-link" href="login.jsp">Login </a>
      </li>
      
      
       <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register </a>
      </li>
                <%  }else{
                 %>
                                  <li class="nav-item active">
                                      <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal_user.jsp"%><%= user1.getUserName()%> </a>
      </li>
      
      
       <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">Logout </a>
      </li>
                 
                 <% }
                  %>
       
           
           
      
             
        
         
      </ul>

  </div>  
  </div>
        
  
  
</nav>
