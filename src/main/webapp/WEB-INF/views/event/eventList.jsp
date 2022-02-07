<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
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
<link rel="stylesheet" href="/resources/event/css/eventList.css">
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
	

	<div class="container-fluid mt-100">
		<div class="row">
			<!-- 사이드네비 -->
			<div class="col-0 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="/WEB-INF/views/event/navi.jsp"></jsp:include>	
				</div>
			</div>
			<!-- 게시판 박스 -->
			<div class="col-12 col-md-8 col-lg-9">
				<!-- 타이틀  -->
				<div id="board-title">
					<h2 class="title">이벤트<span class="title-sub">월하합작에서 진행하는 이벤트를 확인하세요!</span></h2>
				</div>
				<div class="card">	
						
					<!-- 분류 네비 -->
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
			</div>
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