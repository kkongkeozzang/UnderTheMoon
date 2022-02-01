<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />
<link rel="stylesheet" href="/resources/mypage/css/mypage.css">	
</head>

<body>
	<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
					<jsp:include page="myPageNavBar.jsp" flush="false" /> 
        
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="myPageSideBar.jsp" flush="false" />
				</div>
			</div>

			<div class="col-12 col-md-8 col-lg-9">
				<div class="card">
					<div class="card-body">						
							<div class="drive-wrapper drive-list-view">								
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>찜한 상품 
                                                    </th>
											</tr>
										</thead>										
										<tbody>														
										</tbody>
									</table>
									<input type="hidden" id="member_username" name="member_username" value="${memberDTO.member_username} ">
									<input type="hidden" id="member_id" name="member_id" value="${memberDTO.member_id} ">					
									<c:forEach var="wishDTO" items="${wishList}">
									<div class="md-box">
                                   <div class="img-box"><div class="img-box2"><img src="/mdImage/${wishDTO.md_image }"></div></div>
                                   <div class="detail-box">
                                   	<input type="hidden" id="wish_id" name="wish_id" value="${wishDTO.wish_id }">
                                   	<input type="hidden" id="md_id" name="md_id" value="${wishDTO.md_id }">                                   	
                                   	<input type="hidden" id="cart_item_count" name="cart_item_count" value="1">
                                      <div><a href="/md/detail/page?md_id=${wishDTO.md_id}">상품이름 : ${wishDTO.wish_item }</a></div>
                                      <div><a href="/md/detail/page?md_id=${wishDTO.md_id}">가격 : <fmt:formatNumber value="${wishDTO.wish_price }" type="number"/> 원</a></div>                                      
                                      <div>
                                         <span>찜한 날짜 :  <fmt:formatDate value = "${wishDTO.wish_date }"  type="date" dateStyle="full"/></span>
                                      </div>
                                   </div>
                                   <div class="btn-box">
                                      <button class="cart-wish">담기</button>
                                   </div>
                                   <div class="btn-box">
                                      <button class="delete-wish">삭제 </button>
                                      <script>
                                      $("body").on("click",".delete-wish",function(){
                                      		$.ajax({
                                      			type: "post",
                                      			url:"/md/detail/deleteWishMd",
                                      			data:{
                                      				wish_id:$("#wish_id").val()
                                      			}
                                      		})
                                      		$(this).closest(".md-box").remove();
                                      		})
                                      
                                      		$(function(){
		let cart_item_count = $("#cart_item_count").text();
		let cart_item_count_int = Number(cart_item_count);
		
		$("body").on("click",".cart-wish",function(){
			$.ajax({
		  	  type: 'post',
		        url:"/cart/rest/addToCart",
		        data: {
		      	  member_username: $("#member_username").val(),
		           md_id: $("#md_id").val(),
		            cart_item_count: $("#cart_item_count").text(),
		            member_id:$("#member_id").val()
		        }
		     }).done(function(resp){
		    	  if(confirm("장바구니에 선택하신 상품을 추가하였습니다. 장바구니로 이동하시겠습니까?")){ 
		    		 document.location.href="/cart/cart";
		    		} 
		     })
		   })
		})
                                      </script>
                                      
                                   </div>
                                </div>
									<br>
									</c:forEach>
									<div class="navigator" style="margin:auto; display:block;">
									${pageNavi}
									</div>																									
							</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
<script>
	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	})
</script>
</body>
</html>