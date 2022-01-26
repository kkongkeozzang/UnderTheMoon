<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 - 호랑이띠</title>
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
	padding: 1.25rem
}

.flex-truncate {
	min-width: 0 !important
}

.d-block {
	display: block !important
}

a {
	color: #E91E63;
	text-decoration: none !important;
	background-color: transparent
}

.media img {
	width: 40px;
	height: auto
}

#board-title {
	text-align: center;
	height: 100px;
	line-height: 100px;
	padding: 100px 0;
}

#title {
	width: 50px;
	height: 50px;
}

.search-bar {
	margin: auto;
}

* {
	box-sizing: border-box;
}

.container {
	/* width: 1000px; */
}

textarea {
	resize: none;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	width: 100%;
}

body {
	margin: 0;
	line-height: 1.5;
	color: #495057;
	text-align: left;
	background-color: #eef1f3
}

.profile-box {
	display: flex;
}

.img-profile {
	border-radius: 70%;
	width: 100%;
	height: 100%;
}

.profile-detail {
	text-align: center;
}

.name {
	font-weight: bold;
}

.list li {
	margin-top: 5px;
}

.label {
	font-size: 12px;
}

.profile-detail {
	justify-content: flex-start;
	flex-direction: column;
}

/* 리뷰 css */
body {
	background: #eee
}

.date {
	font-size: 11px
}

.comment-text {
	font-size: 12px
}

.fs-12 {
	font-size: 12px
}

.shadow-none {
	box-shadow: none
}

.name {
	color: #007bff
}

.cursor:hover {
	color: blue
}

.cursor {
	cursor: pointer
}
</style>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>

	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div id="board-title">
			<span><h3>이벤트</h3></span>
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
				<div class="row" style="border-top:1px solid black; margin:0px;height:30px;line-height:29px;">
					<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
						제목
					</div>
					<div class="col-12 col-sm-10" style="white-space: nowrap;overflow:hidden;">
						[이벤트] 월하합작 가입 환영 이벤트 - 月下合酌
					</div>
				</div>
				<div class="row" style="margin:0px;border-top:1px solid gray;border-bottom:1px solid gray;height:30px;line-height:28px;">
					<div class="col-2 d-none d-sm-block" style="background-color:#B1D0E0;white-space: nowrap;overflow:hidden;">
						이벤트 기간
					</div>
					<div class="col-12 col-sm-10" style="white-space: nowrap;overflow:hidden;">
						2022.01.12 ~ 2022.02.09
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-12" id="contents" name="contents"
							style="min-height: 200px; overflow: auto;">
						<img src="/resources/event/배송안내.png" width=100% height=100%>
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
		<hr>
	</div>
</body>
</html>