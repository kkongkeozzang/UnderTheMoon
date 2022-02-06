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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<style>
	.fa-chevron-right{
		float:right;
	}
	.list-group-item{
		padding-right:10px;
	}
</style>
<body>

	<!-- 사이드 박스 -->
	<div class="col-12 d-none d-md-block" style="width:100%;padding:0px;border:none;">
		<div style="padding-bottom:35px;">
			<h3 class="title">고객센터</h3>
		</div>
		<div>
			<ul class="list-group" >
			  <a href="/event/toEvent"><li class="list-group-item">이벤트<i class="fa fa-chevron-right" aria-hidden="true"></i></li></a>
			  <a href="/notice/toNotice?cPage=1"><li class="list-group-item">공지사항<i class="fa fa-chevron-right" aria-hidden="true"></i></li></a>
			  <a href="/faq/toFaq?cPage=1"><li class="list-group-item">자주묻는게시판<i class="fa fa-chevron-right" aria-hidden="true"></i></li></a>
			</ul>
		</div>
	</div>
</body>
</html>