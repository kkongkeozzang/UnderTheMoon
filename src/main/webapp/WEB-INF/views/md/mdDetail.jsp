<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link rel="apple-touch-icon" href="/resources/mdDetail/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<link rel="stylesheet" href="/resources/mdDetail/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/mdDetail/assets/css/templatemo.css">
<link rel="stylesheet" href="/resources/mdDetail/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/resources/mdDetail/assets/css/fontawesome.min.css">

<!-- Slick -->
<link rel="stylesheet" type="text/css" href="/resources/mdDetail/assets/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="/resources/mdDetail/assets/css/slick-theme.css">

<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<style>
.review-content-div img{
	max-width: 80%;
	height:auto;
}
#tabs {
	font-size:18px !important;
	font-family: 'Roboto', sans-serif !important;
}
#mainLogo {
	max-width: 100%;
    height: auto;
}
.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
  z-index:1000;
}

.popup {
  z-index:1000 !important;
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
.hiddenRow {
    padding: 0 !important;
}
table tr th {
	text-align:center;
}
ul.pages {
	margin-top: 30px;
    text-align: center;
}
ul.pages li a {
	width: 44px;
	height: 44px;
	display: inline-block;
	line-height: 42px;
	border: 1px solid #eee;
	font-size: 15px;
	font-weight: 700;
	color: #121212;
	transition: all .3s;
}
.mdDetailPage a {
	text-decoration: none!important;
}
.mdDetailPage ul {
	padding: 0;
    margin: 0;
	list-style: none;
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px
}
ul.pages li {
	display:inline-block!important;
}
.show-toggle {
	display:table-row!important;
}
.hide-toggle {
	display:none!important;
}
.review-content-div{
	padding:10px 50px;
}
.helpful-box {
	text-align:right;
	padding-top: 10px;
}
.container {
	max-width:1300px !important;
}
.popup {
	width:80% !important;
}
</style>
<script>
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo"; 
document.cookie = "crossCookie=bar; SameSite=None; Secure";
$(document).ready(function(){
	$("body").on("click",".review-title",function(){
		let md_review_id = $(this).find(".md_review_id").html();
		$(this).next().toggleClass("hide-toggle");
		$(this).parent("#review-board").find(".review-content").not($(this).next()).addClass("hide-toggle");
		viewCount(md_review_id, $(this).find(".md_review_view_count"));
	})
	$("body").on("click",".helpful",function(){
		let md_review_id2 = $(this).closest(".review-content").prev().find(".md_review_id").html();
		likeCount(md_review_id2, $(this), $(this).closest(".review-content").prev().find(".md_review_like"));
	})
	$("body").on("click",".inqry-title",function(){
 		$(this).next().toggleClass("hide-toggle");
     	$(this).parent("#inqry-board").find(".inqry-content").not($(this).next()).addClass("hide-toggle");
     	 // 로그인한 회원의 글일 때
        let member_username2 = $(this).find(".member_username").text();
        let deleteInqryBox = $(this).next().find(".delete-inqry-box");
        if(member_username2 == "${principal.username}") {
        	str = "";
        	str += "<button class='delete-inqry-btn'>삭제</button>";
        	deleteInqryBox.html(str);
        }
    })
    $("body").on("click",".relatedMd-box", function(){
    	let relatedMd_id = $(this).find(".relatedMd_id").val()
    	location.href="/md/detail/page?md_id="+relatedMd_id;
    })
})
$("body").on("click",".delete-inqry-btn",function(){
	if(confirm("정말 삭제하시겠습니까?")) {
		let md_inqry_id = $(this).closest(".inqry-content").prev().find(".md_inqry_id").text();
		let inqryTitleBox = $(this).closest(".inqry-content").prev();
		let inqryContentBox = $(this).closest(".inqry-content");
		$.ajax({
			url:"/md/detail/inqry/rest/delete/"+md_inqry_id,
			type:"delete",
			dataType:"json"
		}).done(function(){
			inqryTitleBox.remove();
			inqryContentBox.remove();
		})
	}
})
function viewCount(md_review_id, target) {
	$.ajax({
		url:"/md/detail/review/rest/board/"+md_review_id,
		dataType:"json",
		type:"get"
	}).done(function(resp){
		if(resp != "null") {
			target.html(resp);
		} 
	})
}
function likeCount(md_review_id, target, target2) {
	$.ajax({
		url:"/md/detail/review/rest/board/like/"+md_review_id,
		dataType:"json",
		type:"get"
	}).done(function(resp){
		if(resp != "null") {
			target.html("도움이 돼요 "+resp);
			target2.html(resp);
		} 
	})
}
function getPage(pageNavi, select, sort) {
	if(sort == "question") {
		$.ajax({
			url: "/md/detail/inqry/rest/board/"+$("#md_id").val()+"/"+sort+"/"+pageNavi,
			type:"get",
			dataType:"json"
		}).done(function(resp){
			let inqrysSize = resp.inqrys.length;
			let naviSize = resp.pageNavis.length;
			let str = "";
			if(inqrysSize > 0) {
				for(let i = 0; i < inqrysSize; i++) {
					
    				str += "<tr class='inqry-title'>";
    				str += "<td class='md_inqry_id' style='width:5%;'>"+resp.inqrys[i].sort_md_question_id+"</td>";
    				str += "<td style='width:60%'>"+resp.inqrys[i].md_question_title+"</td>";
    				str += "<td class='member_username'>"+ resp.inqrys[i].md_question_username +"</td>";
    				str += "<td>"+ resp.inqrys[i].questionFormedDate +"</td>";
    				str += "<td>"+ resp.inqrys[i].md_question_reply_yn +"</td>";
    				str += "</td>";
    				str += "</tr>";
       				str += "<tr class='inqry-content hide-toggle'>";
    				str += "<td colspan='5'>";
    				str += "<div><div class='d-flex user-box'>";
    				str += "<span><img src='/resources/faqList/문.svg' style='width:24px;'></span><div class='user-inqry-content'>"
    				str += resp.inqrys[i].md_question_content;
    				str += "</div></div>";
					if(resp.inqrys[i].md_response_content != null) {
						str += "<div class='d-flex admin-box'><span><img src='/resources/faqList/답.svg' style='width:24px;'></span><div>"
						str += "<div class='answer-inqry-content'>";
	    				str += resp.inqrys[i].md_response_content;
	    				str += "</div>";
	    				str += "<div class='answer-inqry-date'>"
	    				str += resp.inqrys[i].responseFormedDate;
	    				str += "</div>"
	    				str += "</div>"
	    				str += "</div>"
    				}
    				str += "</div>";
    				str += "<div class='delete-inqry-box'></div>";
    				str += "</tr>";
    				
    				str += "</tr>";
				}
			
				$("#inqry-board").html(str);	
				let pageStr = "";
				for(let i = 0; i < naviSize; i++) {
					pageStr += "<li>";
					pageStr += resp.pageNavis[i];
					pageStr += "</li>";
				}
				$(".pages").html(pageStr);
			} 
		})
	} else {
		$.ajax({
			url: "/md/detail/review/rest/board/"+$("#md_id").val()+"/"+sort+"/"+pageNavi,
			type: "get",
			dataType: "json"
		}).done(function(resp){
			let reviesSize = resp.reviews.length;
			let naviSize = resp.pageNavis.length;
			let str = "";
			if(reviesSize > 0) {
				for(let i = 0; i < reviesSize; i++) {
					str += "<tr class='review-title'>";
					str += "<td style='width:5%;' class='md_review_id'>"+resp.reviews[i].md_review_id+"</td>";
					str += "<td style='width:60%'>"+resp.reviews[i].md_review_title+"</td>";
					str += "<td class='member_username'>"+ resp.reviews[i].member_username +"</td>";
					str += "<td>"+ resp.reviews[i].formedDate +"</td>";
					str += "<td class='md_review_like'>"+ resp.reviews[i].md_review_like+"</td>";
					str += "<td class='md_review_view_count'>"+ resp.reviews[i].md_review_view_count +"</td>";
					str += "</td>";
					str += "</tr>";
					
					str += "<tr class='review-content hide-toggle'>";
					str += "<td colspan='6'>";
					str += "<div class='review-content-div'>"
					str += resp.reviews[i].md_review_content;
					str += "<div class='helpful-box'><button class='helpful'>도움이 돼요 "+resp.reviews[i].md_review_like+"</button></div>";
					str += "</div>";
					str += "</tr>";
					
					str += "</tr>";
					
				}
			
				$("#review-board").html(str);	
				let pageStr = "";
				for(let i = 0; i < naviSize; i++) {
					pageStr += "<li>";
					pageStr += resp.pageNavis[i];
					pageStr += "</li>";
				}
				$(".pages").html(pageStr);
			}
		})
	}
	
}
	$(function(){
		let cart_item_count = $("#cart_item_count").text();
		let cart_item_count_int = Number(cart_item_count);
		
		$("#cart").on("click",function(){
			$.ajax({
		  	  type: 'post',
		        url:"/cart/rest/addToCart",
		        data: {
		      	  member_username: $("#member_username").val(),
		            md_id: $("#md_id").val(),
		            cart_item_count: $("#cart_item_count").text()
		        }
		     }).done(function(resp){
		    	  if(confirm("장바구니에 선택하신 상품을 추가하였습니다.\n장바구니로 이동하시겠습니까?")){ 
		    		 document.location.href="/cart/cart";
		    		} 
		     })
		   })
		})
</script>
</head>
<body>
	


    <!-- Open Content -->
    <section class="mdDetailPage">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5 img-box">
                    <div class="card mb-3 img-box2">
                        <img class="card-img img-fluid" src="/mdImage/${mdDetails.md_image}" alt="Card image cap" id="product-detail">
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7" style="margin-top:50px">
                    <div class="card">
                        <div class="card-body" id="md-detail">
                        	<input id="md_id" name="md_id" type="hidden" value="${mdDetails.md_id }">
                        	<input id="member_username" name="member_username" type=hidden value=${principal.username }>
                        	<input id="wish_item" name="wish_item" type=hidden value="${mdDetails.md_name }">
                        	<input id="wish_price" name="wish_price"type=hidden value=${mdDetails.md_price }>
                            <h1 class="h2">${mdDetails.md_name }</h1>
                            <div id="price-box">
                            	<p class="h3 py-2"><fmt:formatNumber value="${mdDetails.md_price }" pattern="#,###" /></p>
                            	<p id="won">원</p>
                            </div>
                            <div class="md-detail-box">
	                            <div class="detail-box">
	                            	<p class="detail-title">지역</p>
	                            	<p class="detail-content">${mdDetails.md_region }</p>
	                            </div>
	                            <div class="detail-box">
	                            	<p class="detail-title">주종</p>
	                            	<p class="detail-content">${mdDetails.md_category }</p>
	                            </div>
	                            <div class="detail-box">
	                            	<p class="detail-title">도수</p>
	                            	<p class="detail-content">${mdDetails.md_abv }%</p>
	                            </div>
	                            <div class="detail-box">
	                            	<p class="detail-title">설명</p>
	                            	<p class="detail-content">${mdDetails.md_content }</p>
	                            </div>
	                            
                            </div>
                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3" style="padding-left:10px">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge badge-secondary" id="cart_item_count">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="gnbPick">
									</div>
                                    <div class="col d-flex">
                                    <sec:authorize access="isAnonymous()">
                                    	<a href="/login"><button type="button" class="btn_pick pick_icon_button" ></button></a>
                                    	<button type="button" id="login-cart" class=" btn btn-success btn-lg" name="submit" value="addtocard" >회원전용</button>
                                    </sec:authorize>
                                    <sec:authorize access="isAuthenticated()">
                                    	<c:choose>
                                    	<c:when test="${wishResult == 1}">
										<button type="button" class="btn_pick pick_icon_button on" ></button>
										<script>
										$(".pick_icon_button.on").on("click", function(){
											$(this).toggleClass("on off");
											if($(this).hasClass("off")){
											$.ajax({
                                      		  type: 'post',
                                      		  url:"/md/detail/cancelWishMd",
                                      		  data: {
                                      		    md_id: $("#md_id").val()
                                      		        }
                                      		     })
											}else if($(this).hasClass("on")){
												$.ajax({
		                                  		  type: 'post',
		                                  		  url:"/md/detail/wishMd",
		                                  		  data: {
		                                  		  	wish_item: $("#wish_item").val(),
		                                  		  	md_id: $("#md_id").val(),
		                                  		  	wish_price: $("#wish_price").val()
		                                  		        }
		                                  		     })
											}
										})
										</script>
										<button type="button" id="cart" class=" btn btn-success btn-lg" name="submit" value="addtocard">장바구니 담기</button>
										</c:when>
										<c:otherwise>
										<button type="button" class="btn_pick pick_icon_button" ></button>
										<button type="button" id="cart" class=" btn btn-success btn-lg" name="submit" value="addtocard">장바구니 담기</button>
										<script>
                                    	$(".pick_icon_button").on("click", function(){
                                    		$(this).toggleClass("on");
                                    		if($(this).hasClass("on")){
                                    		$.ajax({
                                  		  	  type: 'post',
                                  		        url:"/md/detail/wishMd",
                                  		        data: {
                                  		      	  wish_item: $("#wish_item").val(),
                                  		          md_id: $("#md_id").val(),
                                  		          wish_price: $("#wish_price").val()
                                  		        }
                                  		     })
                                    		}else{
                                    			$.ajax({
                                        		  type: 'post',
                                        		  url:"/md/detail/cancelWishMd",
                                        		  	data: {
                                        		      md_id: $("#md_id").val()
                                        		        }
                                        		     })
                                    		}
                                    	})
                                    	
                                        </script> 
										</c:otherwise>										
										</c:choose>										
									</sec:authorize>
									<script>
										$("#login-cart").on("click",function(){
                                        location.href="/login";
                                     	})
									</script>  									                                                                        
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Start Article -->
    <section class="py-5 mdDetailPage">
        <div class="container" id="first-md-container">
            <div class="row text-left p-2 pb-3">
                <h4>Related Products</h4>
            </div>

            <!--Start Carousel Wrapper -->
            <div id="carousel-related-product">
				<c:forEach var="relatedMd" items="${relatedMds }">
                <div class="p-2 pb-3 relatedMd-box">
                	<input type=hidden class="relatedMd_id" value="${relatedMd.md_id }">
                    <div class="product-wap rounded-0">
                        <div class="rounded-0 related-img-box">
                            <img class="card-img rounded-0 img-fluid" src="/mdImage/${relatedMd.md_image }">
                        </div>
                        <div class="card-body">
                            <p class="relatedMd-name">${ relatedMd.md_name}</p>
                            <p class="mb-0"><fmt:formatNumber value="${relatedMd.md_price }" pattern="#,###" />원</p>
                        </div>
                    </div>
                </div>
				</c:forEach>
            </div>
        </div>
    </section>
    <!-- End Article -->
    
    <div class="container mdDetailPage">
	    <div id="tabs">
		  <ul>
		    <li><a href="#fragment-1"><span>상품설명</span></a></li>
		    <li><a href="#fragment-3"><span>후기(${allMdReviewCount})</span></a></li>
		    <li><a href="#fragment-4"><span>문의</span></a></li>
		  </ul>
		  <div id="fragment-1">
		    <img style="width:100%;" src="/mdImage/${mdDetails.md_detail_image}">
		  </div>
		  <div id="fragment-3">
				<p>PRODUCT REVIEW</p>
				<p>상품에 대한 후기를 남기는 공간입니다. 해당 게시판 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
				<p>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.</p>
				<select id="sort-box" style="float:right">
				<option value="newSort">최근등록순</option>
				<option value="likeSort">좋아요많은순</option>
				<option value="viewSort">조회많은순</option>
				</select>
				<table class="table table-condensed table-striped " id="review-box">
					<thead >
						<tr >
							<th style="width:5%;">번호</th>
							<th style="width:60%">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>도움</th>
							<th>조회</th>
						</tr>
					</thead>
	
					<tbody id="review-board">
						<!-- 게시판 제목 부분 -->
						<tr>
							<td colspan="6" style="text-align:center">등록된 후기가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<div id="page-box">
				<ul class="pages" id="pages" ></ul>
				</div>
		</div>
		
		<div id="fragment-4">
				<p>PRODUCT Q & A</p>
				<p>상품에 대한 문의를 남기는 공간입니다. 해당 게시판 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
				<p>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.</p>
				
				<table class="table table-condensed table-striped" id="inqry-box">
					<thead >
						<tr >
							<th style="width:5%;">번호</th>
							<th style="width:60%">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
	
					<tbody id="inqry-board">
						<!-- 게시판 제목 부분 -->
						<tr>
							<td colspan="6" style="text-align:center">등록된 문의가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				
				<sec:authorize access="isAuthenticated()">
					<a href="#popup-inqry-write"><button id="md-inqry-write">문의하기</button></a>
				</sec:authorize>
				
				<div id="page-box">
				<ul class="pages" ></ul>
				</div>
				<div id="popup-inqry-write" class="overlay">
                    <div class="popup">
                        <h2>상품 문의하기</h2>
                        <a class="close" href="javascript:history.back()">&times;</a>
                        <div class="content" style="text-align:center;">
                            <br>
                            <div id="md-box">
					           <div id="md-img-box">
					           		<div id="img-box2">
					           			<img src="/mdImage/${mdDetails.md_image}">
					           		</div>
					           </div>
					           <span>${mdDetails.md_name}</span>
					       </div>
                            <form action="/md/detail/inqry/insert" method="post" id="inqry-frm">
					           <table class="table table-boardered">
					               <tr>
					                   <th id="tableHead">제목</th>
					                   <td><input type="text" maxlength="30" class="form-control" id="md_question_title" name="md_question_title" placeholder="제목을 입력해주세요.">
					                    </td>        
					               </tr>
					                
					               <tr>
						                <th id="tableHead">문의 하기</th>
						                <td>
						                 <textarea rows="10" cols="40" maxlength="1000" id="md_question_content" placeholder="상품문의 작성 전 확인해주세요&#13;&#10;- 답변은 영업일 기준 2~3일 소요됩니다.&#13;&#10;- 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.&#13;&#10;- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.&#13;&#10;- 문의는 수정이 불가하니 신중하게 작성해주세요.
						                 " name="md_question_content" wrap="hard" class="form-control"></textarea>
						                </td>     
						            </tr>
					               <tr>
					                   <td colspan="2">
					                   <input type="button" id="write-review-btn" class="btn btn-primary sharp" value="등록하기">
					                   <input type="hidden" name="md_id" id="md_id" value="${mdDetails.md_id }">
					                   </td>
					               </tr>
					           </table>
					       </form>
                            <script>
                            $("#write-review-btn").on("click",function(){
                            	if(confirm("문의를 등록하시겠습니까?\n문의글은 수정이 불가합니다.")) {
                            		$("#inqry-frm").submit();
                            	}
                            })
                            </script>
                        </div>
                    </div>
			    </div>
		  </div>
		
	</div>
	</div>
	
	
	
	<script>
		$('#tabs').tabs({
            activate: function(event ,ui){
                let selectTab = ui.newTab.index();
                <%-- 상품후기 탭 클릭시 게시판 보이기 --%>
                if(selectTab == 1) {
                	$.ajax({
            			url:"/md/detail/review/rest/board/"+$("#md_id").val()+"/all/1",
            			type:"get",
            			dataType:"json"
            		}).done(function(resp){
            			let reviewsSize = resp.reviews.length;
            			let naviSize = resp.pageNavis.length;
        				let str = "";
            			if(reviewsSize > 0) {
            				for(let i = 0; i < reviewsSize; i++) {
            					
	            				str += "<tr class='review-title'>";
	            				str += "<td style='width:5%;' class='md_review_id'>"+resp.reviews[i].md_review_id+"</td>";
	            				str += "<td style='width:60%'>"+resp.reviews[i].md_review_title+"</td>";
	            				str += "<td class='member_username'>"+ resp.reviews[i].member_username +"</td>";
	            				str += "<td>"+ resp.reviews[i].formedDate +"</td>";
	            				str += "<td class='md_review_like'>"+ resp.reviews[i].md_review_like+"</td>";
	            				str += "<td class='md_review_view_count'>"+ resp.reviews[i].md_review_view_count +"</td>";
	            				str += "</td>";
	            				str += "</tr>";
	            				
	            				str += "<tr class='review-content hide-toggle'>";
	            				str += "<td colspan='6'>";
	            				str += "<div class='review-content-div'>"
	            				str += resp.reviews[i].md_review_content;
	            				str += "<div class='helpful-box'><button class='helpful'>도움이 돼요 "+resp.reviews[i].md_review_like+"</button></div>";
	            				str += "</div>";
	            				str += "</tr>";
	            				
	            				str += "</tr>";
            				}
            			
            				$("#review-board").html(str);	
            				let pageStr = "";
            				for(let i = 0; i < naviSize; i++) {
            					pageStr += "<li>";
            					pageStr += resp.pageNavis[i];
            					pageStr += "</li>";
            				}
            				$(".pages").html(pageStr);
            			} 
            			$("body").one("click",".review-title",function(){
            				let md_review_id = $(this).find(".md_review_id").text();
            				let content = $(this).next().find(".helpful-box");
           					$.ajax({
               					url:"/md/detail/review/rest/board/image/"+md_review_id,
               					type:"get",
               					dataType:"json"
               				}).done(function(resp){
               					let imgStr = "";
               					for(let i=0; i<resp.images.length; i++) {
   	            					imgStr += "<img src='/mdReviewImage" + resp.images[i].md_review_image + "'>"
               					}
               					content.before(imgStr);
               				})
            				
            				// 로그인한 회원의 글일 때
            				let member_username = $(this).find(".member_username").text();
            				let helpfulBtn = $(this).next().find(".helpful");
            				let helpfulBox = $(this).next().find(".helpful-box");
            				if(member_username == "${principal.username}") {
            					helpfulBtn.hide();
            					str = "";
            					str += "<button class='deleteBtn'>삭제</button>";
            					helpfulBox.html(str);
            				}
            			})
            			$("body").on("click",".deleteBtn",function(){
            				let md_review_id = $(this).closest(".review-content").prev().find(".md_review_id").text();
            				let reviewTitleBox = $(this).closest(".review-content").prev();
            				let reviewContentBox = $(this).closest(".review-content");
            				$.ajax({
            					url:"/md/detail/review/rest/delete/"+md_review_id,
            					type:"delete",
            					dataType:"json"
            				}).done(function(){
            					reviewTitleBox.remove();
            					reviewContentBox.remove();
            				})
            			})
            			$("body").on("change","#sort-box",function(){
            				let selectSort = this.value;
       						$.ajax({
       							url:"/md/detail/review/rest/board/"+$("#md_id").val()+"/"+selectSort+"/1",
       							type:"get",
       							dataType:"json"
       						}).done(function(resp){
       							let reviewsSize = resp.reviews.length;
       	            			let naviSize = resp.pageNavis.length;
       	        				let str = "";
       	            			if(reviewsSize > 0) {
       	            				for(let i = 0; i < reviewsSize; i++) {
       	            					str += "<tr class='review-title'>";
       		            				str += "<td style='width:5%;' class='md_review_id'>"+resp.reviews[i].md_review_id+"</td>";
       		            				str += "<td style='width:60%'>"+resp.reviews[i].md_review_title+"</td>";
       		            				str += "<td class='member_username'>"+ resp.reviews[i].member_username +"</td>";
       		            				str += "<td>"+ resp.reviews[i].formedDate +"</td>";
       		            				str += "<td class='md_review_like'>"+ resp.reviews[i].md_review_like+"</td>";
       		            				str += "<td class='md_review_view_count'>"+ resp.reviews[i].md_review_view_count +"</td>";
       		            				str += "</td>";
       		            				str += "</tr>";
       		            				
       		            				str += "<tr class='review-content hide-toggle'>";
       		            				str += "<td colspan='6'>";
       		            				str += "<div class='review-content-div'>"
       		            				str += resp.reviews[i].md_review_content;
       		            				str += "<div class='helpful-box'><button class='helpful'>도움이 돼요 "+resp.reviews[i].md_review_like+"</button></div>";
       		            				str += "</div>";
       		            				str += "</tr>";
       		            				
       		            				str += "</tr>";
       		            				
       	            				}
       	            			
       	            				$("#review-board").html(str);	
       	            				let pageStr = "";
       	            				for(let i = 0; i < naviSize; i++) {
       	            					pageStr += "<li>";
       	            					pageStr += resp.pageNavis[i];
       	            					pageStr += "</li>";
       	            				}
       	            				$(".pages").html(pageStr);
       	            			} 
       						})
            			})
            			
            			
            		})
            		
                }
                <%-- 상품문의 탭 클릭시 게시판 보이기 --%>
                else if (selectTab == 2) {
                	$.ajax({
            			url:"/md/detail/inqry/rest/board/"+$("#md_id").val()+"/question/1",
            			type:"get",
            			dataType:"json"
            		}).done(function(resp){
            			let inqrysSize = resp.inqrys.length;
            			let naviSize = resp.pageNavis.length;
        				let str = "";
            			if(inqrysSize > 0) {
            				for(let i = 0; i < inqrysSize; i++) {
            					
	            				str += "<tr class='inqry-title'>";
	            				str += "<td class='md_inqry_id' style='width:5%;'>"+resp.inqrys[i].sort_md_question_id+"</td>";
	            				str += "<td style='width:60%'>"+resp.inqrys[i].md_question_title+"</td>";
	            				str += "<td class='member_username'>"+ resp.inqrys[i].md_question_username +"</td>";
	            				str += "<td>"+ resp.inqrys[i].questionFormedDate +"</td>";
	            				str += "<td>"+ resp.inqrys[i].md_question_reply_yn +"</td>";
	            				str += "</td>";
	            				str += "</tr>";
	            				str += "<tr class='inqry-content hide-toggle'>";
	            				str += "<td colspan='5'>";
	            				str += "<div><div class='d-flex user-box'>";
	            				str += "<span><img src='/resources/faqList/문.svg' style='width:24px;'></span><div class='user-inqry-content'>"
	            				str += resp.inqrys[i].md_question_content;
	            				str += "</div></div>";
            					if(resp.inqrys[i].md_response_content != null) {
            						str += "<div class='d-flex admin-box'><span><img src='/resources/faqList/답.svg' style='width:24px;'></span><div>"
            						str += "<div class='answer-inqry-content'>";
            	    				str += resp.inqrys[i].md_response_content;
            	    				str += "</div>";
            	    				str += "<div class='answer-inqry-date'>"
            	    				str += resp.inqrys[i].responseFormedDate;
            	    				str += "</div>"
            	    				str += "</div>"
            	    				str += "</div>"
                				}
	            				str += "</div>";
	            				str += "<div class='delete-inqry-box'></div>";
	            				str += "</tr>";
	            				
	            				str += "</tr>";
            				}
            			
            				$("#inqry-board").html(str);	
            				let pageStr = "";
            				for(let i = 0; i < naviSize; i++) {
            					pageStr += "<li>";
            					pageStr += resp.pageNavis[i];
            					pageStr += "</li>";
            				}
            				$(".pages").html(pageStr);
            			} 
            			
            			
            		})
            		
                }
                
                
                
                
                
	        }
		});

		
	</script>
	
	
    <!-- Start Script -->
    <script src="/resources/mdDetail/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/resources/mdDetail/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/mdDetail/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/mdDetail/assets/js/templatemo.js"></script>
    <script src="/resources/mdDetail/assets/js/custom.js"></script>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="/resources/mdDetail/assets/js/slick.min.js"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: false,  //무한 반복 옵션
            arrows: false,  // 옆으로 이동하는 화살표 표시 여부
            slidesToShow: 4,  // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll: 3,  //스크롤 한번에 움직일 컨텐츠 개수
            dots: true,  // 스크롤바 아래 점으로 페이지네이션 여부
            draggable : true,  //드래그 가능 여부
            responsive: [{  // 반응형 웹 구현 옵션
                    breakpoint: 1024,  //화면 사이즈 
                    settings: {
                    	//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
        
            
    </script>
    <!-- End Slider Script -->

</body>

</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>