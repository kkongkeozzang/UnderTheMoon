<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
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
<!-- 마이페이지 프로필 css 가져오기 -->
<link
	href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 댓글 css 가져오기 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link rel="icon" href="">
<link rel="stylesheet" href="/resources/event/css/eventDetail.css">
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
	
	<!-- 타이틀  -->
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
			
				<div id="board-title">
					<h2 class="title">이벤트<span class="title-sub">월하합작에서 진행하는 이벤트를 확인하세요!</span></h2>
				</div>
				<div align=center>
					
				</div>
		
				<!-- 게시판 박스 -->
				<div class="card mb-3 col-xl-6 col-md-12">
					<div class="container mb-4">
						<div class="row" style="padding-bottom: 5px;">
							<div class="col-sm-12">
								<div class="row profile-detail">
									<div class="col profile-box mt-4 mb-2 ">
										<ul class="meta list list-unstyled profile-detail d-flex mb-0 ml-2">
											<li class="name mt-0" style="color: rgba(255, 111, 97);"></li>
											<li class="label" style="margin: 0; padding: 0"></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row event-title">
							<div class="col-2 d-none d-sm-block left-side" >
								제목
							</div>
							<div class="col-12 col-sm-10 right-side">
								[이벤트] 월하합작 X KH정보교육원
							</div>
						</div>
						<div class="row event-period">
							<div class="col-2 d-none d-sm-block left-side">
								이벤트 기간
							</div>
							<div class="col-12 col-sm-10 right-side">
								2021.09.01 ~ 2022.02.10
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-12" id="contents" name="contents"
									style="min-height: 200px; overflow: auto;">
								<img src="/resources/event/kh.png" width=100% height=100%>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12" style="text-align: right; margin-top:15px;margin-bottom:15px;">
									<button type="button" id="board-list" class="btn btn-dark"
										style="background-color: #406882;">목록으로</button>
								<script>
									$("#board-list").on("click",function(){
										location.href="javascript:history.back()";
									});
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		<hr>
		</div>
	</div>
	
<!--footer 시작 -->
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>	
</body>
</html>