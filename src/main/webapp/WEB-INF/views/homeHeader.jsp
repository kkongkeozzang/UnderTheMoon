<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Under The Moon</title>

<!--CSS 파일-->

<link  rel="stylesheet" href="/resources/home/css/home.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body>

<div id="userMenu">
    <ul class="list_menu">
        <li class="menu none_sub menu_join"><a href="/signup" class="link_menu">회원가입</a></li>
        
			<sec:authorize access="isAuthenticated()">
				<li class="menu none_sub menu_logout"><a href="/logout" class="link_menu">로그아웃</a> </li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				 <li class="menu none_sub menu_login"><a href="/login" class="link_menu">로그인</a> </li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="menu none_sub menu_logout"><a href="/admin/adminOffice" class="link_menu">관리자페이지</a> </li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<li class="menu none_sub menu_logout"><a href="/seller/sellerOffice" class="link_menu">판매자페이지</a> </li>
			</sec:authorize>
						
       
        <li class="menu lst"><a href="" class="link_menu">
                <div class="dropdown">
                    <span>고객센터</span>
                    <div class="dropdown-content" id="dropdown-index">
                            <p><a href="/faq/toFaq?cPage=1">FAQ</a></p>
                            <p><a href="/notice/toNotice?cPage=1">공지</a></p>
                            <p><a href="/qna/qnaList">1:1 문의</a></p>
                    </div>
                </div>
            </a>
        </li>
    </ul>
</div>

<!-- 로고 -->
<div id="headerLogo" class="layout-wrapper">
<h1 class="logo">
<a href="/" class="link_main">
<span id="gnbLogoContainer"></span>
<img src="" alt="월하합작 로고">
</a>
</h1>
<a href="/shop/board/view.php?id=notice&no=64" onclick="ga('send','event','etc','main_gif_btn_click');" class="bnr_delivery">
</a>
</div>

<!--nav 시작부분 -->
<div id="gnb">
<div class="fixed_container">
<div id="gnbMenu" class="gnb_kurly">
<div class="inner_gnbkurly">
<div class="gnb_main">
<ul class="gnb">

<!-- dropdown 메뉴 -->
<li class="menu1"><a href="/md/list">
    <span class="ico"></span>
    <span class="txt">
    <div class="dropdown">
        <span>지역별 전통주</span>
        <div class="dropdown-content" id="dropdown-index">
<p>서울</p>
<p>인천</p>
<p>경기</p>
<p>강원</p>
<p>충북</p>
<p>충남</p>
<p>전북</p>
<p>전남</p>
<p>부산</p>
<p>대전</p>
<p>울산</p>
<p>경북</p>
<p>경남</p>
<p>제주</p>
        </div>
    </div>
</span>
</a></li>

<!-- 일반 메뉴 -->
<li class="menu2"><a class="link new " href="/md/list"><span class="txt">전체 상품</span></a></li>
<li class="menu3"><a class="link best " href="/event/toEvent"><span class="txt">이벤트</span></a></li>
<li class="menu4"><a class="link bargain " href="/mypage/myPageList?cPage=1"><span class="txt">마이페이지 </span></a></li>

</ul>
<!-- searchbar 검색바 -->
<div id="side_search" class="gnb_search">
<input name="search" type="text" id="search" class="inp_search" value="" required label="검색어" placeholder="검색어를 입력해주세요.">
<a href="javascript:void(0);" id="search-button"><input type=image src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"></a>
</div>

<!-- 찜한 상품 -->
<div class="gnbPick">
<a class="btn_pick" href="/shop/mypage/mypage_pick.php">찜한 상품 보기</a>
</div>
<script src="/asset/js/myp/destination/popup.bundle.js?ver=1.63.2"></script>
</div>
<div class="gnb_sub">
<div class="inner_sub">
<ul class="gnb_menu" data-default="219" data-min="219" data-max="731">
<gnb-menu-pc v-for="(item, idx) in dataGnb" :main-menu="item" :sub-menu="item.categories" :sub-open="item.subOpen" :get-category-num="getCategoryNum" :key="'gnb'+idx" :idx="idx"></gnb-menu-pc>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<script src="/common_js/gnb_v1.js?ver=1.63.2"></script>
<script type="text/javascript">


//검색하기..
	$('#search-button').on('click', function() {
	  
	  location.href = "/md/search?search="+$('#search').val(); 
	  });

    gnbMenu.update();  


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

  $('#gnb .gnb .link').on('click', function(e){
    e.preventDefault();
    var _event_name, _event_info;
    if(sessionStorage.getItem('goodsListReferrer')){
      sessionStorage.setItem('goodsListReferrer', false);
    }
    if($(this).hasClass('new')){
      _event_name = 'select_new_product_subtab';
    }else if($(this).hasClass('best')){
      _event_name = 'select_popular_product_subtab';
    }else if($(this).hasClass('bargain')){
      _event_name = 'select_bargain_subtab';
    }else if($(this).hasClass('event')){
      _event_name = 'select_event_list_subtab';
    }
    _event_info = $(this).attr('href');

    KurlyTracker.setAction(_event_name).sendData();
    location.href = _event_info;
  });
  



  // 찜하기 아이콘 클릭이벤트
  $('#gnbMenu .btn_pick').on('click', function(e) {
    e.preventDefault();
    KurlyTracker.setAction('select_my_kurly_pick_list', { selection_type: 'header' }).sendData();
    location.href = $(this).attr('href');
  });
  
</script>

</body>
</html>