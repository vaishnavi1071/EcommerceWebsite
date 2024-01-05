console.log("hello");

function addToCart(pid,pname,price){
   let cart= localStorage.getItem("cart");
   if(cart == null){
//       no card yet
        
        let products=[];
        let product = {ProductId:pid,ProductName:pname,ProductQuantity:1,ProductPrice:price};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
//        console.log("product is added first time");
        showToast("Product is added to cart");
        
        
   }else{
      let pcart = JSON.parse(cart); 
     let oldProduct =  pcart.find((item)=> item.ProductId == pid);
     if(oldProduct)
     {
//         we have to increase the quantity
           
       
       oldProduct.ProductQuantity = oldProduct.ProductQuantity +1 ;
       pcart.map((item)=>{
           if(item.ProductId == oldProduct.ProductId){
               item.ProductQuantity = oldProduct.ProductQuantity;
           }
       });
       localStorage.setItem("cart",JSON.stringify(pcart));
       console.log("product increased");
            showToast(oldProduct.ProductName + "Product quantity is increased !!" + oldProduct.ProductQuantity);
       
         
     }else{
//       we have to add quantity
      
      
      let product = {ProductId:pid,ProductName:pname,ProductQuantity:1,ProductPrice:price};
      pcart.push(product);
      localStorage.setItem("cart",JSON.stringify(pcart));
      console.log("product is added");
            showToast("Product is added to cart");
     }
 }
    
    
}

//update cart
function updateCart()
{
  let cartString = localStorage.getItem("cart");
  let cart = JSON.parse(cartString);
  
  console.log("cart is empty");
  if(cart==null || cart.length==0){
      $(".cart-items").html("(0)");
      $(".cart-body").html("<h3> Cart does not have any items </h3>");
      $(".checkout-btn").attr('disabled',true);
      
  }else{
      
//      there is some in cart to show

     $(".cart-tems").html(`(${cart.length})`);
     let table = `
     <table class ='table'>
     <thead class = 'thead-light'>
     <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        
        </tr>
`;
        
       let totalPrice = 0 
        
        cart.map((item)=>{
          
           table += 
           `<tr>
           <td>${item.ProductName}</td>
            <td>${item.ProductPrice}</td>
            <td>${item.ProductQuantity}</td>
            <td>${item.ProductQuantity * item.ProductPrice}</td>
            <td><button class='btn-btn-danger btn-sm' onclick ="deleteItemCart(${item.ProductId})">Remove</button></td>
            </tr>
            `;
            
            totalPrice += item.ProductPrice * item.ProductQuantity;
            
        });
        
        
        
        
        
        table = table + `
        <tr><td colspan = '5' class ='text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td><tr>
</table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
  }
  }
  
//  delete item
  function deleteItemCart(pid){
    let cart=  JSON.parse(localStorage.getItem('cart'));
   let newCart = cart.filter((item)=> item.ProductId != pid);
   localStorage.setItem('cart',JSON.stringify(newCart));
   
    updateCart();
    showToast("Product removed from cart");
           
  }
  
  
$(document).ready(function (){
    updateCart();
});


function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    }, 2000);
}

function goToCheckout(){
    window.location = "checkOut.jsp";
}