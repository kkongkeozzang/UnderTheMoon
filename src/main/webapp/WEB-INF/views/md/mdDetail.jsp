<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
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
a {
	text-decoration: none!important;
}
ul {
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
    })
    $("body").on("click",".relatedMd-box", function(){
    	let relatedMd_id = $(this).find(".relatedMd_id").val()
    	location.href="/md/detail/page?md_id="+relatedMd_id;
    	
    })
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
    				str += "<td style='width:5%;'>"+resp.inqrys[i].sort_md_question_id+"</td>";
    				str += "<td style='width:60%'>"+resp.inqrys[i].md_question_title+"</td>";
    				str += "<td>"+ resp.inqrys[i].md_question_username +"</td>";
    				str += "<td>"+ resp.inqrys[i].questionFormedDate +"</td>";
    				str += "<td>"+ resp.inqrys[i].md_question_reply_yn +"</td>";
    				str += "</td>";
    				str += "</tr>";
       				str += "<tr class='inqry-content hide-toggle'>";
    				str += "<td colspan='5'>";
    				str += "<div>"
   					str += resp.inqrys[i].md_question_content;
    				if(resp.inqrys[i].md_response_content != null) {
	    				str += "<br>";
	    				str += "<br>";
	    				str += resp.inqrys[i].md_response_content;
	    				str += "<br>";
	    				str += "<br>";
	    				str += resp.inqrys[i].responseFormedDate;
    				}
    				str += "</div>";
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
					str += "<td>"+ resp.reviews[i].member_username +"</td>";
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
		    	  if(confirm("장바구니에 선택하신 상품을 추가하였습니다. 장바구니로 이동하시겠습니까?")){ 
		    		 document.location.href="/cart/cart";
		    		} 
		     })
		   })
		})
</script>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body>




    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="/mdImage/${mdDetails.md_image}" alt="Card image cap" id="product-detail">
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                        	<input id="md_id" type="hidden" value="${mdDetails.md_id }">
                        	<input id="member_username" type=hidden value=${principal.username }>
                            <h1 class="h2">${mdDetails.md_name }</h1>
                            <p class="h3 py-2">${mdDetails.md_price }</p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>지역:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${mdDetails.md_region }</strong></p>
                                </li>
                                <li class="list-inline-item">
                                    <h6>분류:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${mdDetails.md_category }</strong></p>
                                </li>
                                <li class="list-inline-item">
                                    <h6>도수:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${mdDetails.md_abv }%</strong></p>
                                </li>
                            </ul>
                            <p>${mdDetails.md_content }</p>
                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="cart_item_count">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                	<div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">찜하기</button>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy</button>
                                    </div>
                                    <div class="col d-grid">
                                        <button type="button" id="cart" class=" btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
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
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4>Related Products</h4>
            </div>

            <!--Start Carousel Wrapper -->
            <div id="carousel-related-product">
				<c:forEach var="relatedMd" items="${relatedMds }">
                <div class="p-2 pb-3 relatedMd-box">
                	<input type=hidden class="relatedMd_id" value="${relatedMd.md_id }">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid" src="/resources/mdDetail/assets/img/shop_08.jpg">
                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <a href="shop-single.html" class="h3 text-decoration-none">${ relatedMd.md_name}</a>
                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                <li>M/L/X/XL</li>
                                <li class="pt-2">
                                    <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                </li>
                            </ul>
                            <ul class="list-unstyled d-flex justify-content-center mb-1">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                            </ul>
                            <p class="text-center mb-0">$20.00</p>
                        </div>
                    </div>
                </div>
				</c:forEach>
            </div>
        </div>
    </section>
    <!-- End Article -->
    
    <div class="container">
	    <div id="tabs">
		  <ul>
		    <li><a href="#fragment-1"><span>상품설명</span></a></li>
		    <li><a href="#fragment-3"><span>후기(${allMdReviewCount})</span></a></li>
		    <li><a href="#fragment-4"><span>문의</span></a></li>
		  </ul>
		  <div id="fragment-1">
		    <p>상품 설명이 들어갑니다.</p>
		    <br><br><br><br><br><br><br><br><br><br>
		    <p>상품 등록할 때 구현해야함 </p>
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
				<button>후기쓰기</button>
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
				<button>문의하기</button>
				<div id="page-box">
				<ul class="pages" ></ul>
				</div>
		  </div>
		
	</div>
	</div>
	<script>
		$('#tabs').tabs({
            activate: function(event ,ui){
                let selectTab = ui.newTab.index();
                console.log(selectTab);
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
	            				str += "<td>"+ resp.reviews[i].member_username +"</td>";
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
       		            				str += "<td>"+ resp.reviews[i].member_username +"</td>";
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
            			console.log(resp);
            			let inqrysSize = resp.inqrys.length;
            			let naviSize = resp.pageNavis.length;
        				let str = "";
            			if(inqrysSize > 0) {
            				for(let i = 0; i < inqrysSize; i++) {
            					
	            				str += "<tr class='inqry-title'>";
	            				str += "<td style='width:5%;'>"+resp.inqrys[i].sort_md_question_id+"</td>";
	            				str += "<td style='width:60%'>"+resp.inqrys[i].md_question_title+"</td>";
	            				str += "<td>"+ resp.inqrys[i].md_question_username +"</td>";
	            				str += "<td>"+ resp.inqrys[i].questionFormedDate +"</td>";
	            				str += "<td>"+ resp.inqrys[i].md_question_reply_yn +"</td>";
	            				str += "</td>";
	            				str += "</tr>";
	            				str += "<tr class='inqry-content hide-toggle'>";
	            				str += "<td colspan='5'>";
	            				str += "<div>"
	            				str += resp.inqrys[i].md_question_content;
            					if(resp.inqrys[i].md_response_content != null) {
            						str += "<br>";
            	    				str += "<br>";
            	    				str += resp.inqrys[i].md_response_content;
            	    				str += "<br>";
            	    				str += "<br>"
            	    				str += resp.inqrys[i].responseFormedDate;
                				}
	            				str += "</div>";
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
	
	
	<!-- 임시 공백 푸터 -->
	<div style="height:300px;"></div>
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