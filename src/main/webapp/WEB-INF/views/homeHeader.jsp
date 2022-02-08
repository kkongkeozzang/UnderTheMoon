<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="/resources/home/css/home.css">
<link  rel="stylesheet" href="/resources/home/css/homeHeader.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>

<!-- 로그인, 회원가입, 고객센터 -->
<div id="topBar">
    <ul>
			<sec:authorize access="isAuthenticated()">
				<li><a id="sign" href="/logout">로그아웃</a> </li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				 <li><a id="sign" href="/signup" >회원가입</a></li>
				 <li><a id="sign" href="/login">로그인</a> </li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a id="sign" href="/admin/adminOffice" >관리자페이지</a> </li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<li><a id="sign" href="/seller/sellerOffice" >판매자페이지</a> </li>
			</sec:authorize>
						
       <div class="dropdown">
	        <li class="dropbtn">
	        <a href="" class="link_menu">고객센터</a>
                    <div class="dropdown-content">
                            <p><a href="/faq/toFaq?cPage=1">FAQ</a></p>
                            <p><a href="/notice/toNotice?cPage=1">공지</a></p>
                            <p><a href="/qna/qnaList">1:1 문의</a></p>
                    </div>
			        </li>
                </div>
            
    </ul>
        </div>


<!-- 로고 -->
<div id="mainLogo">
<h1>
<a href="/">
<img src="/resources/home/img/logo.png" id="logo" alt="월하합작 로고" >

</a>
</h1>
</div>

<!--nav 시작부분 -->

<div class="navScroll">
 <nav class="navbar navbar-expand-lg   navbar-light bg-white" id="navi">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="/md/list" id="navbardrop" data-toggle="dropdown">
              지역별 전통주
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="/md/search?search=서울">서울</a>
              <a class="dropdown-item" href="/md/search?search=인천">인천</a>
              <a class="dropdown-item" href="/md/search?search=경기도">경기</a>
              <a class="dropdown-item" href="/md/search?search=강원도">강원</a>
              <a class="dropdown-item" href="/md/search?search=충청북도">충북</a>
              <a class="dropdown-item" href="/md/search?search=충청남도">충남</a>
              <a class="dropdown-item" href="/md/search?search=대전">대전</a>
              <a class="dropdown-item" href="/md/search?search=전라북도">전북</a>
              <a class="dropdown-item" href="/md/search?search=전라남도">전남</a>
              <a class="dropdown-item" href="/md/search?search=부산">부산</a>
              <a class="dropdown-item" href="/md/search?search=울산">울산</a>
              <a class="dropdown-item" href="/md/search?search=경상북도">경북</a>
              <a class="dropdown-item" href="/md/search?search=경상남도">경남</a>
              <a class="dropdown-item" href="/md/search?search=제주도">제주</a>
            </div>
          </li>
            <li class="nav-item">
              <a class="nav-link" href="/md/list">전체 상품<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/event/toEvent">이벤트</a>
            </li>
            
          <li class="nav-item">
            <a class="nav-link" href="/mypage/myPageList?cPage=1">마이페이지</a>
          </li>

           <!-- <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Dropdown link
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="#">Link 1</a>
              <a class="dropdown-item" href="#">Link 2</a>
              <a class="dropdown-item" href="#">Link 3</a>
              <a class="dropdown-item" href="#">Link 4</a>
              <a class="dropdown-item" href="#">Link 5</a>
              <a class="dropdown-item" href="#">Link 6</a>
            </div>
          </li> -->
          

          </ul>
                              <!-- searchbar 검색바 -->
<div id="side_search" class="gnb_search">
<input name="search" type="text" id="search" class="inp_search" value="" required label="검색어" placeholder="검색어를 입력해주세요.">
<a href="javascript:void(0);" id="search-button"><input type=image src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"></a>
</div>

      <!-- searchbar 아이콘 -->
          <div id="icon">
          <span >
            <a href="/mypage/myPageLike?cPage=1" id="heartbtn"><i class="far fa-heart"  style="font-size: 25px;"></i></a></span>
			<span style="margin:10px;margin-top: 15px;"><a href="/cart/cart" id="cartbtn"><i class="fas fa-shopping-cart" style="font-size: 22px;"></i></a> </span>          
          </div>


        </div>
      </nav>
         
         
         
         

<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});


/*
$(function() {
	  var lnb = $("#navScroll").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#navScroll").addClass("fixed");
	    }else{
	      $("#navScroll").removeClass("fixed");
	    }
	  })
	});*/


</script>





<script>
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});


/*
$(function() {
	  var lnb = $("#navScroll").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#navScroll").addClass("fixed");
	    }else{
	      $("#navScroll").removeClass("fixed");
	    }
	  })
	});*/


</script>




<script type="text/javascript">


//검색하기..
	$('#search-button').on('click', function() {
	  if($('#search').val()=="") {
		  alert("입력란을 작성해주세요.");
	  } else {
		  location.href = "/md/search?search="+$('#search').val(); 
	  }
	  });



  // 검색창 클래스 추가/삭제
  var searchInputAction = (function(){
    var $target = {};

    var _searchInputAction = {
      setSeletor: function(){
        $target = {
          $parent: $('#gnb'),
          $search: $('#gnb [name=sword]'),
          $deleteBtn: $('#searchInit'),
          $edit: $('#edit')
        }

        this.setAction();
      },
      setAction: function(){
        var that = this;
        $target.$search.focus(function(){
          that.changeClass($target.$search, 'add', 'focus');
          that.deleteCheck();
        }).blur(function(){
          that.changeClass($target.$search, 'remove', 'focus');
          that.deleteCheck(false);
        }).on('keyup', function(){
          if($target.$edit.val() !== 'Y'){
            $target.$edit.val('Y');
          }
          that.deleteCheck();
        });

        $target.$deleteBtn.on('click', function(){
          $target.$search.val('');
          that.deleteCheck();
        });
      },
      deleteCheck: function(type){
        var that = this, count = $.trim($target.$search.val()).length;
        if(count === 0 || (typeof type !== 'undefined' &&  !type) ){
          that.changeClass($target.$deleteBtn, 'remove', 'on');
        }else{
          that.changeClass($target.$deleteBtn, 'add', 'on');
        }
      },
      changeClass: function(target, type, className){
        if(type === 'add'){
          target.addClass(className);
        }else{
          target.removeClass(className);
        }
      }
    }

    _searchInputAction.setSeletor();
  })();

  // 로고 클릭 이벤트
  $('#header .link_main').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    if (url.indexOf('/') === 0) {
      url = window.location.origin + url;
    }

    KurlyTracker.setAction('select_main_logo', {"url": url}).sendData();
    location.href = url;
  });


  // 찜하기 아이콘 클릭이벤트
  $('#gnbMenu .btn_pick').on('click', function(e) {
    e.preventDefault();
    KurlyTracker.setAction('select_my_kurly_pick_list', { selection_type: 'header' }).sendData();
    location.href = $(this).attr('href');
  });
  
</script>
</html>