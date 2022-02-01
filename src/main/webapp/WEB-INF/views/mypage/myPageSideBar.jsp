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
						<div class="d-grid"></div>
						<h5 class="my-3">My Page</h5>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="/mypage/myPageList?cPage=1" class="list-group-item py-1"><span>주문 내역</span></a> 													
								<a href="/mypage/myPageLike?cPage=1" class="list-group-item py-1"><span>찜한 상품</span></a>
								<a href="/mypage/myPagePoint?cPage=1" class="list-group-item py-1"><span>적립금</span></a>
                                <a href="/mypage/myPageCoupon?cPage=1" class="list-group-item py-1"><span>쿠폰</span></a>
                                <a href="/mypage/myPageQuestion?cPage=1" class="list-group-item py-1"><span>상품 문의</span></a>
                                <a href="/mypage/myPageMdReview?cPage=1" class="list-group-item py-1"><span>상품 후기</span></a>
                                <a href="/mypage/myPageModifyProfile" class="list-group-item py-1"><span>개인정보 수정</span></a>
                                <br>
                                <br>
								<a href="/qna/qnaList" class="list-group-item py-1"><span>도움이 필요하신가요?<br>1:1 문의하기</span></a>
							</div>
						</div>
					</div>
</body>
</html>