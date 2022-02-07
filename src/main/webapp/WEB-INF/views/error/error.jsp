<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Cabin:400,700" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/resources/error/style.css" />
</head>

<body >
    <jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
      
    	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<div></div>
				<h1>404</h1>
			</div>
			<h2>Page not found</h2>
			<p>The page you are looking for might have been removed had its name changed or is temporarily unavailable.</p>
			<a href="/">home page</a>
		</div>
	</div>
    
    <!-- Scripts 
    <script src="<c:url value="resources/mainpage/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="resources/mainpage/js/swiper.min.js" />"></script>
    <script src="<c:url value="resources/mainpage/js/scripts.js" />"></script>
    -->
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>