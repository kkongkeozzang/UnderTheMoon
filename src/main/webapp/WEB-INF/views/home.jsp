<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Under The Moon</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="resources/home/css/home.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!--  
<link rel="stylesheet" href="/shop/data/skin/designgj/swiper.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css" />-->

</head>

<!--Body 시작 부분 -->
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

<!--전체를 감싸는 태그-->
<div id="wrap" class="">
<div id="pos_scroll"></div>
<div id="container">
<div id="header">


<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
<jsp:include page="homeHeader.jsp"></jsp:include>



<!--Main 내용 시작 부분-->
<div id="main">
<div id="content">
<div id="kurlyMain" class="page_main">

<!--이벤트 carousel-->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="resources/home/img/carouselTest1.png" class="d-block w-100" alt="1">
      </div>
      <div class="carousel-item">
        <img src="resources/home/img/carouselTest2.png" class="d-block w-100" alt="2">
      </div>
      <div class="carousel-item">
        <img src="resources/home/img/carouselTest1.png" class="d-block w-100" alt="3">
      </div>
      <div class="carousel-item">
        <img src="resources/home/img/carouselTest2.png" class="d-block w-100" alt="4">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>


<!--월하합작 팀을 위한 링크-->
    <a href="/md/list">상품 리스트</a>
	<a href="/login">로그인..</a>
	<a href="/signup">회원가입</a>
	<a href="/cart/cart">장바구니..</a>
	<a href="/mypage/myPageList?cPage=1">마이페이지</a>
	<a href="/notice/toNotice?cPage=1">공지사항</a>
	<a href="/faq/toFaq?cPage=1">자주하는질문</a>
	<a href="/event/toEvent">이벤트</a>
	<a href="/seller/sellerOffice">판매자</a>
	<a href="/admin/adminOffice">관리자</a>


<!--상품 소개-->



<!--타임 어택 상품 소개 -->
<br><div id="HourCountdown"></div><br>
        
<script>
//카운트 다운 기준 날짜
CountDownTimer('3/19/2022 11:59 AM', 'HourCountdown');

function CountDownTimer(dt, id) {

   var end = new Date(dt);
   var _second = 1000;
   var _minute = _second * 60;
   var _hour = _minute * 60;
   var _day = _hour * 24;
   var timer;

   function showRemaining() {

       var now = new Date();
       var distance = end - now;

       // 시간 종료 시 뜨는 문구
       if (distance < 0) {
           clearInterval(timer);
           document.getElementById(id).innerHTML = '다음 이벤트를 기대해 주세요!';
           return;
       }

       var days = Math.floor(distance / _day);
       var hours = Math.floor((distance % _day) / _hour);
       var minutes = Math.floor((distance % _hour) / _minute);
       var seconds = Math.floor((distance % _minute) / _second);

       document.getElementById(id).innerHTML = days + '일 ';    
       document.getElementById(id).innerHTML += hours + ' : ';
       document.getElementById(id).innerHTML += minutes + ' : ';
       document.getElementById(id).innerHTML += seconds;
   }
   timer = setInterval(showRemaining, 1000);
}
</script>



<!--지도 API-->


</div>


<!--footer 시작 -->
<jsp:include page="homeFooter.jsp"></jsp:include>

</body>
</html>