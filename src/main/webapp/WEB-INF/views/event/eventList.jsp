<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: .88rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
    background-color: #eef1f3;
}

.mt-100 {
	margin-top: 80px;
}

.card {
	box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem
		1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem
		rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
	border-width: 0;
	transition: all .2s;
	margin: auto;
	padding:0px !important;
}

.card-header:first-child {
	border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}

.card-header {
	display: flex;
	align-items: center;
	border-bottom-width: 1px;
	padding-top: 0;
	padding-bottom: 0;
	padding-right: .625rem;
	height: 3.5rem;
	background-color: #fff;
	border-bottom: 1px solid rgba(26, 54, 126, 0.125);
}

.btn-primary.btn-shadow {
	box-shadow: 0 0.125rem 0.625rem rgba(63, 106, 216, 0.4), 0 0.0625rem
		0.125rem rgba(63, 106, 216, 0.5);
}

.btn.btn-wide {
	padding: .375rem 1.5rem;
	font-size: .8rem;
	line-height: 1.5;
	border-radius: .25rem;
}

.btn-primary {
	color: #fff;
	background-color: #3f6ad8;
	border-color: #3f6ad8;
}

.form-control {
	display: block;
	width: 100%;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.card-body {
	flex: 1 1 auto;
	padding: 0px !important;
}

.d-block {
	display: block !important
}

a {
	color: #406882;
	text-decoration: none !important;
	background-color: transparent
}

img {
	width: 100% !important;
	height: auto;
}

#board-title {
	text-align: center;
	height: 100px;
	padding: 100px 0;
}

.search-bar {
	margin: auto;
}


</style>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/event/navi.jsp"></jsp:include>

	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div id="board-title">
			<span><h3>이벤트</h3>이벤트 게시판입니다. 이벤트</span>
		</div>
		<br>

		<!-- 게시판 박스 -->
		<div class="card mb-3 col-xl-8 col-md-12">	
				
			<!-- 분류 네비 -->
			<div class="card-header pl-0 pr-0"
				style="justify-content: space-around; background-color: #406882; color: white;">
				<div class="row no-gutters w-100 align-items-center"
					style="justify-content: space-around">
					<div class="col-12 d-none d-md-block" style="text-align: center;"></div>
					<div class="col-12 d-md-none" style="text-align: center;"></div>
				</div>
			</div>
			<div class="card-body" style="justify-content: space-around; margin:0px;">
				<div class="row no-gutters align-items-center"
					style="justify-content: space-around; width:100%; margin:0px;">

					<%-- 웹버전 --%>
					<div class="col-12 d-none d-md-block" align=center style="padding-left:0px;">
						<a href="/event/eventTiger"><img src="/resources/event/새해이벤트.png"></a><br>
						<a href="/event/eventWelcome"><img src="/resources/event/월하합작_가입이벤트.png"></a>
						<a href="/event/eventKH"><img src="/resources/event/kh 콜라보.png"></a>
						<a href="/event/eventRecommend"><img src="/resources/event/월하합작_추천인.png"></a>
					</div>
					
					<!--모바일버전 -->
					<div class="col-12 d-md-none">
						<a href="/event/eventTiger"><img src="/resources/event/새해이벤트.png"></a>
						<a href="/event/eventWelcome"><img src="/resources/event/월하합작_가입이벤트.png"></a>
						<a href="/event/eventKH"><img src="/resources/event/kh 콜라보.png"></a>
						<a href="/event/eventRecommend"><img src="/resources/event/월하합작_추천인.png"></a>
					</div>
				</div>
			</div>

			<hr class="m-0">
		</div>
		<div align=center style="margin-bottom:15px;"><span>${pageNavi}</span></div>

		<!-- 글쓰기 & 검색 라인 -->
		<div class="row search-bar" style="justify-content: space-around;">
			<div class="col-xl-8 col-md-12 d-none d-md-block">
				<div class="row">

				</div>
			</div>
		</div>
	</div>
	<!--footer 시작 -->
	<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>	
</body>
</html>