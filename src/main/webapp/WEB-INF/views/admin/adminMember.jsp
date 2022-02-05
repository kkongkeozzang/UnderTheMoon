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
                    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
                    <p class="mb-4">회원 관리 메뉴입니다. 여기에서 회원 정보를 조회, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form action="/admin/updateGrade" method="post" id="upgrade${grades.grade_name}">
	                                <table class="table table-bordered" id="dataTable" style="width:140%" >
	                                    <thead>
	                                    	<tr style="text-align:center">
	                                            <th>번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>생년월일</th>
	                                            <th>전화번호</th>
	                                            <th>우편번호</th>
	                                            <th>주소</th>
	                                            <th>상세주소</th>
	                                            <th>가입일</th>
	                                            <th>등급</th>
	                                            <th>role</th>
	                                            <th>이메일</th>
	                                            <th>관리</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
										<c:forEach var="member" items="${members}">
	                                        <tr style="text-align:center">
	                                        <td class="member_id">${member.member_id }
	                                        <td>${member.member_username }
	                                        <td>${member.member_name }
	                                        <td>${member.member_birth_date }
	                                        <td>${member.member_phone }
	                                        <td>${member.member_zipcode }
	                                        <td>${member.member_address1 }
	                                        <td>${member.member_address2 }
	                                        <td>${member.formedDate }
	                                        <td>${member.grade_name }
	                                        <td>${member.role }
	                                        <td>${member.member_email}
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
									$("body").on("click",".delete",function(){
										let member_id = $(this).closest("tr").find(".member_id").text();
										let target = $(this).closest("tr");
										$.ajax({
											type:"delete",
											url:"/admin/rest/"+member_id,
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