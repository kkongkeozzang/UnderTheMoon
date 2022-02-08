<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>

<!--CSS 파일-->										
<link  rel="stylesheet" href="resources/home/css/home.css">
<link  rel="stylesheet" href="resources/home/css/homeHeader.css">
<link  rel="stylesheet" href="resources/home/css/homeFooter.css">


<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Map API -->
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b7055bbf19a0b64e1b3065ba5fb484b&libraries=clusterer"></script>


</head>

<!--Body 시작 부분 -->
<body>


<!-- header -->


<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
<jsp:include page="homeHeader.jsp"></jsp:include>



<!-- body container -->

<div class="container-fluid" id="container">
<!--Main 내용 시작 부분-->
<div class="row">
<div class="col" id="carousel">

<!--이벤트 carousel-->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <a href="/event/eventTiger"><img src="resources/home/img/carouselTest1.png" class="d-block w-100" alt="1"></a>
      </div>
      <div class="carousel-item">
        <a href="event/eventKH"><img src="resources/home/img/carousel3.png" class="d-block w-100" alt="2"></a>
      </div>
      <div class="carousel-item">
        <a href="/event/eventRecommend"><img src="resources/home/img/carousel4.png" class="d-block w-100" alt="3"></a>
      </div>
      <div class="carousel-item">
       <a href="/event/eventWelcome"> <img src="resources/home/img/carousel2.png" class="d-block w-100" alt="4"></a>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
  </div>
</div>
</div>
<!--상품 소개-->



<!--상품 소개-->
<div class="row" id="main_title">
	<div class="col-2">
	</div>
	<div class="col">
이 달의 추천 상품
	</div>
	<div class="col-2">
	</div>
</div>

 
<div class="row justify-content-md-center main-md">
	<div class="col-2  ">
	</div>
	<div class=" col-2">
                <a href="/md/detail/page?md_id=60">
                    <img class="hover:grow hover:shadow-lg" src="/resources/home/img/main-md-1.png">
                    <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">서울의 밤</p>
                    <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">7,500원</p>
               
                </a>
            </div>
	<div class=" col-2">
                <a href="/md/detail/page?md_id=17">
                    <img class="hover:grow hover:shadow-lg" src="/resources/home/img/main-md-2.png">
                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">문희 오미자</p>
                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">21,000원</p>
                </a>
	</div>
	<div class=" col-2">
                <a href="/md/detail/page?md_id=6">
                    <img class="hover:grow hover:shadow-lg" src="/resources/home/img/main-md-3.png">
                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">추사 애플와인</p>
                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">20,000원</p>
                </a>
	</div>
	<div class="
	
	 col-2">
                <a href="/md/detail/page?md_id=29">
                    <img class="hover:grow hover:shadow-lg" src="/resources/home/img/main-md-4.png">
                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">홍삼 인삼주</p>
                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">70,000원</p>
                </a>
	</div>	
	<div class="col-2   ">
	</div>
</div>

<div class="row" id="interval">

</div>


<!--타임 어택 상품 소개 -->
<div class="row" id="main_title">
	<div class="col-2">
	</div>
	<div class="col">
	이벤트 특가 상품
	</div>
	<div class="col-2">
	</div>
</div>

<div class="row justify-content-md-center">
	<div class="col-2 "> 
	</div>
	<div class="col-2" id="timeattack"> 

<div class="clock-box">
<div class="clock-clock"></div>
</div>


	<br><div id="HourCountdown"></div><br>


</div>

	
	        
	<script>
	//카운트 다운 기준 날짜
	CountDownTimer('2/21/2022 11:59 PM', 'HourCountdown');
	
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
	
	       document.getElementById(id).innerHTML = days + '일 <br>';    
	       document.getElementById(id).innerHTML += hours + '시간 ';
	       document.getElementById(id).innerHTML += minutes + '분 ';
	       document.getElementById(id).innerHTML += seconds + '초 ';
	   }
	   timer = setInterval(showRemaining, 1000);
	}
	</script>
	<div class="col-md-6"> 
	<!-- 이미지 삽입 -->
	 <a href="/md/detail/page?md_id=3">
          <img class="" src="/resources/home/img/timeattack.png">
     </a>
	</div>
	<div class="col-2"> 
	</div>
	</div>

</div>


<div class="row" id="interval">

</div>

<!--지도 API-->
<div class="row" id="main_title">
	<div class="col-2 ">
	</div>
	<div class="col">
	전국 지역별 전통주	
	</div>
	<div class="col-2">
	</div>
</div>


<div class="row justify-content-md-center">

<div class="col col-lg-2"> </div>
<div class="col-md-auto"> 

<div id="map" style="width:200px;height:390px;"></div>

<script>

    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
        level : 14 // 지도의 확대 레벨
    });
    

    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 5, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });


    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/resources/home/json/place.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });


        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });

    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
</script>
</div>
<div class="col col-lg-2"> </div>


</div>

<!-- 게시글 띄우기 -->


</div>


<!--월하합작 팀을 위한 링크
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
-->



</div>

<!--footer 시작 -->
<jsp:include page="homeFooter.jsp"></jsp:include>


</body>
</html>