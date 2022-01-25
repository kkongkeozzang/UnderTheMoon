<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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

</head>
<style>
	.fa-chevron-right{
		float:right;
	}
	li{
		padding-right:10px;
	}
</style>
<body>

	<!-- 사이드 박스 -->
	<div class="col-12 d-none d-md-block" style="float:left;position:absolute;width:180px;padding:100px 0;margin:30px;">
		<div style="padding-bottom:35px;">
			<h5><b>고객센터</b></h5>
			<i class="bi bi-chevron-right"></i>
		</div>
		<div>
			<ul class="list-group" >
			  <li class="list-group-item"><a href="/event/toEvent">이벤트<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
			  <li class="list-group-item"><a href="/notice/toNotice?cPage=1">공지사항<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
			  <li class="list-group-item"><a href="/faq/toFaq?cPage=1">자주묻는게시판<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
			  <li class="list-group-item"><a href="#">1:1문의<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>
</body>
</html>