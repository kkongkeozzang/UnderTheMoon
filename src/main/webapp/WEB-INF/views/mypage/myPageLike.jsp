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
												<th class="name truncate" colspan=4>찜한 상품 
                                                    </th>
											</tr>
										</thead>										
										<tbody>														
										</tbody>
									</table>
									
									<c:forEach var="wishDTO" items="${wishList}">
									<div class="md-box">
                                   <div class="img-box"><div class="img-box2"><img src="/mdImage/${wishDTO.md_image }"></div></div>
                                   <div class="detail-box">
                                      <div>상품이름 : ${wishDTO.wish_item }</div>
                                      <div>가격 : <fmt:formatNumber value="${wishDTO.wish_price }" type="number"/> 원</div>
                                      <div>
                                         <span>찜한 날짜 :  <fmt:formatDate value = "${wishDTO.wish_date }"  type="date" dateStyle="full"/></span>
                                      </div>
                                   </div>
                                   <div class="btn-box">
                                      <button>담기</button>
                                   </div>
                                   <div class="btn-box">
                                      <button>삭제</button>
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
</script>
</body>
</html>