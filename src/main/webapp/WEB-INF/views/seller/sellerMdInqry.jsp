<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/seller/css/sellerMdReview.css">
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<style>
.popup {
	z-index:100; !important;
}

</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
		<!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
			<!-- Topbar -->
			<jsp:include page="sellerTopBar.jsp"></jsp:include>
			<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품 문의 관리</h1>
                    <p class="mb-4">상품 문의 관리 메뉴입니다. 여기에서 상품 문의를 조회, 삭제할 수 있고 판매다 답변을 작성할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 문의 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                
	                                <table class="table table-bordered" id="dataTable" style="width:100%" >
	                                    <thead>
	                                    	<tr style="text-align:center">
	                                            <th>ID</th>
	                                            <th>상품번호</th>
	                                            <th>상품명</th>
	                                            <th>문의제목</th>
	                                            <th>작성자</th>
	                                            <th>작성일</th>
	                                            <th>답변여부</th>
	                                            <th>답변내용</th>
	                                            <th>답변일</th>
	                                           	<th>답변인</th>
	                                            <th>관리</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
										<c:forEach var="mdInqrys" items="${mdInqrys}">
	                                        <tr style="text-align:center">
	                                        <td class="md_question_id">${mdInqrys.sort_md_question_id }
	                                        <td>${mdInqrys.md_id }
	                                        <td>${mdInqrys.md_name }
	                                        <td><a href="#popup${mdInqrys.sort_md_question_id }">${mdInqrys.md_question_title }</a>
	                                     	<td>${mdInqrys.md_question_username }
	                                        <td>${mdInqrys.getQuestionFormedDate()}
	                                        <td>${mdInqrys.md_question_reply_yn }
	                                        <td>
	                                        <c:choose>
	                                        <c:when test="${mdInqrys.md_question_reply_yn == '답변완료'}">
	                                        	<a href="#popupResp${mdInqrys.sort_md_question_id }">답변내용</a>
	                                        </c:when>
	                                        <c:otherwise>
	                                        	<a class="btn btn-success btn-icon-split response" href="#popupWrite${mdInqrys.sort_md_question_id }">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-check"></i>
			                                        </span>
			                                        <span class="text">입력</span>
			                                    </a>
	                                        </c:otherwise>
	                                        </c:choose>
	                                        </td>
	                                        <td>${mdInqrys.getResponseFormedDate()}
	                                        <td>${mdInqrys.md_response_username }
	                                        <td>
	                                        <c:choose>
	                                        <c:when test="${mdInqrys.md_question_reply_yn == '답변완료'}">
			                                    <br>
			                                    <a class="btn btn-danger btn-icon-split deleteResp">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-trash"></i>
			                                        </span>
			                                        <span class="text">답변삭제</span>
			                                    </a>
			                                    <br>
			                                 	<a class="btn btn-danger btn-icon-split deleteBoth">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-trash"></i>
			                                        </span>
			                                        <span class="text">전체삭제</span>
			                                    </a>
		                                    </c:when>
		                                    <c:otherwise>
			                                    <a class="btn btn-danger btn-icon-split deleteInqry">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-trash"></i>
			                                        </span>
			                                        <span class="text">문의삭제</span>
			                                    </a>
		                                    </c:otherwise>
		                                    </c:choose>
	                                        </tr>
	                                        <div id="popup${mdInqrys.sort_md_question_id }" class="overlay">  <!-- 고객의 상품문의글 조회 -->
							                    <div class="popup" style="max-height:500px;overflow:auto;">
							                        <h2>${mdInqrys.md_question_title }</h2>
							                        <a class="close" href="javascript:history.back()">&times;</a>
							                        <div class="content" style="text-align:left;">
							                            <br>
							                            ${mdInqrys.md_question_content }
							                        </div>
							                    </div>
										    </div>
										    <div id="popupResp${mdInqrys.sort_md_question_id }" class="overlay">   <!-- 고객의 상품문의 및 답변글, 수정기능 -->
											<form action="/seller/updateResp" id="updateFrm">
							                    <div class="popup" style="max-height:500px;overflow:auto;">
							                        <h2>${mdInqrys.md_question_title }</h2>
							                        <a class="close" href="javascript:history.back()">&times;</a>
							                        <div class="content" style="text-align:left;">${mdInqrys.md_response_content }</div>
							                        <input type=hidden name="sort_md_question_id" value="${mdInqrys.sort_md_question_id }">
							                        <div class="updateResp" style="display:none;">
							                        	<textarea style="width:100%;" rows=10 class="md_response_content" name="md_response_content" maxLength=900>${mdInqrys.md_response_content }</textarea>
							                        </div>
							                        <div align=right>
									                    <a class="btn btn-warning btn-icon-split respMod">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-exclamation-triangle"></i>
					                                        </span>
					                                        <span class="text">답변수정</span>
					                                    </a>
					                                    <a class="btn btn-warning btn-icon-split respUpdate" id="respUp" style="display:none;">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-exclamation-triangle"></i>
					                                        </span>
					                                        <span class="text">수정</span>
<!-- 					                                        <button type=button class="btn btn-warning respUp">수정</button> -->
					                                    </a>
					                                    <a class="btn btn-danger btn-icon-split respUpdateCancel" style="display:none;">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-trash"></i>
					                                        </span>
					                                        <span class="text">취소</span>
					                                    </a>
				                                    </div>
							                    </div>
							                </form>
										    </div>
										    <div id="popupWrite${mdInqrys.sort_md_question_id }" class="overlay">  <!--판매자 문의 답변 글 작성 팝업 -->
							                    <form action="/seller/insertResp" method="post" id="frmResp">
							                    <div class="popup">
        							                <h2>Q: ${mdInqrys.md_question_title }</h2>
							                        <input type=hidden name="sort_md_question_id" value="${mdInqrys.sort_md_question_id }" class="id">
							                        <input type=hidden name="md_response_username" value=${principal.username }>
							                        <textarea style="width:100%;" rows=10 class="newResp" name="md_response_content" maxLength=900 required></textarea>
							                        <br>
							                        <div align=right>
														<a class="btn btn-info btn-icon-split" id="insert">
															<span class="icon text-white-50">
					                                    		<i class="fas fa-exclamation-triangle"></i>
					                                    	</span>
					                                    	<span class="text">입력</span>
<!-- 															<button type="button" class="btn btn-primary submit">입력</button> -->
														</a>
					                                    <a class="btn btn-danger btn-icon-split reset">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-trash"></i>
					                                        </span>
					                                        <span class="text">취소</span>
					                                    </a>
							                        </div>
							                    </div>
							                    </form>
										    </div>
	                                    </c:forEach>
	                                    </tbody>
	                                </table>
                                
                                <script>
									$("table").on('click',".deleteInqry",function(){ // 문의삭제버튼 클릭시
										let md_question_id = $(this).closest("tr").find(".md_question_id").text();
                            			if(confirm("문의를 정말 삭제하시겠습니까?")){
                            				location.href="/seller/deleteMdInqry?md_question_id="+md_question_id;
                            			}
                            		})
                            		
                 					$("table").on('click',".deleteResp",function(){ // 답변삭제버튼 클릭시
										let md_question_id = $(this).closest("tr").find(".md_question_id").text();
                            			if(confirm("답변을 정말 삭제하시겠습니까?")){
                            				location.href="/seller/deleteMdResp?md_question_id="+md_question_id;
                            			}
                            		})
                            		
                            		$("table").on('click',".deleteBoth",function(){ // 전체삭제버튼 클릭시
										let md_question_id = $(this).closest("tr").find(".md_question_id").text();
                            			if(confirm("문의와 답변을 정말 삭제하시겠습니까?")){
                            				location.href="/seller/deleteMdBoth?md_question_id="+md_question_id;
                            			}
                            		})
                            		
                            		$(".overlay").on('click',"#insert",function(){ // 답변입력 팝업창 안 입력버튼 클릭시
                            			if(confirm("답변을 정말 입력하시겠습니까?")){
                           					if($(this).parent().parent(".popup").children(".newResp").val().replace(/\s| /gi,"").length == 0) {
                           						alert("내용을 입력해주세요");
                           						$(this).parent().parent(".popup").children(".newResp").focus();
                                   				return false;
                                   			}else{
                                   				$(this).parent().parent().parent().find("#frmResp").submit();
                                   			}
                                  		}
                            		})
                            		$(".overlay").on('click',".reset",function(){ // 답변입력 팝업창 안 취소버튼 클릭시
                            			if(confirm("입력을 정말 취소하시겠습니까?")){
                            				$(this).parent().parent(".popup").children(".newResp").val("");
                             				location.href="javascript:history.back()";
                            			}
                            		})
                            		
                            		$(".overlay").on('click',".respMod",function(){ // 답변내용 팝업창 안 답변수정버튼 클릭시
 										bkResp = $(this).parent().parent().children(".content").html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
                            		
 										$(".md_response_content").val(bkResp);
                            			$(".content").css("display","none");
                            			$(".updateResp").css("display","inline");
                            			$(this).css("display","none");
                            			$(".respUpdate").css("display","inline-block");
                            			$(".respUpdateCancel").css("display","inline-block");
                            			$(".close").css("display","none");
                            		})
                            		
                            		$(".overlay").on('click',".respUpdateCancel",function(){ // 답변내용 팝업창 안 취소버튼 클릭시
                            			
                            			if(confirm("수정을 정말 취소하시겠습니까?")){
                            				$(".content").css("display","inline");
                            				$(".md_response_content").val(bkResp);
                                			$(".updateResp").css("display","none");
                                			$(this).css("display","none");
                                			$(".respUpdate").css("display","none");
                                			$(".respMod").css("display","inline-block");
                                			$(".close").css("display","inline-block");
                            			}
                            		})    
                            		
                            		$(".overlay").on('click',"#respUp",function(){ // 답변내용 팝업창 안 수정버튼 클릭시
                            			if(confirm("답변을 정말 수정하시겠습니까?")){
                           					if($(this).parent().parent(".popup").children(".updateResp").children(".md_response_content").val().replace(/\s| /gi,"").length == 0) {
                           						alert("내용을 입력해주세요");
                           						$(this).parent().parent(".popup").children(".updateResp").children(".md_response_content").focus();
                                   				return false;
                                   			}else{
                                   				$(this).parent().parent().parent().find("#updateFrm").submit();
                                   			}
                                  		}
                            		})                        	
                            	</script>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
           	<footer class="sticky-footer bg-white">
			    <div class="container my-auto">
			        <div class="copyright text-center my-auto">
			            <span>Copyright &copy; 月下合酌 2022</span>
			        </div>
			    </div>
			</footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
        
</body>
</html>