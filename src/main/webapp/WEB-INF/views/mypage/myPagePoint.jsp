<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="row" id="header">
		</div>
        <div class="row">
            <div class="col-12">
                <div class="card">
					<div class="card-body">
						<div class="row mt-3">
							<div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
                                                <h6 class="detail-title-one">${memberDTO.member_username }회원님</h6>
												<button type="button" class="btn btn-light" id="all-grade">나의등급 보기</button>
												<input type="hidden" value="${memberDTO.member_id }">
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">

											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPagePoint">적립금 ></a></h6>
												<p class="detail-detail"><span><fmt:formatNumber value="${pointSum}" type="number"/> 원</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">											
											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPageCoupon">쿠폰 ></a></h6>
												<p class="detail-detail"><span>${couponSum } 개</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
												<h6 class="detail-title"><a href="">1:1문의 ></a></h6>
												<p class="detail-detail"><span>도움이 필요하신가요?</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
            </div>
            
            </div>    

        
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<div class="card-body">
						<div class="d-grid"></div>
						<h5 class="my-3">My Page</h5>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="/mypage/myPageList" class="list-group-item py-1"><span>주문 내역</span></a> 													
								<a href="/mypage/myPageLike" class="list-group-item py-1"><span>찜한 상품</span></a>
								<a href="/mypage/myPageDelivery" class="list-group-item py-1"><span>배송지 관리</span></a>
								<a href="/mypage/myPagePoint" class="list-group-item py-1"><span>적립금</span></a>
                                <a href="/mypage/myPageCoupon" class="list-group-item py-1"><span>쿠폰</span></a>
                                <a href="" class="list-group-item py-1"><span>상품 문의</span></a>
                                <a href="/mypage/myPageReview" class="list-group-item py-1"><span>상품 후기</span></a>
                                <a href="/mypage/myPageModifyProfile" class="list-group-item py-1"><span>개인정보 수정</span></a>
                                <br>
                                <br>
								<a href="" class="list-group-item py-1"><span>도움이 필요하신가요?<br>1:1 문의하기</span></a>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-12 col-md-8 col-lg-9">
				<div class="card">
					<div class="card-body">											
							<div class="drive-wrapper drive-list-view">
								<div class="table-responsive drive-items-table-wrapper">
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>적립금                                                
											</tr>
											<tr>
												<th class="grade-list" style="text-align:center">적립/사용 내역</th>
												<th class="grade-list" style="text-align:center">금액</th>
												<th class="grade-list" style="text-align:center">날짜</th>                                           
											</tr>
										</thead>										
										<tbody>
											<c:forEach var="pointDTO" items="${pointList }">
											<tr>												
												<td class="grade-list" style="text-align:center">${pointDTO.point_event}</td>
												<td class="grade-list" style="text-align:center"><fmt:formatNumber value="${pointDTO.point_used_saved}" type="number"/></td>
												<td class="grade-list" style="text-align:center">${pointDTO.point_date}</td>													
											</tr>
											</c:forEach>			
										</tbody>
									</table>							
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