<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
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
								<form action="/mypage/myPageCheckPassword" method="post">	
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>개인정보 수정                                                
											</tr>
											<tr>
												<th class="grade-list" style="text-align:center" colspan=2>비밀번호 재확인</th>  									                          
											</tr>
										</thead>
																			
										<tbody>
											<tr>
												<td class="grade-list" style="text-align:center">아이디</td>
												<td class="grade-list" style="text-align:center">
													<input type="text" name="member_username" value="${memberDTO.member_username }" style="text-align:center;" readonly>
												</td>
											</tr>
											<tr>
												<td class="grade-list" style="text-align:center">비밀번호</td>
												<td class="grade-list" style="text-align:center"><input type="password" name="member_password"></td>
											</tr>	
										</tbody>
									</table>
									<div>
										<button type="submit" class="btn btn-light" style="margin:auto; display:block;">확인</button>
									</div>
									</form>							
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