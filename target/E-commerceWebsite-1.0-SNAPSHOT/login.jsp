<%-- 
    Document   : login
    Created on : 25-Dec-2023, 11:45:29 pm
    Author     : VAISHNAVI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
         <%@include file="components/common_css_js.jsp" %>
         
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class ="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        
                           <div class="card-header" style="background: palevioletred" text-white>
                    
                    
                </div>
                        
                        <div class="card-body">
                           <%@include file="components/message.jsp" %>
                            
                            
                            <form action="newLoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name ="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                <a href="register.jsp" class="text-center d-block">If not register click here</a>                          
    <div class="container text-center">
    <button type="submit" class="btn btn-primary border-0" style="background: violet" >Submit</button>
    <button type="submit" class="btn btn-primary border-0" style="background: violet" >Reset</button>
     </div>
</form>
       
                    
                    
                </div>
               
        </div>
    </body>
</html>
