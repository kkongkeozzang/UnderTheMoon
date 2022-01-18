<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
<script>

$(function(){
	
	
	$("body").on("click",".delete",function(){
		
		let cart_id = $(this).closest(".cart-unit").find(".cart_id").val();
		
		let totalPrice = $("#totalPrice").val();
		let totalPrice_int = Number(totalPrice);
		
		let cart_price = $(this).closest(".cart-unit").find(".cart_price").html();
	    	let cart_price_int = Number(cart_price);
	    	
	    	 $(this).closest(".cart-unit").remove();
	    	 
		$.ajax({
	  	  type: 'delete',
	        url:"/cart/rest/deleteCart/"+cart_id,
	        dataType:"json"
	     }).done(function(resp){
	    	
	    	 
	    	  alert("선택하신 상품이 삭제되었습니다.")  
	    	  $("#totalPrice").attr('value', totalPrice_int-cart_price_int);
	     })
	   })
	   
	  $(".plus").on("click",function(){
		  
		  let cart_id = $(this).closest(".cart-unit").find(".cart_id").val();
		
		  let totalPrice = $("#totalPrice").val();
			let totalPrice_int = Number(totalPrice);
		  
			let cart_price = $(this).closest(".cart-unit").find(".cart_price").html();
	    	let cart_price_int = Number(cart_price);
	    	
	     let item_count = $(this).closest(".cart-unit").find(".count").val();
	     	let item_count_int = Number(item_count);
	    
	     let singleItemPrice = cart_price_int/item_count_int;
	     	let singleItemPriceInt = Number(singleItemPrice);
	     	
	     	 $(this).closest(".cart-unit").find(".count").attr('value', item_count_int+1);
	     	 $(this).closest(".cart-unit").find(".cart_price").text(cart_price_int+singleItemPriceInt);
	    
		$.ajax({
	  	  type: 'patch',
	        url:'/cart/rest/addItemCount/'+cart_id,
	        dataType:"json"
	     }).done(function(resp){
	    	
	    	  $("#totalPrice").val(totalPrice_int+singleItemPriceInt);
	     })
	   })
	   
	   $(".minus").on("click",function(){
		   
		   let cart_id = $(this).closest(".cart-unit").find(".cart_id").val();
		
		   let totalPrice = $("#totalPrice").val();
			let totalPrice_int = Number(totalPrice);
		   
			let cart_price = $(this).closest(".cart-unit").find(".cart_price").html();
	    	let cart_price_int = Number(cart_price);;
	    	
	    	let item_count = $(this).closest(".cart-unit").find(".count").val();
	     	let item_count_int = Number(item_count);
	    
	     let singleItemPrice = cart_price_int/item_count_int;
	     	let singleItemPriceInt = Number(singleItemPrice);
	     	if(item_count_int<2){
				   alert("최소주문은 1개입니다.");
				   return false;
			   }else{
	     	 $(this).closest(".cart-unit").find(".count").attr('value', item_count_int-1);
	    	 $(this).closest(".cart-unit").find(".cart_price").text(cart_price_int-singleItemPriceInt);
		   }
		$.ajax({
	  	  type: 'patch',
	        url:"/cart/rest/subtractItemCount/"+cart_id,
	        dataType:"json"
	     }).done(function(resp){
	    	
	    	  $("#totalPrice").val(totalPrice_int-singleItemPriceInt);
	     })
	   })
	   //주문서로 이동하는곳.
	   $("#order").on("click",function(){
			$.ajax({
		  	  type: 'get',
		        url:"/purchase/purchase",
		        data: {
		      	  member_username: $("#member_username").val(),
		          order_detail_price: $("#totalPrice").val()
		        }
		     }).done(function(resp){
		    	  
		    		 document.location.href="/purchase/purchase";
		    		
		     })
		   })
	})
</script>
</head>
<body>
<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">상품</th>
							 
							<th style="width:8%"></th>
							<th style="width:22%" class="text-center">수량</th>
							<th style="width:10%">가격</th>
						</tr>
					</thead>
					<tbody>
					 <c:forEach var="cart" items="${cartDTO }">
						<tr class="cart-unit">
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="${cart.cart_image}" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 id="item" class="nomargin">${cart.cart_item} </h4>
									</div>
								</div>
							</td>
							<td data-th="Price"></td>
							<td data-th="Quantity">
								<button class="plus" type ="button">+</button>
									 <input type="hidden" class="cart_id" value="${cart.cart_id}">
									<input type="number" class="count form-control text-center" value="${cart.cart_item_count}" readonly>
								<button class="minus" type="button">-</button>
							</td>
							<td data-th="Subtotal" class="cart_price text-center">${cart.cart_price}</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="delete btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
						</tr>
						</c:forEach>
					</tbody>
					
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> 쇼핑계속하기</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center">Total <input type="text" id="totalPrice" value="${ totalPrice}" readonly> </td>
							<td><a href="#" class="btn btn-success btn-block">주문하기 <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
</div>
</body>
</html>