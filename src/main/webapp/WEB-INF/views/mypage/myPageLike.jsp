<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
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
                                   <div class="img-box"><div class="img-box2"><a href="/md/detail/page?md_id=${wishDTO.md_id}"><img src="/mdImage/${wishDTO.md_image }"></a></div></div>
                                   <div class="detail-box">
                                   	<input type="hidden" class="wish-id" id="wish_id" name="wish_id" value="${wishDTO.wish_id }">
                                   	<input type="hidden" id="md_id" name="md_id" value="${wishDTO.md_id }">                                   	
                                   	<input type="hidden" id="cart_item_count" name="cart_item_count" value="1">
                                      <div class="wish-purchase-text"><a href="/md/detail/page?md_id=${wishDTO.md_id}">상품이름 : ${wishDTO.wish_item }</a></div>
                                      <div class="wish-purchase-text"><a href="/md/detail/page?md_id=${wishDTO.md_id}">가격 : <fmt:formatNumber value="${wishDTO.wish_price }" type="number"/> 원</a></div>                                      
                                      <div>
                                         <span>찜한 날짜 :  <fmt:formatDate value = "${wishDTO.wish_date }"  type="date" dateStyle="full"/></span>
                                      </div>
                                   </div>
                                   <div class="btn-box">
                                      <button class="delete-wish">삭제 </button>                                  
                                   </div>
                                </div>
									<br>
									</c:forEach>									
									<div class="navigator" align="center">
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

     $("body").on("click",".delete-wish",function(){
        $.ajax({
           type: "post",
           url:"/md/detail/deleteWishMd",
           data:{wish_id:$(this).closest(".md-box").find(".wish-id").val()}
        })
        	$(this).closest(".md-box").remove();
     })                                                                          		
 
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>