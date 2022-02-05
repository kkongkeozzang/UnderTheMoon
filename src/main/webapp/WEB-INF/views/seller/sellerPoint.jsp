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
<style>
	
	#input-new td{
		font-size:medium;
		color:black;
	}
	
	#input-new td select{
		border: 1px solid black;
	}
	
	#input-new td input{
		border: 1px solid black;
	}
	
 	#dataTable>tbody>tr>td{
 		font-size:0em;
 		color: white;
 	}
 	
	#dataTable>tbody>tr>td>input {
		font-size:medium;
		color:black;
		border:none;
		width:100%;
		height:100%;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	#dataTable>tbody>tr>td>select {
		font-size:medium;
		color:black;
		border:none;
		width:100%;
		height:100%;
		disabled:true;
		display:inline-block;
	}
</style>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
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
                    <h1 class="h3 mb-2 text-gray-800">포인트 관리</h1>
                    <p class="mb-4">포인트 관리 메뉴입니다. 여기에서 포인트를 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">포인트 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
	                            <form action="/seller/insertPoint" method="post" id=insert-new>
	                            	<table id=input-new style="display:none;">
	                            		<tr>
	                            			<th width=20%>항목
	                            			<th width=40%>입력
	                            			<th width=40%>
	                            		</tr>
	                            		<tr>
				                            <td>적립/사용금액
				                            <td><input type=text placeholder="" id="point_used_saved" name="point_used_saved" maxLength=10>
				                        </tr>
	                            		<tr>
	                             			<td>적립/사용사유
	                             			<td><input type=text placeholder="" id="point_event" name="point_event" maxLength=30>
	                             		</tr>
	                             		<tr>
				                            <td>회원번호
				                            <td><input type=text placeholder="" id="member_id" name="member_id" maxLength=10>
				                        </tr>
	                            	</table>
                            	<br>
                            	<div>
                                    <a id="add" class="btn btn-info btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">추가</span>
                                    </a>
                                    <a id="cancel" style="display:none;" class="btn btn-primary btn-icon-split">
			                            <span class="icon text-white-50">
			                                 <i class="fas fa-flag"></i>
			                            </span>
			                            <span class="text">취소</span>
			                        </a>
			                        <a id="insert" style="display:none;" class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">입력</span>
                                    </a>
                            	</div>
                            	</form>
                            	
                            	<hr>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    	<tr>
                                    		<th>ID</th>
                                            <th>적립/사용금액</th>
											<th>적립/사용사유</th>
											<th>회원번호</th>
											<th>적립/사용일자</th>
											<th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="points" items="${points}">
                                        <tr>
                                        <form action="/seller/updatePoint" method="post" class="updateFrm">
                                            <td style="font-size:medium;color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${points.point_id }<input type=hidden value=${points.point_id } class=point_id name=point_id>
                                            <td>${points.point_used_saved }<input type=text class="point_used_saved" value="${points.point_used_saved }" name=point_used_saved maxLength=10 readonly>
                                            <td>${points.point_event }<input type=text class="point_event" value="${points.point_event }" name=point_event maxLength=30 readonly>
                                            <td>${points.member_id }<input type=text class="member_id" value="${points.member_id }" name=member_id maxLength=10 readonly>
                                            <td>${points.point_date }<input type=text class="point_date" value=${points.point_date } maxLength=10 readonly>
                                            <td>
                                           	<a id="del" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
		                                    
                                           	<a id="mod" class="btn btn-warning btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-exclamation-triangle"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                   	<a id="update" style="display:none;" class="btn btn-success btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-check"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                 	<a id="cancelMod" style="display:none;" class="btn btn-primary btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-flag"></i>
		                                        </span>
		                                        <span class="text">수정취소</span>
		                                    </a>
                                            </td>
                                            </form>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <script>
	                        		
                            		$("#add").on("click",function(){ // 추가버튼 클릭시
                            			$("#add").css("display","none");
                            			$("#input-new").css("display","block");
                            			$("#insert").css("display","inline-block");
                            			$("#cancel").css("display","inline-block");
                            		})
                            		$("#cancel").on("click",function(){ // 입력 취소버튼 클릭시
                            			if(confirm("입력을 취소하시겠습니까?")){
                            				$("#point_used_saved").val("");
                            				$("#point_event").val("");
                            				$("#member_id").val("");
                                			
                                			$("#add").css("display","inline-block");
                                			$("#insert").css("display","none");
                                			$("#cancel").css("display","none");
                                			$("#input-new").css("display","none");	
                            			}
                            		})
                            		
                            		$("#insert").on("click",function(){ //입력 버튼 클릭 시
                            			let pointUsedSaved = $("#point_used_saved").val();
                        				let pointEvent = $("#point_event").val();
                        				let memberId = $("#member_id").val();
                            			
                            			let pointRegex = /^-?[0-9]+$/;
                            			let idRegex = /^[0-9]+$/;
                            			                               		
                            			if(pointUsedSaved=="") {
                            				alert("적립/사용금액을 입력해주세요!");
                            				return false;
                            			}else if(pointEvent == "") {                            				
                            				alert("적립/사용 사유를 입력해주세요!");
                            				return false;
                            			}else if(memberId == "") {                            				
                            				alert("회원번호를 입력해주세요!");
                            				return false;
                            				
                            			}else if(!pointRegex.test(pointUsedSaved)) {
                            				alert("포인트 입력값을 확인해주세요!(정수만)");
                            				return false;
                            			}else if(!pointRegex.test(memberId)) {
                            				alert("회원번호 입력값을 확인해주세요!(숫자만)");
                            				return false;
                            			
                            			}else{
                            				if(confirm("정말로 입력하시겠습니까?")){
                            					$("#insert-new").submit();
                            				}
                            			}
                            		})
                            		
                            		$("table").on('click',"#del",function(){ // 삭제버튼 클릭시
                            			let point_id = $(this).parent().siblings("td").children(".point_id").val();
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				location.href="/seller/deletePoint?point_id="+point_id;
                            			}
                            		})
                            		
                            		$("table").on('click',"#mod",function(){ //수정 버튼 클릭시
                            			let point_id = $(this).parent().siblings("td").children(".point_id").val();
                            		
                            			bkPointUsedSaved = $(this).parent().siblings("td").children(".point_used_saved").val();
                            			bkPointEvent = $(this).parent().siblings("td").children(".point_event").val();
                            			bkMemberId = $(this).parent().siblings("td").children(".member_id").val();

                            			$(this).prev("#del").css("display","none");
                            			$(this).css("display","none");
                            			$(this).next("#update").css("display","inline-block");
                            			$(this).siblings("#cancelMod").css("display","inline-block");
                            			$(this).parent().parent().siblings("tr").find("#mod").not($(this)).css("display","none");
                            			$(this).parent().parent().siblings("tr").find("#del").css("display","none");
                            			
                            			$(this).parent().siblings("td").children(".point_used_saved").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".point_used_saved").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".point_event").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".point_event").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".member_id").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".member_id").css("border","1px solid black");
                            		})
                            		
                            		$("table").on('click',"#cancelMod",function(){ //수정취소버튼 클릭시
                            			if(confirm("수정을 취소하시겠습니까?")){
                            				
                            				$(this).parent().siblings("td").children(".point_used_saved").val(bkPointUsedSaved);
                                			$(this).parent().siblings("td").children(".point_event").val(bkPointEvent);
                                			$(this).parent().siblings("td").children(".member_id").val(bkMemberId);
                                			
                                			$(this).css("display","none");
                                			$(this).prev("#update").css("display","none");
                                			$(this).siblings("#mod").css("display","inline-block");
                                			$(this).siblings("#del").css("display","inline-block");
                                			$(this).parent().parent().siblings("tr").find("#mod").not($(this)).css("display","inline-block");
                                			$(this).parent().parent().siblings("tr").find("#del").not($(this).siblings()).css("display","inline-block");
                                			
                                			$(this).parent().siblings("td").children(".point_used_saved").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".point_used_saved").css("border","none");
                                			$(this).parent().siblings("td").children(".point_event").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".point_event").css("border","none");
                                			$(this).parent().siblings("td").children(".member_id").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".member_id").css("border","none");
                            			}
                            		})
                            		
                            		$("table").on('click',"#update",function(){ //수정버튼 클릭시
                        				let pointUsedSaved = $(this).parent().siblings("td").children(".point_used_saved").val();
                        				let pointEvent = $(this).parent().siblings("td").children(".point_event").val();
                        				let memberId = $(this).parent().siblings("td").children(".member_id").val();
                                		
                        				let pointRegex = /^-?[0-9]+$/;
                            			let idRegex = /^[0-9]+$/;
                            			                               		
                            			if(pointUsedSaved=="") {
                            				alert("적립/사용금액을 입력해주세요!");
                            				return false;
                            			}else if(pointEvent == "") {                            				
                            				alert("적립/사용 사유를 입력해주세요!");
                            				return false;
                            			}else if(memberId == "") {                            				
                            				alert("회원번호를 입력해주세요!");
                            				return false;
                            				
                            			}else if(!pointRegex.test(pointUsedSaved)) {
                            				alert("포인트 입력값을 확인해주세요!(정수만)");
                            				return false;
                            			}else if(!pointRegex.test(memberId)) {
                            				alert("회원번호 입력값을 확인해주세요!(숫자만)");
                            				return false;
                            			
                            			}else{
                            				if(confirm("정말로 수정하시겠습니까?")){
                            					$(this).parent().siblings(".updateFrm").submit();
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