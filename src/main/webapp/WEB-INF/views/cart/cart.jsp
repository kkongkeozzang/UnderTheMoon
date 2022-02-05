<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.col-sm-10.cart-item {
	display: flex;
    align-items: center;
}
.nomargin {
	margin:0;
}
.img-box2 {
	display: flex;
    align-items: center;
    text-align: center;
    width: 80px;
    height: 100px;
    justify-content: space-around;
}
.md-img-box img {
	max-height: 100px;
    width: auto;
}
.md-img-box {
	display: flex;
    justify-content: space-around;
    align-items: center;
}
.container {
	margin-top:50px;
	max-width:1300px !important;
}
#footerButton .btn-primary {
	color: #fff;
    background-color: #406882;
    border-color: #406882;
}
#navi .gnb_search {
    top: 16px !important;
}
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
html{
	font-size:16px !important;
}

.count{

 
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  background-color: rgb(233, 233, 233);
  display:flex;
  justify-content:center;
  align-items:center;
   width:130px;
 
}

 .minus{
  width:40px !important;
  height: 40px !important;
 
}

.plus{
  width:40px !important;
  height: 40px !important;
}
.flex{
  display: flex;
}

#totalPrice{
	
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  background-color: rgb(233, 233, 233);
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

.cartPage .btn {
    background-color: #406882 !important;
    border-color: #1A374D !important;
    border-top-color: rgb(26, 55, 77) !important;
    border-right-color: rgb(26, 55, 77) !important;
    border-bottom-color: rgb(26, 55, 77) !important;
    border-left-color: rgb(26, 55, 77) !important;
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
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>

<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>


<div class="container cartPage">
	<h2 class="text-center">장바구니</h2>
			<h3>주문상품</h3>
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%;text-align:center">상품</th>
							 
							<th style="width:8%"></th>
							<th style="width:22%" class="text-center">수량</th>
							<th style="width:10%" class="text-center">가격</th>
						</tr>
					</thead>
					<tbody>
					 <c:forEach var="cart" items="${cartDTO }">
						<tr class="cart-unit">
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs md-img-box">
						           		<div class="img-box">
							           		<div class="img-box2">
							           			<img src="/mdImage/${cart.cart_image}" alt="..." class="img-responsive"/>
							           		</div>
						           		</div>
									</div>
									<div class="col-sm-10 cart-item">
										<h5 id="item" class="nomargin">${cart.cart_item} </h5>
									</div>
								</div>
							</td>
							<td data-th="Price"></td>
							<td data-th="Quantity">
									 <input id="member_username" type=hidden value=${principal.username }>
									 <input type="hidden" class="cart_id" value="${cart.cart_id}">
									<div class="flex">
										<div style="display:inline" class="minus btn btn-primary">-</div>
										<input style="display:inline" type="number" class="count form-control text-center" value="${cart.cart_item_count}" readonly>
										<div  style="display:inline" class="plus btn btn-primary">+</div>
									</div>
							</td>
							<td data-th="Subtotal" class="cart_price text-center">${cart.cart_price}</td>
							<td class="actions" data-th="">						
								<button class="delete btn btn-danger btn-sm">삭제</button>								
							</td>
						</tr>
						</c:forEach>
					</tbody>
					
					<tfoot>
						<tr class="visible-xs">
							
						</tr>
						<tr>
							<td><button id="mdList" class="btn btn-primary "><i class="fa fa-angle-left"></i> 쇼핑계속하기</button></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center">주문금액 <input type="text" class="text-center" id="totalPrice" value="${ totalPrice}" readonly> </td>
							<td><button id="order" class="btn btn-primary">주문하기 <i class="fa fa-angle-right"></i></button></td>
						</tr>
					</tfoot>
				</table>
			
</div>
<script>
$("#mdList").on("click",function(){
	location.href = "/md/list";
})
</script>
</body>
</html>
<!--footer 시작 -->
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>