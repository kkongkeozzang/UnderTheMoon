<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
								<div class="table-responsive drive-items-table-wrapper">
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>쿠폰                                             
											</tr>
											<tr>
												<th class="grade-list" style="text-align:center">쿠폰 이름</th>
												<th class="grade-list" style="text-align:center">쿠폰 금액</th>
												<th class="grade-list" style="text-align:center">사용가능 기간</th> 
												<th class="grade-list" style="text-align:center">사용여부</th>                                          
											</tr>
										</thead>										
										<tbody>
											<c:forEach var="couponDTO" items="${couponList }">
											<tr>												
												<td class="grade-list" style="text-align:center">${couponDTO.coupon_name}</td>
												<td class="grade-list" style="text-align:center"><fmt:formatNumber value="${couponDTO.coupon_discount_rate}" type="number"/></td>
												<c:choose>
													<c:when test="${couponDTO.coupon_valid_date == '9999-12-31 00:00:00.0' }">											
														<td class="grade-list" style="text-align:center">무제한</td>
													</c:when>
													<c:otherwise>
														<td class="grade-list" style="text-align:center"><fmt:formatDate value = "${couponDTO.coupon_valid_date }"  type="date" dateStyle="full"/></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${fn:contains(couponDTO.coupon_used_yn,'N')}">
														<td class="grade-list" style="text-align:center">사용가능</td>
													</c:when>
													<c:when test="${fn:contains(couponDTO.coupon_used_yn,'Y')}">
														<td class="grade-list" style="text-align:center">사용불가능</td>
													</c:when>	
												</c:choose>												
											</tr>
											</c:forEach>														
										</tbody>
									</table>
									<div style="display:inline-block">
									<span style="float:right;">
									이벤트 코드 입력: <input type="text" id="event-code" name="event_code">
									<button type="button" class='btn btn-outline-primary' id="event-button" style="background-color:#406882;color:white;">입력</button>
									</span>	
									</div>
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
	</div>
<script>
	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	})
	
	$("#event-button").on("click",function(){
		$.ajax({
			type:"post",
			url:"/mypage/khCollaborationCheck",
			data:{member_id:$("#member-id").val()}
		}).done(function(resp){
			if(resp == "1"){
				alert("이미 이벤트에 참여하셨습니다.")
			}else{
				if($("#event-code").val() == "ThankyouJoe"){
					$.ajax({
						type:"post",
						url:"/mypage/khCollaboration",
						data:{member_id:$("#member-id").val()}
					}).done(function(resp){
						alert("이벤트 적립금이 지급되었습니다.");
						location="/mypage/myPageCoupon?cPage=1";
					})
				}else{
					alert("진행중인 이벤트 코드가아닙니다. 이벤트 페이지를 확인해주세요.");
				}
			}
		})		
	})
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>