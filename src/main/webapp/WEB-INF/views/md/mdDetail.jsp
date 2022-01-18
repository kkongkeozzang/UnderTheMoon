<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.hiddenRow {
    padding: 0 !important;
}
table tr th {
	text-align:center;
}
</style>
<script>
	document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	document.cookie = "safeCookie2=foo"; 
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
</script>
</head>
<body>




    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="/resources/mdDetail/assets/img/product_single_10.jpg" alt="Card image cap" id="product-detail">
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                        	<input type="hidden" value="${mdDetails.md_id }">
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
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
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
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
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

            <!--Start Carousel Wrapper-->
            <div id="carousel-related-product">
				<c:forEach var="relatedMd" items="${relatedMds }">
                <div class="p-2 pb-3">
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
		    <li><a href="#fragment-2"><span>상세정보</span></a></li>
		    <li><a href="#fragment-3"><span>후기()</span></a></li>
		    <li><a href="#fragment-4"><span>문의</span></a></li>
		  </ul>
		  <div id="fragment-1">
		    <p>상품 설명이 들어갑니다.</p>
		    <br><br><br><br><br><br><br><br><br><br>
		    <p>상품 등록할 때 구현해야함 </p>
		  </div>
		  <div id="fragment-2">
		  </div>
			<div id="fragment-3">
				<p>PRODUCT REVIEW</p>
				<p>상품에 대해 문의를 남기는 공간입니다. 해당 게시판 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
				<p>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</p>
				<table class="table table-condensed table-striped">
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
	
					<tbody>
						<!-- 게시판 제목 부분 -->
						<tr data-toggle="collapse" data-target="#demo1"
							class="accordion-toggle">
							<td></td>
							<td>Carlos</td>
							<td>Mathias</td>
							<td>Leme</td>
							<td>SP</td>
							<td>new</td>
						</tr>
						<!-- 게시판 내용 부분 -->
						<tr>
							<td colspan="6" class="hiddenRow">
							<div id="demo1" class="accordian-body collapse">
							<br>
							<br>
							<br>
							<br>
							<br>
							</div>
						</tr>
	
					</tbody>
				</table>




			</div>
			<div id="fragment-4">
		  </div>
		</div>
	</div>
	<script>
		$("#tabs").tabs();
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