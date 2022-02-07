<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />
<link rel="stylesheet" href="/resources/mypage/css/mypage.css">	
<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
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
  height:80%;
  overflow-y:auto;
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
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
</style>
</head>
<body>
	<div class="container">	
        <div class="row">
            <div class="col-12">
                <div class="card">
					<div class="card-body">
						<div class="row mt-3">
							<div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
                                                <h6 class="detail-title-one">${memberDTO.member_username }회원님</h6>
												<button type="button" class="btn btn-light" id="all-grade">나의등급 보기</button>
												<input type="hidden" name="member_id" value="${memberDTO.member_id }">
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">

											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPagePoint?cPage=1">적립금 ></a></h6>
												<p class="detail-detail"><span><fmt:formatNumber value="${pointSum}" type="number"/> 원</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">											
											<div class="detail">
												<h6 class="detail-title"><a href="/mypage/myPageCoupon?cPage=1">쿠폰 ></a></h6>
												<p class="detail-detail"><span>${couponSum } 개</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
												<h6 class="detail-title"><a href="/qna/qnaList">1:1문의 ></a></h6>
												<p class="detail-detail"><span>도움이 필요하신가요?</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
            			</div>            
            		</div>     


	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<div class="card-body">
						<div class="d-grid"></div>
						<h5 class="my-3">My Page</h5>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="/mypage/myPageList?cPage=1" class="list-group-item py-1"><span>주문 내역</span></a> 													
								<a href="/mypage/myPageLike?cPage=1" class="list-group-item py-1"><span>찜한 상품</span></a>
								<a href="/mypage/myPagePoint?cPage=1" class="list-group-item py-1"><span>적립금</span></a>
                                <a href="/mypage/myPageCoupon?cPage=1" class="list-group-item py-1"><span>쿠폰</span></a>
                                <a href="/mypage/myPageQuestion?cPage=1" class="list-group-item py-1"><span>상품 문의</span></a>
                                <a href="/mypage/myPageMdReview?cPage=1" class="list-group-item py-1"><span>상품 후기</span></a>
                                <a href="/mypage/myPageModifyProfile" class="list-group-item py-1"><span>개인정보 수정</span></a>
                                <br>
                                <br>
								<a href="/qna/qnaList" class="list-group-item py-1"><span>도움이 필요하신가요?<br>1:1 문의하기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-8 col-lg-9">
				<div class="card">
					<div class="card-body">						
							<div class="drive-wrapper drive-list-view">								
								<div>상품 후기</div>
								<div>
									후기 작성 시 50원을 적립해드립니다.<br>
									달, 해 등급은 2배 적립(100원)<br>
									후기 작성은 배송 완료일로부터 30일 이내 가능합니다.
								</div>

								    <div class="container">
									    <div id="tabs">
										  <ul>
										    <li><a href="#fragment-3"><span>작성가능 후기(${notReviewMdCount})</span></a></li>
										    <li><a href="#fragment-4"><span>작성완료 후기(${reviewMdCount})</span></a></li>
										  </ul>
										  <div id="fragment-3">

										</div>

										<div id="fragment-4">
											<c:if test="${reviewMdCount eq '0'}"><div style="text-align:center">작성완료 후기가 없습니다.</div></c:if>
											<c:forEach var="md" items="${mds}">
												<div class="md-box">
													<div class="img-box">
														<div class="img-box2">
															<input type=hidden class="md_review_id" value="${md.md_review_id }">
															<a href="/md/detail/page?md_id=${md.md_id}"><img src="/mdImage/${md.md_image }"></a>
														</div>
													</div>
													<div class="detail-box">
														<div><a href="/md/detail/page?md_id=${md.md_id}">${md.md_name }</a></div>
														<%-- <div><a href="/md/detail/page?md_id=${md.md_id}">${md.md_content }</a></div>--%>
														<div>
															<span>${md.purchase_detail_price}원</span><span>${md.purchase_detail_quantity}개</span>
														</div>
													</div>
													<div class="status-box">
														<span class=status>배송완료</span>
													</div>
													<div class="btn-box" style="flex-direction: column; justify-content: center;">
														<a href="#popup${md.md_review_id }"><button class="read-review" type=button style="font-size: 15px">후기보기</button></a>
														<input type=button class="delete-btn" style="font-size: 15px;" value="후기삭제">
													</div>
													<div id="popup${md.md_review_id }" class="overlay">
									                    <div class="popup">
									                        <h2></h2>
									                        <a class="close" href="javascript:history.back()">&times;</a>
									                        <div class="content" style="text-align:center;">
									                            <br>
									                            
									                            
									                        </div>
									                    </div>
												    </div>
												</div>
											</c:forEach>
											<script>
												$("body").on("click",".delete-btn",function(){
													if(confirm("정말 삭제하시겠습니까?")) {
														let mdBox = $(this).closest(".md-box");
														let md_review_id = $(this).closest(".md-box").find(".md_review_id").val();
														mdBox.remove();
														$.ajax({
							            					url:"/md/detail/review/rest/delete/"+md_review_id,
							            					type:"delete",
							            					dataType:"json"
							            				}).done(function(){
							            					mdBox.remove();
														})
													}
												})
												$("body").on("click",".read-review",function(){
													let md_review_id = $(this).closest(".md-box").find(".md_review_id").val();
													let popupBox = $(this).closest(".md-box").find(".popup");
													$.ajax({
														url:"/md/detail/review/rest/read/"+md_review_id,
														type:"get",
														dataType:"json"
													}).done(function(resp){
														popupBox.find("h2").text(resp.review[0].md_review_title);
														str = "";
														str += "<div>"
														str += "작성일 : " + resp.review[0].formedDate + " | ";
														str += "도움 : " + resp.review[0].md_review_like + " | ";
														str += "조회수 : " + resp.review[0].md_review_view_count;
														str += "</div>"
														popupBox.find(".content").html(str);
														popupBox.find(".content").append("<br/>");
														str = "";
														str += "<div>";
														str += resp.review[0].md_review_content;
														str += "</div>";
														popupBox.find(".content").append(str);
														let imgs = $("<div>");
														for(let i = 0; i < resp.images.length; i++) {
															str = "";
															str += "<div>";
															str += "<img src='/mdReviewImage" + resp.images[i].md_review_image + "'>";
															str += "</div>";
															imgs.append(str);
														}
														popupBox.find(".content").append(imgs);
													})
												})
											</script>
											<div id="page-box" align="center">${pageNavi }</div>
										</div>
										</div>
									</div>

									<script>
										$('#tabs').tabs({
											active:1,
								            activate: function(event ,ui){
								                let selectTab = ui.newTab.index();
								                if (selectTab == 0) {
								                	location.href ="/mypage/myPageMdReview?cPage=1";
								                } else if (selectTab == 1) {
								                	location.href ="/mypage/myPageAfterMdReview?cPage=1";
								                }
									        }
										});
								
										
									</script>






						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
<script>
	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	})
	
	$("#md-review").on("click",function(){
		
		location="/mypage/writeReview"
	})
	
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>