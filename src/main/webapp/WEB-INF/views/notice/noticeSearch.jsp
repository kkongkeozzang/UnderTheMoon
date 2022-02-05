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

<link rel="stylesheet" href="/resources/notice/css/noticeList.css">	
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
			<div class="col-0 col-md-3 col-lg-3">
				<div class="card" style="border:none;">
					<jsp:include page="/WEB-INF/views/event/navi.jsp"></jsp:include>	
				</div>
			</div>
			<!-- 게시판 박스 -->
			<div class="card mb-3 col-12 col-md-9 col-lg-9 list-box">
				<!-- 타이틀  -->
				<div id="board-title">
					<h2 class="title">공지사항<span class="title-sub">월하합작의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
				</div>
				<!-- 분류 네비 -->
				<div class="card-header pl-0 pr-0"
					style="justify-content: space-around; background-color: #406882; color: white;">
					<div class="row no-gutters w-100 align-items-center"
						style="justify-content: space-around">
						<div class="col-2 d-none d-md-block" style="text-align: center;">번호</div>
						<div class="col-4 d-none d-md-block" style="text-align: center;">제목</div>
						<div class="col-2 d-md-none" style="text-align: center;">번호</div>
						<div class="col-9 d-md-none" style="text-align: center;">제목</div>
						<div class="col-6 text-muted">
							<div class="row no-gutters align-items-center">
								<div class="d-none d-md-block col-4"
									style="text-align: center; color: white">작성자</div>
								<div class="d-none d-md-block col-4"
									style="text-align: center; color: white">작성일</div>
								<div class="d-none d-md-block col-4"
									style="text-align: center; color: white">조회수</div>
							</div>
						</div>
					</div>
				</div>
	
	       		<c:choose>
					<c:when test="${empty notices }">
						<div style="text-align: center; line-height: 100px;">검색된 글이 없습니다.</div>
					</c:when>
					<c:otherwise>
					<c:forEach var="notices" items="${notices}">
						<div class="card-body py-3 " style="justify-content: space-around; margin:0px;">
							<div class="row no-gutters align-items-center"
								style="justify-content: space-around">
		
								<%-- 웹버전 seq --%>
								<div class="col-2 d-none d-md-block pl-3" align=center style="padding-left:0px !important;;">${notices.notice_id }</div>
								<%-- 웹버전 title --%>
								<div class="col-4 d-none d-md-block" align=left>
									<a href="/notice/detail?notice_id=${notices.notice_id}&member_id=${notices.member_id}&cPage=${cPage}"
										class="text-big" data-abc="true">${notices.notice_title }</a>
									<div class="text-muted small mt-1 d-md-none">${notices.getFormedDate() }
										&nbsp;·&nbsp; by ${notices.member_username }</div>
								</div>
								<%-- 웹버전 조회수, 작성자, 날짜 --%>
								<div class="d-none d-md-block col-6">
									<div class="row no-gutters align-items-center">
										<div class="col-4" style="text-align: center;">${notices.member_username }</div>
										<div class="col-4" style="text-align: center;">${notices.getFormedDate()}</div>
										<div class="col-4" style="text-align: center;">${notices.notice_view_count }</div>					
									</div>
								</div>
		
								<!--모바일버전 seq -->
								<div class="col-2 d-md-none pl-2">${notices.notice_id }</div>
								<!--모바일버전 title,작성자,날짜-->
								<div class="col-8 d-md-none pl-2">
									<a href="/detail.board?cPage=${cPage }&notice_id=${notices.notice_id}"
										class="text-big" data-abc="true">${notices.notice_title }</a>
									<div class="text-muted small mt-1 d-md-none">${notices.getFormedDate() }
										&nbsp;·&nbsp;by ${notices.member_username }</div>
								</div>
		
							</div>
						</div>
		
						<hr class="m-0">
					</c:forEach>
					</c:otherwise>
				</c:choose>
				<br>
				<div align=center style="margin-bottom:15px;"><span>${pageNavi}</span></div>

				<!-- 글쓰기 & 검색 라인 -->
				<div class="row search-bar" style="justify-content: space-around;">
					<div class="col-xl-12 col-md-12 d-none d-md-block">
						<div class="row">
							<div class="col-4" style="padding-left:0px;">
								<select class="select">
									<option value="notice_title">제목</option>
									<option value="member_username">작성자</option>
									<option value="notice_content">내용</option>
								</select>
								<input type="text" placeholder="Search..." class="input-search" style="width: 66%; height: 100%;">
							</div>
							<div class="col-4 pl-0">
								<button type="button"
									class="btn btn-shadow btn-wide btn-primary btn-search">검색하기</button>
							</div>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="col-4" style="text-align: right;padding-right:0px;">
									<button type="button"
										class="btn-write btn btn-shadow btn-wide btn-primary">글 쓰기</button>
								</div>
							</sec:authorize>
						</div>
					</div>
		
					<div class="d-md-none">
						<div class="row">
							<div class="col-5">
								<select class="select">
									<option value="notice_title">제목</option>
									<option value="member_username">작성자</option>
									<option value="notice_content">내용</option>
								</select>
								<input type="text" placeholder="Search..." class="input-search" style="width: 66%; height: 100%;">
							</div>
							<div class="col-4 pl-0">
								<button type="button"
									class="btn btn-shadow btn-wide btn-primary btn-search">검색하기</button>
							</div>
							<div class="col-3" style="text-align: right;">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<button type="button" id="done"
									class="btn btn-shadow btn-wide btn-primary btn-write">글쓰기</button>
							</sec:authorize>
								<script>
			         			$(".btn-write").on("click",function(){
			         				location.href="/notice/toWrite";
			         			});
			         			let searchEvent = function(){
			         				let select = $(".select").val();
			         				let keyword = $(".input-search").val();
			         				location.href="/notice/search?cPage=1&select="+select+"&keyword="+keyword;
			         			};
			         			$(".btn-search").on("click",searchEvent);
			         			$(".input-search").on("keyup",function(key){
			         				if(key.keyCode==13){
			         					let select = $(".select").val();
				         				let keyword = $(".input-search").val();
				         				location.href="/notice/search?cPage=1&select="+select+"&keyword="+keyword;
			         				}
			         			})	
			         		</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer 시작 -->
	<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>
</body>
</html>