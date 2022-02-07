<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/mdList/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/mdList/assets/css/fontawesome.css">
<link rel="stylesheet" href="/resources/mdList/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/resources/mdList/assets/css/owl.css">
<!-- Slick -->
<link rel="stylesheet" type="text/css" href="/resources/mdDetail/assets/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="/resources/mdList/assets/css/slick-theme.css">
<style>
#pages a:hover {
	background-color:#406882 !important;
	border:1px solid #406882 !important;
}
.region-sort {
	border:1px solid black; !important
}
.region-sort li {
	width:96px;
}
.product-item img{ 
	height:300px; !important
}
.product-item:hover { 
	cursor: pointer; !important
}
.img-box  {
    display: flex;
    justify-content: space-evenly;
}
.slick-slide img{ 
	height:100px; !important
}
.products {
	margin-top:50px;
}
.container {	
	max-width:1300px !important;
}
.slick-prev:before, .slick-next:before {
	color :#1A374D !important;
}
</style>
<script>
<%--
select (지역선택 또는 전체선택) : 서울, 부산, 인천, ..., ALL
sort (리뷰 많은 순 정렬, 최신 순 정렬) : reviewSort, newSort, none
--%>
$(document).ready(function(){
	sortFunc("all", "none");
	$("body").on("click",".product-item", function(){
		let md_id = $(this).find("#md_id").val();
		$.ajax({
			url:""
		})
		location.href = "/md/detail/page?md_id=" + md_id;
	})
	var currentPosition = parseInt($("#recently-md-view-box").css("top"));
	$(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $("#recently-md-view-box").stop().animate({"top":position+200+"px"},1000);
	});
})
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
function sortFunc(select, sort) {
	if (select != "all") {
		select = $(this).html();
	}
	$("#review-sort").on("click",function(){
		sortFuncDetail(select, "reviewSort");
	});
	$("#new-sort").on("click",function(){
		sortFuncDetail(select, "newSort");
	});
	$(".nav-item-span").on("click",function(){
		select = $(this).closest(".nav-item").text();
		sortFuncDetail(select, "none");
	})
}
function sortFuncDetail(select, sort) {
	$.ajax({
		url: "/md/listPage",
		DataType: "json",
		type: "get",
		data: {
			currentPage: 1,
			select: select,
			sort: sort
			}
	}).done(function(resp){
		let mdsSize = resp.mds.length;
		let str = "";
		for(let i = 0;i < mdsSize; i++) {
			str += "<div class='col-lg-4 col-md-4 all des'>";
			str += "<div class='product-item'>";
			str += "<div class='img-box'>";
			str += "<a ><img src="
			str += "'/mdImage/";
			str += resp.mds[i].md_image;
			str += "' alt=''></a></div>";
			str += "<div class='down-content'>";
			str += "<input type=hidden id='md_id' value="+resp.mds[i].md_id+">"
			str += "<h4>"+resp.mds[i].md_name+"</h4>";
			str += "<h6>"+priceToString(resp.mds[i].md_price)+"원</h6>";
			//str += "<p>"+resp.mds[i].md_content+"</p>";
			str += "</div>";
			str += "</div>";
			str += "</div>";
		}
		$("#list-page").html(str);
		getPage(resp.cPage, select, sort);
		$("#count").html("총 " + resp.allMdCount + " 개");
	})
}
function getPage(pageNavi, select, sort) {
	$.ajax({
		url: "/md/listPage",
		type: "get",
		dataType: "json",
		data: {
			currentPage: pageNavi,
			select: select,
			sort: sort
			}
	}).done(function(resp){
		let mdsSize = resp.mds.length;
		let naviSize = resp.pageNavis.length;
		let str = "";
		for(let i = 0; i < mdsSize; i++) {
			str += "<div class='col-lg-4 col-md-4 all des'>";
			str += "<div class='product-item'>";
			str += "<div class='img-box'>";
			str += "<a ><img src="
			str += "'/mdImage/";
			str += resp.mds[i].md_image;
			str += "' alt=''></a></div>";
			str += "<div class='down-content'>";
			str += "<input type=hidden id='md_id' value="+resp.mds[i].md_id+">"
			str += "<h4>"+resp.mds[i].md_name+"</h4>";
			str += "<h6>"+priceToString(resp.mds[i].md_price)+"원</h6>";
			//str += "<p>"+resp.mds[i].md_content+"</p>";
			str += "</div>";
			str += "</div>";
			str += "</div>";
		}
		$("#list-page").html(str);
		
		let pageStr = "";
		for(let i = 0; i < naviSize; i++) {
			pageStr += "<li>";
			pageStr += resp.pageNavis[i];
			pageStr += "</li>";
		}
		$("#pages").html(pageStr);
	})
}

</script>
</head>
<body>

	<c:if test="${fn:length(mdImgs) != 0}">
		<div id="recently-md-view-box" style="z-index:100;margin-right:10px;background-color:white;">
			<div id="recently-md-view-title" style="background-color:white;">최근본상품</div>
			<div id="recently-md-view-content">
			
			</div>
			<script src="/resources/mdList/assets/js/slick.min.js"></script>
			<script>
			<c:forEach var="mdImg" items="${mdImgs}">
				$("#recently-md-view-content").append("${mdImg}");
			</c:forEach>
			
			$("#recently-md-view-content").slick({
				infinite: false,  //무한 반복 옵션
	            arrows: true,  // 옆으로 이동하는 화살표 표시 여부
	            slidesToShow: 1,  // 한 화면에 보여질 컨텐츠 개수
	            slidesToScroll: 1,  //스크롤 한번에 움직일 컨텐츠 개수
	            dots: false,  // 스크롤바 아래 점으로 페이지네이션 여부
	            draggable : true,  //드래그 가능 여부
	            vertical : true,
	            responsive: [{  // 반응형 웹 구현 옵션
	                    breakpoint: 1024,  //화면 사이즈 
	                    settings: {
	                    	//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	                },
	                {
	                    breakpoint: 600,
	                    settings: {
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	                },
	                {
	                    breakpoint: 480,
	                    settings: {
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	                }
	            ]
			});
			</script>
		</div>
	</c:if>
    <div class="products">
      <div class="container">
      <div id="event-box"><a href="/event/eventKH"><img src="/resources/mdList/images/khEvent.png"></a></div>
      <div id="mdList-title">지역별 전통주</div>
      	<div class="row region-sort">
			<ul class="nav" >
				<li class="nav-item"><span class="nav-item-span">서울</span></li>
				<li class="nav-item"><span class="nav-item-span">부산</span></li>
				<li class="nav-item"><span class="nav-item-span">인천</span></li>
				<li class="nav-item"><span class="nav-item-span">대전</span></li>
				<li class="nav-item"><span class="nav-item-span">울산</span></li>
			</ul>
			<ul class="nav">
				<li class="nav-item"><span class="nav-item-span">경기도</span></li>
				<li class="nav-item"><span class="nav-item-span">강원도</span></li>
				<li class="nav-item"><span class="nav-item-span">충청북도</span></li>
				<li class="nav-item"><span class="nav-item-span">충청남도</span></li>
				<li class="nav-item"><span class="nav-item-span">전라북도</span></li>
				
			</ul>
			<ul class="nav">
				<li class="nav-item"><span class="nav-item-span">전라남도</span></li>
				<li class="nav-item"><span class="nav-item-span">경상북도</span></li>
				<li class="nav-item"><span class="nav-item-span">경상남도</span></li>
				<li class="nav-item"><span class="nav-item-span">제주도</span></li>
				<li class="nav-item"></li>
			</ul>
		</div>
        <div class="row">
          <div class="col-md-12">
            <div class="filters">
            <div class=count id=count>총 ${allMdCount } 개</div>
            <div class=sort id=review-sort>리뷰순</div>
            <div class="sort sort-none">|</div>
            <div class=sort id=new-sort>최신순</div>
            <script>
            	$(".sort").on("click", function(){
            		$(".sort").removeClass("on");
            		$(this).addClass("on");
            	})
            	$(".nav-item-span").on("click", function(){
            		$(".nav-item-span").removeClass("on");
            		$(".sort").removeClass("on");
            		$(this).addClass("on");
            	})
            </script>
            </div>
          </div>	
          <div class="col-md-12">
            <div class="filters-content">
                <div class="row" id="list-page">
                <div class="forEach d-flex">
                	<c:forEach var="md" items="${mds }">
	                    <div class="col-lg-4 col-md-4 all des">
	                      <div class="product-item">
	                        <div class="img-box"><a ><img src="/mdImage/${md.md_image}" alt=""></a></div>
	                        <div class="down-content">
	                          <input type=hidden id="md_id" value=${md.md_id }>
	                          <a><h4>${md.md_name }</h4></a>
	                          <h6><fmt:formatNumber value="${md.md_price }" pattern="#,###" />원</h6>
	                          <%--<p>${md.md_content }</p> --%>
	                        </div>
	                      </div>
	                    </div>
                   	</c:forEach>
                </div>
                </div>
            </div>
          </div>
          <div class="col-md-12" id="page-box">
            <ul class="pages" id="pages">
            <c:forEach var="pageNavi" items="${ pageNavis}">
            	<li>${pageNavi}</li>
            </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
	
    
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/mdList/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/mdList/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="/resources/mdList/assets/js/custom.js"></script>
    <script src="/resources/mdList/assets/js/owl.js"></script>
    <script src="/resources/mdList/assets/js/slick.js"></script>
    <script src="/resources/mdList/assets/js/isotope.js"></script>
    <script src="/resources/mdList/assets/js/accordions.js"></script>

  </body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>