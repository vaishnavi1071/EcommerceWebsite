<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        
        <div class="container-fluid">
        <div class="row mt-5">
        <div class="col-mod-5 offset-md-5">
            <div class="card" style="box-shadow: 10px 10px 5px gray">
                
                <%@include file="components/message.jsp" %>
                <div class="card-body px-5" style="background: linear-gradient(to right,#9796f0,#fbc7d4)">
                    
                    <div class="container text-center">
                        <img src="" style="max-width:100px"; class="img-fluid" alt="icon">
                    </div>
       
            <h3 class="text-center my-3">Sign Up Here!!</h3>       
    <form action="swami" method="post">
        
        
   <div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
   </div>
                
     <div class="form-group">
    <label for="email">User Email</label>
    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter valid email id">
   </div>
                
     <div class="form-group">
    <label for="password">User Password</label>
    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
    <small id="passwordHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
    </div> 
    
                
    <div class="form-group">
    <label for="phone">User Phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="10 digits only">
   </div>  
                
      <div class="form-group">
          <label for="address">User Address</label>
          <textarea name="user_add" style ="height:150px" class="form-control" placeholder="Enter your address"></textarea>
   </div>     
                
                <div class="container text-center">
                    <button class="btn btn-outline-success">Register</button>
                    <button class="btn btn-outline-warning">Reset</button>
                </div>
                    
                    
                </form>
                </div>
            </div>
            </div>
        </div>
        </div>
    </body>
</html>
