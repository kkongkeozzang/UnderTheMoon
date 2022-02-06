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
<link rel="stylesheet" href="/resources/mypage/css/myPageQuestion.css">	
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
.user-box {
	margin-bottom: 50px;
    margin-top: 20px;
}

.user-inqry-content, .answer-inqry-content, .answer-inqry-date {
	margin-left: 10px;
}

#md-inqry-write {
	float: right;
}

.answer-inqry-date {
	text-align:left;
}
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
								<div class="table-responsive drive-items-table-wrapper">
									<table class="table">
										<thead>
											<tr>
												<th class="name truncate" colspan=4>상품문의                                                
											</tr>
											<tr>
												<th class="grade-list" style="text-align:center">제목</th>
												<th class="grade-list" style="text-align:center">작성일</th>
												<th class="grade-list" style="text-align:center">답변상태</th>                                         
											</tr>
										</thead>										
										<tbody>
											<c:forEach var="MdInqryDTO" items="${mdInqryList }">
											<tr>												
												<td class="grade-list" style="text-align:center" ><a href="#popup${MdInqryDTO.sort_md_question_id}" style="color:inherit;">${MdInqryDTO.md_question_title}</a>
												<input type="hidden" class="md_inqry_id" value="${MdInqryDTO.sort_md_question_id }">
												</td>
												<td class="grade-list" style="text-align:center"><fmt:formatDate value = "${MdInqryDTO.md_question_write_date}"  type="date" dateStyle="full"/></td>
												<td class="grade-list" style="text-align:center">${MdInqryDTO.md_question_reply_yn}<button class="delete-btn" style="margin-left: 10px; background-color:#406882; color:white;">문의삭제</button></td>				
											</tr>
											
											</c:forEach>														
										</tbody>
									</table>
									<div class="navigator" align="center">
									${pageNavi}
									</div>		
									<script>
									$("body").on("click",".delete-btn",function(){
										if(confirm("정말 삭제하시겠습니까?")) {
											let tr = $(this).closest("tr");
											let md_inqry_id = $(this).closest("tr").find(".md_inqry_id").val();
											tr.remove();
											$.ajax({
				            					url:"/md/detail/inqry/rest/delete/"+md_inqry_id,
				            					type:"delete",
				            					dataType:"json"
				            				}).done(function(){
				            					tr.remove();
											})
										}
									})
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
	</div>
	
	<c:forEach var="MdInqryDTO" items="${mdInqryList }">
		<div id="popup${MdInqryDTO.sort_md_question_id }" class="overlay">
	       <div class="popup">
	           <h2>${MdInqryDTO.md_question_title}</h2>
	           <a class="close" href="javascript:history.back()">&times;</a>
	           <div class="content" style="text-align:center;">
		           <div><div class='d-flex user-box'>
		           <img src='/resources/faqList/문.svg' style='width:24px;'><div class='user-inqry-content'>
		           ${MdInqryDTO.md_question_content}   </div></div>
		           <div class='d-flex admin-box'><span><img src='/resources/faqList/답.svg' style='width:24px;'></span><div>
		           <div class='answer-inqry-content'>   
		           ${MdInqryDTO.md_response_content}</div>   
		           <div class='answer-inqry-date'>${MdInqryDTO.responseFormedDate }</div></div></div>
		              
	           </div>
	              <div style="margin-top:50px;"><a href="/md/detail/page?md_id=${MdInqryDTO.md_id }">상품으로 바로가기</a></div>
	       </div>
	    </div>
	    </div>
	</c:forEach>
	
<script>
	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	})
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>