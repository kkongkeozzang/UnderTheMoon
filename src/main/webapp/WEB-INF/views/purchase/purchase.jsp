<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script> 
<link rel="stylesheet" href="/resources/purchase/css/purchase.css">
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
table {
	width:100%; !important;
}
.addBtn {
	display:inline-block; !important;
	width:60%; !important;
}
.form-control {
	width:60%; !important;
}
.form-control.addBtn {
	width:60%; !important;
}
#orderitem_money_info {
    width: 80%;
    padding: 17px 16px 18px 18px;
    background: #fafafa;
    border: 1px solid #f2f2f2;
}
#orderitem_money_info .fst {
    padding-top: 0;
    padding-bottom: 4px;
}
#orderitem_money_info .amount {
    overflow: hidden;
    padding-top: 12px;
    letter-spacing: -0.5px;
}
#orderitem_money_info .tit {
    float: left;
    width: 96px;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
#orderitem_money_info .price {
    float: right;
    width: 144px;
    text-align: right;
}
  /* 결제금액_sticky */
  .tax_absolute{height:600px;}
  .tax_absolute .inner_sticky{position:sticky;top:4px;}
  #orderitem_money_info{width:100%;padding:17px 16px 18px 18px;background:#fafafa;border:1px solid #f2f2f2}
  #orderitem_money_info .amount{overflow:hidden;padding-top:12px;letter-spacing:-0.5px}
  #orderitem_money_info .fst{padding-top:0;padding-bottom:4px}
  #orderitem_money_info .lst{margin:17px 0 0 0;padding-top:15px;border-top:1px solid #eee}
  #orderitem_money_info .lst .tit{padding-top:2px}
  #orderitem_money_info .tit,
  #orderitem_money_info .lst .price .won,
  #orderitem_money_info .price{font:normal 16px/24px 'Noto Sans';vertical-align:top}
  #orderitem_money_info .lst .price .won{vertical-align:2px}
  #orderitem_money_info .tit{float:left;width:96px}
  #orderitem_money_info .price{float:right;width:144px;text-align:right}
  #orderitem_money_info .price .emph{color:#5f0080}
  #orderitem_money_info .price .small{font-size:12px}
  #orderitem_money_info .sub{padding-top:8px}
  #orderitem_money_info .sub .tit,
  #orderitem_money_info .price .normal,
  #orderitem_money_info .sub .price{font-weight:normal;font-size:14px;color:#999;line-height:20px}
  #orderitem_money_info .sub .tit{padding-left:16px;background:url(https://res.kurly.com/pc/service/order/2011/ico_sub_price_dot.svg) no-repeat 0 0;background-size:16px 20px}
  #orderitem_money_info .lst .price{font-weight:bold;font-size:22px;line-height:28px}
  #order_notice_section{
    display: none;
    width: 284px;
    padding: 20px 0;
    text-align: center;
    border: solid 1px #f2f2f2;
    border-top: none;
    background-color: #ffffff;
    letter-spacing: -0.5px;
  }
  #order_notice_section .emph{
    color: #f03f40;
  }
  #order_notice_section .courier_notice{
    display: block;
    margin-top: 2px;
    font-size: 12px;
    line-height: 18px;
    letter-spacing: -0.5px;
    color: #999;
  }
  .tax_absolute .reserve{display:none;padding:16px 3px 0 0;font-size:12px;color:#666;line-height:16px;letter-spacing:0;text-align:right}
  .tax_absolute .reserve .ico{display:inline-block;width:30px;height:18px;margin-right:5px;border:1px solid #ffbf01;border-radius:9px;background-color:#ffbf00;font-size:10px;color:#fff;line-height:15px;text-align:center;vertical-align:top}
  .tax_absolute .reserve .emph,
  .tax_absolute .reserve .emph span{font-weight:700;color:#666}
  .pm_sign{display:none;margin-right:4px}
  h3:not(first-child) {
  	padding-top:74px;
  }
</style>
</head>
<script>
$(document).ready(function(){
	var currentPosition = parseInt($(".tax_absolute").css("top")); 
	if($(window).scrollTop() > 150){
		$(window).scroll(function() { 
			var position = $(window).scrollTop(); 
			
			if(position+currentPosition < 150) {
				$(".tax_absolute").stop().animate({"top":position+currentPosition+"px"},1000); 
			}
		})
	}
	
});
</script>
<body>

    <div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">주문서</h2>
			<h3>주문상품</h3>
            <div>
                <input type="hidden" id="amount" value="${totalPrice}">
            </div>
    
            <table id="cart" class="table table-hover table-condensed">
                <!-- 테이블컬럼. -->
                <thead>
                    <tr>
                        <th style="width:50%">상품</th>
                        <th style="width:8%"></th>
                        <th style="width:22%" class="text-center">수량</th>
                        <th style="width:10%">가격</th>
                    </tr>
                </thead>
                <!-- 장바구니 상품 시작. -->
                <tbody>
                    <c:forEach var="cart" items="${carts }">
                    <tr class="cart-unit">
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs"><img src="${cart.cart_image}" alt="..." class="img-responsive"/></div>
                                <div class="col-sm-10">
                                    <h4 id="item" class="cart-item nomargin">${cart.cart_item}${cart.md_id} </h4>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price"></td>
                        <td data-th="Quantity"> 
                            <input type="hidden" class="cart_id" value="${cart.cart_id}">
                            <input type="hidden" class="member_id" value="${cart.member_id}">
                            <input type="number" class="count form-control text-center" value="${cart.cart_item_count}" readonly>
                        </td>
                        <td data-th="Subtotal" class="cart_price text-center">${cart.cart_price}</td>
                        <td class="actions" data-th="">                  
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
                <!-- 장바구니 상품 끝.. -->	
            </table>
			<h3>
				주문자 및 배송 정보
			</h3>
			<hr>
			<table id="info-box">
				<tr><td>받는사람 이름:
	            <td><input id="recipient" type="text" class="form-control" value="${member.member_name}"  readonly>
	            </tr>
	            <tr><td>받는사람 번호:
                <td><input id="recipient_phone" type="text" class="form-control" value="${member.member_phone}" >
	            </tr>
	            <tr><td>배송지:
	            <td><input id="roadAddress" type="text" class="form-control addBtn" value="${member.member_address1}" readonly>
	            <button id="addressSearch" type="button" class="btn btn-primary">주소검색</button>
	            </tr>
	            <tr><td>상세주소:
	            <td><input id="roadAddress2" type="text" class="form-control" value="${member.member_address2}" >
	            
	            </td>
	            </tr>
            </table>
			
			<div class="row">
				<div class="col-md-8">
					<h3>쿠폰 / 적립금</h3><hr>
					<table>
					<!-- 쿠폰선택자. -->
						<tr><td>쿠폰 적용
						<td><div id="select-container">
	                        <select id="coupon" class="form-select" >
	                            <c:choose>
	                                <c:when test="${fn:length(coupons)== 0}">
	                                <option value="0|0">사용 가능한 쿠폰이 없습니다.</option>
	                                </c:when>
	                                <c:otherwise>
	                                    <option value="0|0">사용할 쿠폰을 선택해주세요. 총 ${fn:length(coupons)}장</option>
	                                    <c:forEach var="coupon" items="${coupons }">
	                                    <option value="${coupon.coupon_discount_rate}|${coupon.coupon_id}">${coupon.coupon_name} ${coupon.coupon_discount_rate }</option>
	                                    </c:forEach>
	                                </c:otherwise>
	                            </c:choose>
	                       </select>
	                    </div>
	                    </tr>		
                    <!-- 쿠폰선택자. -->
	                    <tr><td colspan=2><hr></tr>
	                    <tr><td>적립금 적용
	                    <td><input type="text" id="point-input" class="addBtn form-control mb-2 mr-sm-2" value=0 id="pointSum">
	                    <button id="point-btn"type="button" class="btn btn-primary mb-2">적립금전체사용</button>
	                    </td></tr>
           			</table>

					<h3>결제 수단</h3><hr>
					<div class="row">
						<div class="col-md-12">
							<table>
                                <tr>
                                    <td>결제수단 선택</td>
                                    <td><button>간편결제</button>
                                    <button>신용카드</button></td>
                                </tr>
                            </table>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
							<!-- 결제 박스 부분-->


							<div class="tax_absolute">
								<div class="inner_sticky" id="sticky" style="top: 0px;">
									<h2 class="tit_section">결제금액</h2>
									<div id="orderitem_money_info">
										<dl class="amount fst">
											<dt class="tit">주문금액</dt>
											<dd class="price">
												<span id="productsTotalPrice">${ totalPrice}</span> 원
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">배송비</dt>
											<dd class="price">
												<span>2,500</span> 원
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">쿠폰할인금액</dt>
											<dd class="price coupon_area">
												<dd class="price coupon_area">
													<span class="pm_sign" style="display: none;">-</span>
													<span id="coupon_price">0 </span>원
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">적립금사용</dt>
											<dd class="price">
												<span class="num pay_sum" id="paper_reserves">0 원</span>
											</dd>
										</dl>
										<dl class="amount lst">
											<dt class="tit">최종결제금액</dt>
											<dd class="price">
												<span id="totalPrice"></span> <span class="won">원</span>
											</dd>
										</dl>
										<p class="reserve" style="display: block;">
											<span class="ico">적립</span> 
											구매 시 
											<span id="expectAmount">495</span> 원 (<span class="ratio">0.5</span>%)
											적립
										</p>
									</div>
								</div>
							</div>














						</div>
					</div>
				</div>
			</div>
			<h3 id="">개인정보 수집/제공</h3><hr>
			<table>
				<tr><td><div class="row">
	                <input id="agree" type="checkbox"><a href="#popup1">정보수집ㆍ이용</a> 동의(필수)
				    
	            </div>
	            
	            </td></tr>
            </table>
            <hr>
			<div class="row">
				<div class="col-md-12" style="text-align:center;">
					 <button type="button" id="purchase" class="btn btn-success">
						결제하기
					</button>
					
				</div>
			</div>
		</div>
	</div>
</div>
	<div style="height:500px"></div>
	<div id="popup1" class="overlay">
	                    <div class="popup">
	                        <h2>정보수집ㆍ이용</h2>
	                        <a class="close" href="javascript:history.back()">&times;</a>
	                        <div class="content" style="text-align:center;">
	                            <br>
	                            <b>개인정보 판매자 제공에 동의합니다.</b><br>
	                            제공받는 자:"월하합작"<br>
	                            판매자와 구매자 사이의 원활한 거래 진행, 상품의 배송을 위한 배송지 확인, 고객상담 및 불만처리 등명<br> 
	                            정보:구매자 정보 (이름, 전화번호, 주소)<br>
	                            수취인 정보 (이름, 전화번호, 주소)<br>
	                            보유기간:발송완료 후 90일<br>
	                            <b>구매자의 정보수집ㆍ이용에 동의합니다.</b><br>
	                            제공받는 자:관할 세무서장<br>
	                            목적:주류 통신판매기록부 관리 및 국세청 신고<br>
	                            정보:구매자 정보(이름,주소,생년월일(본인인증 정보를 이용함),주문상품,수량,주문금액)<br>
	                            보유기간:회원 탈퇴 시까지<br>
	                            단, 관계법령의 규정에 따라 보존한 의무가 있으며 해당 기간동안 보존
	                            <p style="color:red;"><b>※ 동의하지 않으실 경우 구매가 제한됩니다.</b></p>
	                        </div>
	                    </div>
				    </div>
  </body>
  
<script>
					//주소 api
					let deliveryFee = 2500;
					let initialTotalPrice = Number($("#productsTotalPrice").text()) + deliveryFee;  	
					$("#totalPrice").text(initialTotalPrice);
					let coupon_discount_rate = 0;
					let coupon_id = 0;
					 
					document.getElementById("addressSearch").onclick = function(){
					       new daum.Postcode({
					           oncomplete: function(data) {                                 
					               /* document.getElementById('postcode').value = data.zonecode; */
					               document.getElementById("roadAddress").value = data.roadAddress;                   
					           }            
					       }).open();
					   }
					//적립금 전체사용.
					$("#point-btn").on("click",function(){
						 
						/*  $("#pointSum").attr('value', ${pointSum}); */
						$("#point-input").val(${pointSum}); 
						 
					})
					 //적립금 직접입력..
					$("#point-input").on("blur",function(){
						 
						 let pointSum = $("#point-input").val();
							let pointSum_int = Number(pointSum);
							
						let totalPrice = $("#totalPrice").val();
							let totalPrice_int = Number(totalPrice);
						
							if(pointSum_int<=${pointSum}){
							
						 $("#totalPrice").val(totalPrice_int-pointSum_int); 
						 
						}else{
							$("#point-input").val(${pointSum}); 
						}
					 }) 
					 //적립금전체사용..
					 $("#point-btn").on("click",function(){
						 
						 let pointSum = $("#point-input").val();
							let pointSum_int = Number(pointSum);
							
						let totalPrice = $("#totalPrice").val();
							let totalPrice_int = Number(totalPrice);
							
						 $("#totalPrice").val(totalPrice_int-pointSum_int); 
					 }) 
					 
					 //쿠폰 사용후 결제금액 갱신
					  $("body").on("change","#coupon",function(){
						coupon_discount_rate = $(this).closest("#select-container").find("#coupon").val().substring(0,$('#coupon').val().indexOf('|'));
						coupon_id = $(this).closest("#select-container").find("#coupon").val().substring($('#coupon').val().indexOf('|')+1);
					 	let totalPrice_int = initialTotalPrice;
					 	let coupon_price = Number(coupon_discount_rate);
					 	if(coupon_discount_rate == 0) {
					 		$("#coupon_price").text(coupon_discount_rate + " ");
					 	} else {
						 	$("#coupon_price").text("- " + coupon_discount_rate + " ");
					 	}
					 	if(totalPrice_int-coupon_price<0) {
					 		$("#totalPrice").text(0);
					 	} else {
					 		$("#totalPrice").text(totalPrice_int-coupon_price);
					 	}
					 }) 
					 
					 
				//결제API
				$("body").on("click","#purchase",function(){
					var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					// 정보 동의 안하면 결제 진행 막기
					if($("#agree").is(":checked") == false){
					    alert("결제 진행을 위해 정보수집ㆍ이용 동의에 체크해주세요.");
					    return false;
					//핸드폰 유효성검사.
					}else if(!regExp.test($("#recipient_phone").val())){
						alert("폰번호를 올바르게 입력해주세요..");
						return false;
						// 상세주소가 null이면 경고 띄우기
					}else if($("#roadAddress2").val() == "") {
						alert("상세 주소를 입력해주세요.");
						return false;
					} else {
						console.log($("#roadAddress2").val());
						var deliveryDTO = {
								 member_id: ${member.member_id},
								 delivery_address1: $("#roadAddress").val(),
								 delivery_address2: $("#roadAddress2").val(),
								 delivery_recipient: $("#recipient").val(),
								 delivery_phone: $("#recipient_phone").val()
						 };
						 
						 var purchaseDTO = {
								 
								 	member_id: ${member.member_id},
									purchase_amount: ${ totalPrice},
									purchase_delivery_fee: '3000',
									purchase_used_point: $("#point-input").val(),
									purchase_coupon: coupon_discount_rate,
									purchase_payment: $("#totalPrice").text(),
									purchase_method: 'card'
						 };
						 
						var arr = [deliveryDTO,purchaseDTO];
						
						let order_id = 0;
						let delivery_id = 0;
						let member_id = $(".member_id").val();
						console.log(member_id);
						 
						 $.ajax({
						  	  type: 'post',
						        url:'/purchase/rest/insertPurchase/',
						        data: JSON.stringify(arr),
						        contentType:"application/json;charset=utf-8",
						        dataType:"json",
						        async: false,
						        success : function(resp){
						        	
						        	delivery_id = resp;
						        	
						        	
						        	$.ajax({
						  		  	  type: 'get',
						  		        url:"/purchase/rest/selectId/"+delivery_id,
						  		      async: false,
						  		     }).done(function(resp){
						  		    	  
						  		    	 order_id = resp;
						  		    	 
										 var purchaseDetailArray = [];
										 var purchaseDetailDTO = new Object();
										 
										<c:forEach var="cart" items="${carts}">
										purchaseDetailArray.push(purchaseDetailDTO = {
												purchase_id: order_id,
												md_id: ${cart.md_id},
												purchase_detail_quantity: ${cart.cart_item_count},
												purchase_detail_price: ${cart.cart_price},
											})
										</c:forEach>
												 
										 	console.log(purchaseDetailArray);  
			  		    	 		 	// if 100원 이하일때
			  		    	 		 	
			  		    	 		 		//confirm(결제 하시겠습니까?) = 0원
			  		    	 		 		// 확인 -> 결제 성공
			  		    	 		 		
			  		    	 		 		// 아니오 -> 기존페이지 남아있기
			  		    	 		 	// 0원을 안만들면
			  		    	 		 	
			  		    	 		 	// if 100원 이상일때 결제값이
						  		    	 BootPay.request({
												price: document.getElementById("totalPrice").innerHTML, //실제 결제되는 가격
												application_id: "61eab9c3e38c3000227b8107",
												name: document.getElementById("item").innerHTML + '외', //결제창에서 보여질 이름
												pg: 'nicepay',
												method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
												show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
												
												order_id: order_id, //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
												
											}).error(function (data) {
												//결제 진행시 에러가 발생하면 수행됩니다.
												console.log(data);
											}).cancel(function (data) {
												//결제가 취소되면 수행됩니다.
												$.ajax({
												  	  type: 'delete',
												        url:'/purchase/rest/deleteId/'+delivery_id+"/"+order_id,
												        contentType:"application/json;charset=utf-8",
												        dataType:"json",
												        async: false     
												})
												console.log(data);
											}).ready(function (data) {
												// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
												console.log(data);
											}).close(function (data) {
											    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
											    
											    console.log(data);
											}).done(function (data) {
												//결제가 정상적으로 완료되면 수행됩니다
												//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
												$.ajax({
												  	  type: 'post',
												        url:'/purchaseDetail/rest/insertPurchaseDetail/',
												        data: JSON.stringify(purchaseDetailArray), 	
												        contentType:"application/json;charset=utf-8",
												        dataType:"json",
												        async: false,
												        success : function(resp){
											        	$.ajax({
											      	  	  type: 'delete',
											      	        url:"/cart/rest/deleteAll/"+member_id,
											      	        dataType:"json",
											      	        async: false,
											      	        success : function(resp){
											      	        	$.ajax({
											      	        		type:"post",
											      	        		url:"/coupon/rest/update/"+coupon_id
											      	        	})
											      	        }
											      	    }).done(function(resp){
											      	    	
											      	    	//location.replace("/pay/rest/confirm?receipt_id="+data.receipt_id);
											      	    	location.replace("/pay/confirm?receipt_id="+data.receipt_id);
											      	    })
												    }
												        
												})
														
														
											});
						  		    		
						  		     })
						        }
						     })
					}

						 
						 
									 	
						 
						 
					
				 })
				</script>
  
</html>


