<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/mdList/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/mdList/assets/css/fontawesome.css">
<link rel="stylesheet" href="/resources/mdList/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/resources/mdList/assets/css/owl.css">
<style>
.region-sort {
	border:1px solid black; !important
}
.region-sort li {
	width:96px;
}
</style>
<script>
$(document).ready(function(){
	sortFunc("none");
	
})
function sortFunc(sort) {
	$("#review-sort").on("click",function(){
		sortFuncDetail("reviewSort");
	});
	$("#new-sort").on("click",function(){
		sortFuncDetail("newSort");
	});
}
function sortFuncDetail(sort) {
	$.ajax({
		url: "/md/listPage",
		DataType: "json",
		type: "get",
		data: {
			currentPage: 1,
			sort: sort
			}
	}).done(function(resp){
		let mdsSize = resp.mds.length;
		let str = "";
		for(let i = 0;i < mdsSize; i++) {
			str += "<div class='col-lg-4 col-md-4 all des'>";
			str += "<div class='product-item'>";
			str += "<a ><img  alt=''></a>";
			str += "<div class='down-content'>";
			str += "<a ><h4>"+resp.mds[i].md_name+"</h4></a>";
			str += "<h6>"+resp.mds[i].md_price+"</h6>";
			str += "<p>"+resp.mds[i].md_content+"</p>";
			str += "<ul class='stars'>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "</ul>";
			str += "<span>Reviews (12)</span>";
			str += "</div>";
			str += "</div>";
			str += "</div>";
		}
		$("#list-page").html(str);
		getPage(resp.cPage, sort);
	})
}
function getPage(pageNavi, sort) {
	$.ajax({
		url: "/md/listPage",
		type: "get",
		dataType: "json",
		data: {
			currentPage: pageNavi,
			sort: sort
			}
	}).done(function(resp){
		let mdsSize = resp.mds.length;
		let naviSize = resp.pageNavis.length;
		let str = "";
		for(let i = 0; i < mdsSize; i++) {
			str += "<div class='col-lg-4 col-md-4 all des'>";
			str += "<div class='product-item'>";
			str += "<a><img alt=''></a>";
			str += "<div class='down-content'>";
			str += "<a><h4>"+resp.mds[i].md_name+"</h4></a>";
			str += "<h6>"+resp.mds[i].md_price+"</h6>";
			str += "<p>"+resp.mds[i].md_content+"</p>";
			str += "<ul class='stars'>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "<li><i class='fa fa-star'></i></li>";
			str += "</ul>";
			str += "<span>Reviews (12)</span>";
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
	
    <div class="products">
      <div class="container">
      	<div class="row region-sort">
			<ul class="nav justify-content-between" style="flex:1 1 100%">
				<li class="nav-item"><a class="nav-link" href="#">서울</a></li>
				<li class="nav-item"><a class="nav-link" href="#">부산</a></li>
				<li class="nav-item"><a class="nav-link" href="#">인천</a></li>
				<li class="nav-item"><a class="nav-link" href="#">대전</a></li>
				<li class="nav-item"><a class="nav-link" href="#">울산</a></li>
			</ul>
			<ul class="nav justify-content-between" style="flex:1 1 100%">
				<li class="nav-item"><a class="nav-link" href="#">경기도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">강원도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">충청북도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">충청남도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">전라북도</a></li>
				
			</ul>
			<ul class="nav justify-content-between" style="flex:1 1 100%">
				<li class="nav-item"><a class="nav-link" href="#">전라남도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경상북도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경상남도</a></li>
				<li class="nav-item"><a class="nav-link" href="#">제주도</a></li>
				<li class="nav-item"></li>
			</ul>
		</div>
        <div class="row">
          <div class="col-md-12">
            <div class="filters">
            <div class=count >총 ${allMdCount } 개</div>
            <div class=sort id=review-sort>리뷰순</div>
            <div class=sort id=new-sort>최신순</div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="filters-content">
                <div class="row grid" id="list-page">
                <div class="forEach">
                	<c:forEach var="md" items="${mds }">
	                    <div class="col-lg-4 col-md-4 all des">
	                      <div class="product-item">
	                        <a ><img alt=""></a>
	                        <div class="down-content">
	                          <a><h4>${md.md_name }</h4></a>
	                          <h6>${md.md_price }</h6>
	                          <p>${md.md_content }</p>
	                          <ul class="stars">
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                          </ul>
	                          <span>Reviews (12)</span>
	                        </div>
	                      </div>
	                    </div>
                   	</c:forEach>
                </div>
              <%--
              <script>
              	$("#review-sort").on("click",function(){
              		location.href="/md/reviewSort";
              	})
              	$("#new-sort").on("click",function(){
              		location.href="/md/newSort";
              	})
              </script>
              --%>
                <%-- 
               	<!-- 상품 정보 리스트 가져오기 -->
                	<c:forEach var="md" items="${mds }">
	                    <div class="col-lg-4 col-md-4 all des">
	                      <div class="product-item">
	                        <a href="#"><img src="/resources/mdList/assets/images/${md.md_image }" alt=""></a>
	                        <div class="down-content">
	                          <a href="#"><h4>${md.md_name }</h4></a>
	                          <h6>${md.md_price }</h6>
	                          <p>${md.md_content }</p>
	                          <ul class="stars">
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                            <li><i class="fa fa-star"></i></li>
	                          </ul>
	                          <span>Reviews (12)</span>
	                        </div>
	                      </div>
	                    </div>
                   	</c:forEach>
				--%>
                </div>
            </div>
          </div>
          <div class="col-md-12" id="page-box">
            <ul class="pages" id="pages">
            <c:forEach var="pageNavi" items="${ pageNavis}">
            	<li>${pageNavi}</li>
            </c:forEach>
            <%-- 
              <li><a href="#">1</a></li>
              <li class="active"><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
              --%>
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