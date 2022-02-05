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
	width:60% !important;
	max-height: 80%;
    overflow-y: scroll;
    overflow-x: hidden;
}

.popup img {
	height:auto;
	max-width:100%;
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
                    <h1 class="h3 mb-2 text-gray-800">상품 후기 관리</h1>
                    <p class="mb-4">상품 후기 관리 메뉴입니다. 여기에서 상품 후기를 조회, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 후기 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form action="/admin/updateGrade" method="post" id="upgrade${grades.grade_name}">
	                                <table class="table table-bordered" id="dataTable" style="width:100%" >
	                                    <thead>
	                                    	<tr style="text-align:center">
	                                            <th>번호</th>
	                                            <th>상품번호</th>
	                                            <th>제목</th>
	                                            <th>작성자</th>
	                                            <th>작성일</th>
	                                            <th>도움</th>
	                                            <th>조회수</th>
	                                            <th>관리</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
										<c:forEach var="mdReview" items="${mdReviews}">
	                                        <tr style="text-align:center">
	                                        <td class="md_review_id">${mdReview.md_review_id }
	                                        <td>${mdReview.md_id }
	                                        <td><a class="review-title" href="#popup${mdReview.md_review_id }">${mdReview.md_review_title }</a>
	                                        <div id="popup${mdReview.md_review_id }" class="overlay">
							                    <div class="popup">
							                        <h2>${mdReview.md_review_title }</h2>
							                        <a class="close" href="javascript:history.back()">&times;</a>
							                        <div class="content" style="text-align:center;">
							                            <br>
							                            ${mdReview.md_review_content }
							                        </div>
							                    </div>
										    </div>
	                                        <td>${mdReview.member_username }
	                                        <td>${mdReview.formedDate }
	                                        <td>${mdReview.md_review_like}
	                                        <td>${mdReview.md_review_view_count }
	                                        <td><a class="btn btn-danger btn-icon-split delete">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
	                                        </tr>
	                                    </c:forEach>
	                                    </tbody>
	                                </table>
                                </form>
                                <script>
                                	$("body").on("click",".review-title",function(){
                                		let md_review_id = $(this).parent("td").prev().prev().text();
                                		let content = $(this).parent("td").find(".content");
                                		if(content.find("img").length==0) {
                        					$.ajax({
                            					url:"/md/detail/review/rest/board/image/"+md_review_id,
                            					type:"get",
                            					dataType:"json"
                            				}).done(function(resp){
                            					let imgStr = "";
                            					for(let i=0; i<resp.images.length; i++) {
                            						imgStr += "<div>";
                	            					imgStr += "<img src='/mdReviewImage" + resp.images[i].md_review_image + "'>"
                	            					imgStr += "</div>";
                            					}
                            					content.append(imgStr);
                            				})
                        				}
                                		
                                	})
									$("body").on("click",".delete",function(){
										let member_id = $(this).closest("tr").find(".md_review_id").text();
										let target = $(this).closest("tr");
										$.ajax({
											type:"delete",
											url:"/seller/rest/"+member_id,
											dataType:"json"
										}).done(function(){
											if(confirm("정말 삭제하시겠습니까?")){
												target.remove();	
											}
										})
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