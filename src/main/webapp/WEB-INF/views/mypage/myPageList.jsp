<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>

<body>
	<div class="container">
	<div class="row" id="header">
		</div>
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
												<th class="name truncate" colspan=4>주문 내역 (지난 3개월 간 주문 내역 조회가 가능합니다) 
                                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                    <option value="1" selected>전체기간</option>
                                                    <option value="2">1개월전</option>
                                                    <option value="3">2개월전</option>
													<option value="4">3개월전</option>
                                                  </select></th>
											</tr>
										</thead>										
										<tbody>														
										</tbody>
									</table>
									<c:forEach var="purchaseList" items="#{purchaseList}">
									<div class="row">
										<%-- <div class="col-sm-12" id="purchase-name"><a href="/md/detail/page?md_id=${purchaseList.md_id }">${purchaseList.md_name }</a>											
											<hr> --%>
										<div>
											주문번호: <span>${purchaseList.purchase_id}</span>
										</div>										
										<%-- <div class="col-sm-2" id="purchase-img">${purchaseList.purchase_id} 
										<input type="hidden" id="md-id" name="md_id" value="${purchaseList.md_id}">
										</div> --%>
										<div class="col-sm-7" id="purchase-information">
											<ul>
												<li>주문 날짜 : <fmt:formatDate value = "${purchaseList.purchase_date }"  type="date" dateStyle="full"/></li>
												<br>
												<li>결제 금액 : <fmt:formatNumber value="${purchaseList.purchase_payment }" type="number"/> 원</li>
											</ul>
										</div>
										<div class="col-sm-3" id="purchase-option">
											<a href="/mypage/myPagePurchaseDetail?cPage=1&purchase_id=${purchaseList.purchase_id }"><button type="button" class="btn btn-light">상세보기</button></a><br>
											<button type="button" class="btn btn-light" id="md-delete">주문취소</button><br>
										</div>
									</div>
									<br>									
									</c:forEach>
									<div class="navigator" style="margin:auto; display:block;">
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