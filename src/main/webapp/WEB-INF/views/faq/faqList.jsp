<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

<link rel="stylesheet" href="/resources/faq/css/faqList.css">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>

	<div class="container-fluid mt-100">
		<div class="row">
			<!-- 사이드네비 -->
			<div class="col-0 col-md-3 col-lg-3">
				<div class="card" style="border: none;">
					<jsp:include page="/WEB-INF/views/event/navi.jsp"></jsp:include>
				</div>
			</div>
			<!-- 게시판 박스 -->
			<div class="card mb-3 col-12 col-md-9 col-lg-9 list-box">
				<!-- 타이틀  -->
				<div id="board-title">
					<h2 class="title">자주묻는질문<span class="title-sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span></h2>
				</div>
				<!-- 분류 네비 -->
				<div class="card-header pl-0 pr-0"
					style="justify-content: space-around;">
					<div class="row no-gutters w-100 align-items-center"
						style="justify-content: space-around">
						<div class="col-2 d-none d-md-block" style="text-align: center;">번호</div>
						<div class="col-2 d-none d-md-block" style="text-align: center;">카테고리</div>
						<div class="col-8 d-none d-md-block" style="text-align: center;">제목</div>
						<div class="col-2 d-md-none" style="text-align: center;">번호</div>
						<div class="col-2 d-md-none" style="text-align: center;">카테고리</div>
						<div class="col-8 d-md-none" style="text-align: center;">제목</div>
					</div>
				</div>

				<c:choose>
					<c:when test="${empty faqs }">
						<div style="text-align: center; line-height: 100px;">작성된 글이
							없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="faqs" items="${faqs}">
							<div class="card-body py-3 "
								style="justify-content: space-around; margin: 0px;">
								<input type="hidden" value="${faqs.member_id}" name="member_id"
									id="member_id${faqs.faq_id}"> <input type="hidden"
									value="${faqs.faq_id}" name="faq_id"> <input
									type="hidden" value="${username}" id="username${faqs.faq_id}">
								<script>
							str = "";
							$(document).ready(function() {
								$.ajax({
									url:"/faq/username",
									data:{member_id: $("#member_id${faqs.faq_id}").val()}
								}).done(function(resp){
		 							$(username${faqs.faq_id}).val(resp);
									username = resp;
									let str = "";
									if(principal == username) {
										str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
										str += "<button type='button' class='btn btn-dark' id='update${faqs.faq_id}' style='background-color: #406882;margin-right:5px;'>수정하기</button>";
										str += "<button type='button' class='btn btn-dark' id='delete${faqs.faq_id}' style='background-color: #406882;'>삭제하기</button>";
										str += "</div>";
										$(".buttons${faqs.faq_id}").html(str);	
									}else{
										str += "<sec:authorize access="hasRole('ROLE_ADMIN')">";
										str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
										str += "<button type='button' class='btn btn-dark' id='update${faqs.faq_id}' style='background-color: #406882;margin-right:5px;'>수정하기</button>";
										str += "<button type=\"button\" class=\"btn btn-dark\" id=\"delete${faqs.faq_id}\" style=\"background-color: #406882;\">삭제하기</button>";
										str += "</sec:authorize>";
										$(".buttons${faqs.faq_id}").html(str);
									}
									
									$("#delete${faqs.faq_id}").on("click", function(){
										if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
				                			 location.href="/faq/delete?faq_id=${faqs.faq_id}";
				                		}
				                	});
									
									$("#update${faqs.faq_id}").on("click", function(){
										location.href="/faq/toUpdate?faq_id=${faqs.faq_id}&cPage=${cPage}";
									});
									
								});
							})
							</script>
								<input type="hidden" value="${principal.username}"
									id="principal${faqs.faq_id}">
								<div class="row no-gutters align-items-center"
									style="justify-content: space-around" data-toggle="collapse"">
									<!-- data-target="#demo2" -->

									<%-- 웹버전 seq --%>
									<div class="col-2 d-none d-md-block" align=center>${faqs.faq_id }</div>
									<%-- 웹버전 category --%>
									<div class="col-2 d-none d-md-block" align=center>${faqs.faq_category }</div>
									<%-- 웹버전 title --%>
									<div class="col-8 d-none d-md-block" align=left>${faqs.faq_title }</div>

									<!--모바일버전 seq -->
									<div class="col-2 d-md-none pl-2">${faqs.faq_id }</div>
									<!--모바일버전 category -->
									<div class="col-2 d-md-none pl-2">${faqs.faq_category }</div>
									<!--모바일버전 title,작성자,날짜-->
									<div class="col-8 d-md-none pl-2">${faqs.faq_title }</div>
								</div>
							</div>
							<%-- 웹버전 내용 --%>
							<div class="hidden-row"
								style="border-top: 1px solid rgba(0, 0, 0, .125); display: none; padding: 30px;">
								<div class="d-flex user-box">
									<span style="margin-right: 10px;"><img
										src="/resources/faqList/답.svg" width=20px height=20px></span>
									<div>${faqs.faq_content }</div>
								</div>
								<div class=buttons${faqs.faq_id}></div>
								<div class="col-sm-12"
									style="text-align: right; margin-top: 15px; margin-bottom: 15px;">
									<script>
									username = $("#username${faqs.faq_id}").val();
									principal = $("#principal${faqs.faq_id}").val();
								</script>
								</div>
							</div>
							<hr class="m-0">
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<br>
				<div align=center style="margin-bottom: 15px;">
					<span>${pageNavi}</span>
				</div>
				<!-- 글쓰기 & 검색 라인 -->
				<div class="row search-bar" style="justify-content: space-around;">
					<div class="col-xl-12 col-md-12 d-none d-md-block">
						<div class="row">
							<div class="col-4" style="padding-left: 0px;">
								<select class="select">
									<option value="faq_title">제목</option>
									<option value="faq_category">카테고리</option>
									<option value="faq_content">내용</option>
								</select> <input type="text" placeholder="Search..." class="input-search"
									style="width: 66%; height: 100%;"> <input
									id="member_username" type=hidden value=${principal.username }>
							</div>
							<div class="col-4 pl-0">
								<button type="button"
									class="btn btn-shadow btn-wide btn-primary btn-search">검색하기</button>
							</div>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="col-4"
									style="text-align: right; padding-right: 0px;">
									<button type="button"
										class="btn-write btn btn-shadow btn-wide btn-primary">글
										쓰기</button>
								</div>
							</sec:authorize>
						</div>
					</div>
					<div class="d-md-none">
						<div class="row">
							<div class="col-5">
								<select class="select">
									<option value="faq_title">제목</option>
									<option value="faq_category">카테고리</option>
									<option value="faq_content">내용</option>
								</select> <input type="text" placeholder="Search..." class="input-search"
									style="width: 66%; height: 100%;">
							</div>
							<div class="col-4 pl-0">
								<button type="button"
									class="btn btn-shadow btn-wide btn-primary btn-search"
									style="background-color: #406882; border-color: #406882;">
									검색하기</button>
							</div>
							<div class="col-3" style="text-align: right;">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button type="button" id="done"
										class="btn btn-shadow btn-wide btn-primary btn-write"
										style="background-color: #406882; border-color: #406882;">
										글쓰기</button>
								</sec:authorize>
								<script>
			         			$(".btn-write").on("click",function(){
			         				location.href="/faq/toWrite";
			         			});
			         			let search = function(){
			         				let select = $(".select").val();
			         				let keyword = $(".input-search").val();
			         				location.href="/faq/search?cPage=1&select="+select+"&keyword="+keyword;
			         			};
			         			$(".btn-search").on("click",search);
			         			$(".input-search").on("keyup",function(key){
			         				if(key.keyCode==13){
			         					let select = $(".select").val();
				         				let keyword = $(".input-search").val();
				         				location.href="/faq/search?cPage=1&select="+select+"&keyword="+keyword;
			         				}
			         			})
			         			
			         			$(".card-body.py-3").on("click",function(){
		            				$(this).next(".hidden-row").slideToggle(0);
		             				$(this).siblings(".hidden-row").not($(this).next(".hidden-row")).slideUp(0);
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