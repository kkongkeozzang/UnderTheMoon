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
												<th class="name truncate" colspan=4>적립금                                                
											</tr>
											<tr>
												<th class="grade-list" style="text-align:center">적립/사용 내역</th>
												<th class="grade-list" style="text-align:center">금액</th>
												<th class="grade-list" style="text-align:center">날짜</th>                                           
											</tr>
										</thead>										
										<tbody>
											<c:forEach var="pointDTO" items="${pointList }">
											<c:choose>
												<c:when test="${pointDTO.point_event == '이벤트 미입력' }">
												</c:when>
												<c:otherwise>
													<tr>												
														<td class="grade-list" style="text-align:center">${pointDTO.point_event}</td>
														<td class="grade-list" style="text-align:center"><fmt:formatNumber value="${pointDTO.point_used_saved}" type="number"/></td>
														<td class="grade-list" style="text-align:center"><fmt:formatDate value = "${pointDTO.point_date}"  type="date" dateStyle="full"/></td>													
													</tr>
												</c:otherwise>
											</c:choose>
											</c:forEach>			
										</tbody>
									</table>
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
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>