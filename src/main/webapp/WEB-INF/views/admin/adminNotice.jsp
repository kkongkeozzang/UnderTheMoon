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

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
		<!-- Sidebar -->
        <jsp:include page="adminSideBar.jsp"></jsp:include>
		<!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            <!-- Topbar -->
			<jsp:include page="adminTopBar.jsp"></jsp:include>
			<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">공지사항 관리</h1>
                    <p class="mb-4">공지사항 게시판 관리 메뉴입니다. 게시판 글을 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항 게시판 관리</h6>
                        </div>
                        <div class="card-body">
                        	<table>
                         		<tr>
                         			<td>
                         				<a id="insert" class="btn btn-success btn-icon-split">
			                                <span class="icon text-white-50">
			                                    <i class="fas fa-check"></i>
			                                </span>
			                                <span class="text">입력</span>
			                            </a>
                         			</td>
                       			</tr>
	                        </table>
	                        <hr>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    	<tr style="text-align:center">
                                    		<th>ID</th>
                                            <th width=30%>글제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="notices" items="${notices}">
                                        <tr style="text-align:center">
                                            <td>${notices.notice_id}<input type=hidden value="${notices.notice_id}" class=notice_id name=notice_id>
                                            <td><a href="/notice/detail?notice_id=${notices.notice_id}&member_id=${notices.member_id}&cPage=1" >${notices.notice_title}
                                            <td>${notices.member_username}
                                            <td>${notices.notice_write_date}
                                            <td>${notices.notice_view_count}
                                            <td>
                                           	<a id="del" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <script>
                            		
                            		$("#insert").on("click",function(){ //입력 버튼 클릭 시
                            			location.href="/notice/toWrite";
                            		})
                            		
                            		$("table").on('click',"#del",function(){ // 삭제버튼 클릭시
                            			let notice_id = $(this).parent().siblings("td").children(".notice_id").val();
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				location.href="/admin/deleteNotice?notice_id="+notice_id;
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