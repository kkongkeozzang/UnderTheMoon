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
                    <h1 class="h3 mb-2 text-gray-800">등급 관리</h1>
                    <p class="mb-4">등급 관리 메뉴입니다. 여기에서 등급을 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">등급 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
	                            <form action="/admin/insertGrade" method="post" id=submit-grade>
	                            	<table id=input-new style="display:none;">
	                            		<tr>
	                            			<th width=20%>항목
	                            			<th width=30%>입력
	                            			<th width=50%>
	                            		</tr>
	                            		<tr>
	                             			<td>등급이름</td>
	                             			<td><input type=text placeholder="예) '해','달','별'" id="grade_name" name="grade_name" maxLength=6></td>
	                             			<td>
	                             			<span id="checkDbl"></span>
	                             			</td>
	                             		</tr>
	                             		<tr>
				                            <td>적립률</td>
				                            <td><input type=text placeholder="예) '0.05','0.07','0.1'" id="grade_percent" name="grade_percent" maxLength=10></td>
				                        </tr>
				                        <tr>
				                            <td>달성기준</td>
				                            <td><input type=text placeholder="예) '0','500000','1000000'" id="grade_target" name="grade_target" maxLength=10></td>
				                            
				                        </tr>
				                       	<tr>
				                            <td>등급혜택</td>
				                            <td><input type=text placeholder="예) '무료배송 쿠폰1개, 5000원 할인쿠폰 1개'" id="grade_coupon" name="grade_coupon" maxLength=50></td>
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
                                            <th width=15%>등급이름</th>
                                            <th width=15%>적립률</th>
                                            <th width=15%>달성기준</th>
                                            <th width=30%>등급혜택</th>
                                            <th width=25%>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="grades" items="${grades}">
                                        <tr>
                                        <form action="/admin/updateGrade" method="post" id="upgrade${grades.grade_name}">
                                            <td>${grades.grade_name}<input type=hidden value=${grades.grade_name } name=grade_name>
                                            <td style="font-size:0em;color: white;">${grades.grade_percent }<input type=text value='${grades.grade_percent }' id="grade_percent${grades.grade_name}" name=grade_percent style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${grades.grade_target }<input type=text value='${grades.grade_target }' id="grade_target${grades.grade_name}" name=grade_target style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${grades.grade_coupon }<input type=text value='${grades.grade_coupon }' id="grade_coupon${grades.grade_name}" name=grade_coupon style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=50 readonly>
                                            <td>
                                           	<a onclick="del(this);" val="${grades.grade_name}" id="del${grades.grade_name}" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
		                                    
                                           	<a onclick="modify(this);" val="${grades.grade_name}" id="mod${grades.grade_name}" class="btn btn-warning btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-exclamation-triangle"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                   	<a onclick="update(this);" id="update${grades.grade_name}" val="${grades.grade_name}" style="display:none;" class="btn btn-success btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-check"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                 	<a onclick="cancelMod(this);" id="cancelMod${grades.grade_name}" val="${grades.grade_name}" style="display:none;" class="btn btn-primary btn-icon-split">
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
                            				$("#grade_name").val("");
                                			$("#grade_percent").val("");
                                			$("#grade_target").val("");
                                			$("#grade_coupon").val("");
                                			$("#checkDbl").html("");

                                			$("#add").css("display","inline-block");
                                			$("#insert").css("display","none");
                                			$("#cancel").css("display","none");
                                			$("#input-new").css("display","none");	
                            			}
                            		})
                            		
                            		$("#insert").on("click",function(){ //입력 버튼 클릭 시
                            			
                                		let gradeName = $("#grade_name").val();
                                		let nameRegex = /^[a-zA-Zㄱ-ㅎ가-힣]+$/;
                                		
                                		let gradePercent = $("#grade_percent").val();
                                		let percentRegex = /^0\.[0-9]+$/;
                                		
                                		let gradeTarget = $("#grade_target").val();
                                		let targetRegex = /^[0-9]+$/;
                                		
                                		let gradeCoupon = $("#grade_coupon").val();
                                		let checkDbl = $("#checkDbl").html();      
                                		
                            			if(!nameRegex.test(gradeName)) {
                            				alert("등급이름을 확인해주세요!(문자만 입력하세요. 예)해, 달, 별)");
                            				return false;
                            			}else if(checkDbl == "이미 사용중인 등급이름 입니다.") {
                            				alert("등급이름이 중복됐는지 확인해주세요!");
                            				return false;
                            			}else if(!percentRegex.test(gradePercent)) {
                            				alert("적립률을 확인해주세요!(소숫점으로만 입력하세요. 예)0.1, 0.05)");
                            				return false;
                            			}else if(!targetRegex.test(gradeTarget)) {
                            				alert("달성기준을 확인해주세요!(숫자만 입력하세요 예)100000)");
                            				return false;
                            			}else if(gradeCoupon == "") {
                            				alert("등급혜택을 입력해주세요!(최대 50자)");
                            				return false;
                            			}else{
                            				if(confirm("정말로 입력하시겠습니까?")){
                            					$("#submit-grade").submit();
                            				}
                            			}
                            		})
                            		function del(element) { // 삭제버튼 클릭시
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				let value = element.getAttribute("val");
                            				location.href="/admin/deleteGrade?grade_name="+value;
                            			}
                            		}
                            		
                            		function modify(element){ //수정 버튼 클릭시
                            			let value = element.getAttribute("val");
                            			eval("bkPercent" + value + "=" + $("#grade_percent"+value).val());
                            			eval("bkTarget" + value + "=" + $("#grade_target"+value).val());
                            			eval("bkCoupon" + value + "=" + '$("#grade_coupon"+value).val()');

                            			$("#del"+value).css("display","none");
                            			$("#mod"+value).css("display","none");
                            			$("#update"+value).css("display","inline-block");
                            			$("#cancelMod"+value).css("display","inline-block");
                            			$("#grade_percent"+value).removeAttr("readonly");
                            			$("#grade_percent"+value).css("border","1px solid black");
                            			$("#grade_target"+value).removeAttr("readonly");
                            			$("#grade_target"+value).css("border","1px solid black");
                            			$("#grade_coupon"+value).removeAttr("readonly");
                            			$("#grade_coupon"+value).css("border","1px solid black");
                            		}
                            		
                            		function cancelMod(element){ //수정취소버튼 클릭시
                            			let value = element.getAttribute("val");
                            			if(confirm("수정을 취소하시겠습니까?")){
                            				$("#grade_percent"+value).val(eval("bkPercent"+value));
                                			$("#grade_target"+value).val(eval("bkTarget"+value));
                                			$("#grade_coupon"+value).val(eval("bkCoupon"+value));
                            				$("#del"+value).css("display","inline-block");
                                			$("#mod"+value).css("display","inline-block");
                                			$("#update"+value).css("display","none");
                                			$("#cancelMod"+value).css("display","none");
                                			$("#grade_percent"+value).attr("readonly","readonly");
                                			$("#grade_percent"+value).css("border","none");
                                			$("#grade_target"+value).attr("readonly","readonly");
                                			$("#grade_target"+value).css("border","none");
                                			$("#grade_coupon"+value).attr("readonly","readonly");
                                			$("#grade_coupon"+value).css("border","none");
                            			}
                            		}
                            		
                            		function update(element) {
                            			let value = element.getAttribute("val");
                                		
                                		let gradePercent = $("#grade_percent"+value).val();
                                		let percentRegex = /^0\.[0-9]+$/;
                                		
                                		let gradeTarget = $("#grade_target"+value).val();
                                		let targetRegex = /^[0-9]+$/;
                                		
                                		let gradeCoupon = $("#grade_coupon"+value).val();
                                		
                            			if(!percentRegex.test(gradePercent)) {
                            				alert("적립률을 확인해주세요!(소숫점으로만 입력하세요. 예)0.1, 0.05)");
                            				return false;
                            			}else if(!targetRegex.test(gradeTarget)) {
                            				alert("달성기준을 확인해주세요!(숫자만 입력하세요 예)100000)");
                            				return false;
                            			}else if(gradeCoupon == "") {
                            				alert("등급혜택을 입력해주세요!(최대 50자)");
                            				return false;
                            			}else{
                            				if(confirm("정말로 수정하시겠습니까?")){
                            					$("#upgrade"+value).submit();
                            				}
                            			}
                            		}

                            		$(function(){
										$("#grade_name").on("blur",function(){
											$.ajax({
												url: "/admin/checkGrade",
												data:{grade_name:$("#grade_name").val()}
											}).done(function(resp){
												if(resp != 0){
													$("#checkDbl").css("color","red");
													$("#checkDbl").html("이미 사용중인 등급이름 입니다.");
												}else{
													let gradeName = $("#grade_name").val();
			                                		let nameRegex = /^[a-zA-Zㄱ-ㅎ가-힣]+$/;
			                                		
													if(!nameRegex.test(gradeName)){
														$("#checkDbl").css("color","red");
														$("#checkDbl").html("등급이름을 다시 확인해주세요!");	
													}else{
														$("#checkDbl").css("color","blue");
														$("#checkDbl").html("사용 가능한 등급이름 입니다.");
													}
												}
											})
										});
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