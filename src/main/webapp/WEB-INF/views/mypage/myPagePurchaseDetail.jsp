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

<style type="text/css">
body {
	margin-top: 20px;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0px solid rgba(0, 0, 0, 0);
	border-radius: .25rem;
	margin-bottom: 1.5rem;
	box-shadow: 0 2px 6px 0 rgb(218 218 253/ 65%), 0 2px 6px 0
		rgb(206 206 238/ 54%);
}

.fm-file-box {
	font-size: 25px;
	background: #e9ecef;
	width: 44px;
	height: 44px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: .25rem;
}

.ms-2 {
	margin-left: .5rem !important;
}

.fm-menu .list-group a {
	font-size: 16px;
	color: #5f5f5f;
	display: flex;
	align-items: center;
}

.list-group-flush>.list-group-item {
	border-width: 0 0 1px;
}

.list-group-item+.list-group-item {
	border-top-width: 0;
}

.py-1 {
	padding-top: .25rem !important;
	padding-bottom: .25rem !important;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .5rem 1rem;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .125);
}

.radius-15 {
	border-radius: 15px;
}

.fm-icon-box {
	font-size: 32px;
	background: #ffffff;
	width: 52px;
	height: 52px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: .25rem;
}

.font-24 {
	font-size: 24px;
}

.ms-auto {
	margin-left: auto !important;
}

.font-30 {
	font-size: 30px;
}

.user-groups img {
	margin-left: -14px;
	border: 1px solid #e4e4e4;
	padding: 2px;
	cursor: pointer;
}

.rounded-circle {
	border-radius: 50% !important;
}

#header {
	margin-bottom: 100px;
}

#profile-box {
	display: flex;
	justify-content: center;
}

.img-profile {
	border-radius: 70%;
	width: 100%;
	height: 100%;
}

.profile-detail {
	text-align: center;
}

.name {
	font-weight: bold;
}

.list li {
	margin-top: 5px;
}

.label {
	font-size: 12px;
}
.grade{
	display:flex;
	justify-content: center;
	font-weight: bold;
}
.detail{
	display:flex;
	flex-direction:column;
	flex:1 1;
	justify-content: flex-end;
    height:120px;
}

.detail-title{
	line-height:90px;
}

.detail-title a{
	text-decoration:none;
	color:black;
}

.icon-box{
	flex:1 1;
	height:100px;
}
.icon-icon{
	flex:1 1;
}

.detail-title-one{
	display:flex;
	flex-direction:column;
	flex:1 1;
	justify-content: center;
}

.form-select{
	float:right;
}

#profile-box{
	flex-wrap: wrap;
}
ul{
	list-style:none;

}

.purchase-list{
	border: 1px solid black;

}

.navigator > button.btn btn-outline-primary{
	float:center;
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
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
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
  
  
/* 상품 박스 CSS */
  

.status-box {
	display:flex;
	flex: 1 1;
	align-items: center;
	text-align: center;
}

.status-box>span {
	flex: 1 1;
}

.btn-box {
	display:flex;
	flex: 1 1;
	align-items: center;
	text-align: center;
}

.btn-box>button {
	flex: 1 1;
}
  
.detail-box span{margin-right:5px;}
.detail-box span::after{padding-left:5px;content:"|"}
.detail-box span:last-child::after{content:""}

</style>
</head>

<body>


	<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
					<jsp:include page="myPageNavBar.jsp" flush="false" />  
       
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="myPageSideBar.jsp" flush="false" />
				</div>
			</div>

			<div class="col-12 col-md-8 col-lg-9">
				<div class="card">
					<div class="card-body">						
							<div class="drive-wrapper drive-list-view">								
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>상세 주문 내역 
											</tr>
										</thead>										
										<tbody>														
										</tbody>
									</table>
									<c:forEach var="purchaseList" items="${purchaseList}">
									<div class="md-box">
                                       <div class="img-box">
                                          <div class="img-box2">
                                             <a href="/md/detail/page?md_id=${purchaseList.md_id}"><img src="/mdImage/${purchaseList.md_image}"></a>
                                          </div>
                                       </div>
                                       <div class="detail-box">
                                          <div class="wish-purchase-text"><a href="/md/detail/page?md_id=${purchaseList.md_id}">${purchaseList.md_name }</a></div>
                                          <%-- <div class="wish-purchase-text"><a href="/md/detail/page?md_id=${purchaseList.md_id}">${purchaseList.md_content }</a></div>--%>
                                          <div>
                                             <span>${purchaseList.purchase_detail_price}원</span><span>${purchaseList.purchase_detail_quantity}개</span>
                                          </div>
                                       </div>
                                       <div class="status-box">
                                          <span class=status>
                                          <c:choose>
                                          	<c:when test="${purchaseList.purchase_detail_cancel_order == 'Y'}">
                                          		주문취소완료
                                          	</c:when>
                                          	<c:when test="${purchaseList.purchase_detail_result == 'Y'}">
                                          		배송완료
                                          	</c:when>
                                          	<c:otherwise>                                    
                                          		배송중
                                          	</c:otherwise>
                                          </c:choose>
                                         
                                          </span>
                                       </div>
                                    </div>			
									</c:forEach>
									<div class="navigator" align="center">
									${pageNavi}
									</div>																									
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