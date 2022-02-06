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
</head>
<body>

	<div class="card-body">
						<div class="row mt-3">
							<div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center id="nav-bar">
										<div class="d-flex">										
											<div class="detail">
                                                <h6 class="detail-title-one">${memberDTO.member_name } 회원님</h6>
												<button type="button" class="btn btn-light" id="all-grade">나의등급 보기</button>
												<input type="hidden" id="member-id" name="member_id" value="${memberDTO.member_id }">
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center id="nav-bar">
										<div class="d-flex">

											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPagePoint?cPage=1">적립금 ></a></h6>
												<p class="detail-detail"><span><fmt:formatNumber value="${pointSum}" type="number"/> 원</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center id="nav-bar">
										<div class="d-flex">											
											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPageCoupon?cPage=1">쿠폰 ></a></h6>
												<p class="detail-detail"><span>${couponSum } 개</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center id="nav-bar1">
										<div class="d-flex">										
											<div class="detail">
												<h6 class="detail-title"><a href="/qna/qnaList">1:1문의 ></a></h6>
												<p class="detail-detail"><span>도움이 필요하신가요?</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
            			</div>            
            		</div>
</body>
</html>