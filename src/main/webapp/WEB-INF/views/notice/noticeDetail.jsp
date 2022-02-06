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
<link rel="stylesheet" href="/resources/notice/css/noticeDetail.css">
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
					<h2 class="title">공지사항<span class="title-sub">월하합작의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
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
								<input type="hidden" value="${notices.member_id}" name="member_id">
								<input type="hidden" value="${notices.notice_id}" name="notice_id">
								<input type="hidden" value="${username}" id="username">
								<input type="hidden" value="${principal.username}" id="principal.username">
							</div>
						</div>
						<div class="row" style="border-top:1px solid black; margin:0px;height:30px;line-height:29px;">
							<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
								제목
							</div>
							<div class="col-12 col-sm-10" style="white-space: nowrap;overflow:hidden;">
								${notices.notice_title}
							</div>
						</div>
						<div class="row" style="margin:0px;border-top:1px solid gray;border-bottom:1px solid gray;height:30px;line-height:28px;">
							<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
								작성자
							</div>
							<div class="col-12 col-sm-10" style="white-space: nowrap;overflow:hidden;">
								${username}
							</div>
						</div>
						<div class="row" style="border-bottom:1px solid gray; margin:0px;height:30px;line-height:29px;">
							<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
								작성일
							</div>
							<div class="col-6 col-sm-2" style="white-space: nowrap;overflow:hidden;">
								${notices.getFormedDate()}
							</div>
							<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
								조회수
							</div>
							<div class="col-6 col-sm-2" style="white-space: nowrap;overflow:hidden;">
								<div id=input-title name=title style="width: 100%;">${notices.notice_view_count}</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-12" id="contents" name="contents"
									style="min-height: 200px; overflow: auto;">
								${notices.notice_content}
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12" style="text-align: right; margin-top:15px;margin-bottom:15px;">
								<c:choose>
									<c:when test="${username == principal.username }">
										<button type="button" class="btn btn-dark" id="update">수정하기</button>
										<button type="button" class="btn btn-dark" id="delete">삭제하기</button>
									</c:when>
									<c:otherwise>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<button type="button" class="btn btn-dark" id="update">수정하기</button>
											<button type="button" class="btn btn-dark" id="delete">삭제하기</button>
										</sec:authorize>
									</c:otherwise>
								</c:choose>
									<button type="button" id="board-list" class="btn btn-dark">목록으로</button>
								<script>
									$("#board-list").on("click",function(){
			 								location.href="/notice/toNotice?cPage=${cPage}";
									});
									
									$("#delete").on("click", function(){
				                		if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
				                			 location.href="/notice/delete?notice_id="+${notices.notice_id};
				                		}
				                	});
									
									$("#update").on("click", function(){
										location.href="/notice/toUpdate?notice_id=${notices.notice_id}&cPage=${cPage}";
									});
									
									username = $("#username").val();
									principal.username = ("#principal.username").val();
									
								</script>
							</div>
						</div>
						<c:if test="${upDown.prevNum ne 0 }">
						<div class="row" style="border-top:1px solid black; border-bottom:1px solid gray; margin:0px;height:30px;line-height:30px;">
							<div class="col-xs-12 col-sm-2">
								▲ 이전 글
							</div>
							<div class="col-xs-12 col-sm-10">
								<a href="/notice/detail?notice_id=${upDown.prevNum}&member_id=${upDown.prevMember}&cPage=${cPage}"><div style="width: 100%;">${upDown.prevTitle}</div></a>
							</div>
						</div>
						</c:if>
						<c:if test="${upDown.nextNum ne 0 }">
						<div class="row" style="border-bottom:1px solid black; margin:0px;height:30px;line-height:30px;">
							<div class="col-xs-12 col-sm-2">
								▼ 다음 글
							</div>
							<div class="col-xs-12 col-sm-10">
								<a href="/notice/detail?notice_id=${upDown.nextNum}&member_id=${upDown.nextMember}&cPage=${cPage}"><div style="width: 100%;">${upDown.nextTitle}</div></a>
							</div>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!--footer 시작 -->
	<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>
</body>
</html>