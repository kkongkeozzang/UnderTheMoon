<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러오피스</title>
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
                    <h1 class="h3 mb-2 text-gray-800">상품 관리</h1>
                    <p class="mb-4">상품 관리 메뉴입니다. 여기에서 상품을 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
	                            <form action="/seller/insertMd" method="post" id=submit-md>
	                            	<table id=input-new style="display:none;">
	                            		<tr>
	                            			<th width=20%>항목
	                            			<th width=40%>입력
	                            			<th width=40%>
	                            		</tr>
	                            		<tr>
				                            <td>상품지역
				                            <td>
				                            <select id="md_region" name="md_region">
				                            	<option value="">--지역을 선택하세요--</option>
				                            	<option value="서울">서울</option>
				                            	<option value="부산">부산</option>
				                            	<option value="인천">인천</option>
				                            	<option value="대전">대전</option>
				                            	<option value="울산">울산</option>
				                            	<option value="경기도">경기도</option>
				                            	<option value="강원도">강원도</option>
				                            	<option value="충청북도">충청북도</option>
				                            	<option value="충청남도">충청남도</option>
				                            	<option value="전라북도">전라북도</option>
				                            	<option value="전라남도">전라남도</option>
				                            	<option value="경상북도">경상북도</option>
				                            	<option value="경상남도">경상남도</option>
				                            	<option value="제주도">제주도</option>
				                            </select>
				                        </tr>
	                            		<tr>
	                             			<td>상품명
	                             			<td><input type=text placeholder="예) '안동소주'" id="md_name" name="md_name" maxLength=30>
	                             			<td>
	                             			<a href="#" class="btn btn-secondary btn-icon-split" id=check>
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-arrow-right"></i>
		                                        </span>
		                                        <span class="text">중복확인</span>
		                                    </a>
	                             			<span id="checkDbl"></span>
	                             		</tr>
	                             		<tr>
				                            <td>상품정보
				                            <td><input type=text placeholder="예) '역사가 깊은 소주'" id="md_content" name="md_content" maxLength=100>
				                        </tr>
				                        <tr>
				                            <td>상품가격
				                            <td><input type=text placeholder="예) '0','5000','10000'" id="md_price" name="md_price" maxLength=10> 
<!-- 				                            onKeyUp="removeChar(event);inputNumberFormat(this);"onKeyDown="inputNumberFormat(this);" -->
				                        </tr>
				                       	<tr>
				                            <td>상품종류
				                            <td>
				                            <select id="md_category" name="md_category">
				                            	<option value="">--종류를 선택하세요--</option>
				                            	<option value="탁주">탁주</option>
				                            	<option value="약주">약주</option>
				                            	<option value="청주">청주</option>
				                            	<option value="맥주">맥주</option>
				                            	<option value="과실주">과실주</option>
				                            	<option value="소주">소주</option>
				                            	<option value="위스키">위스키</option>
				                            	<option value="브랜디">브랜디</option>
				                            	<option value="일반증류주">일반증류주</option>
				                            	<option value="리큐르">리큐르</option>
				                            	<option value="기타">기타</option>
				                            </select>
				                        </tr>
				                        <tr>
				                            <td>상품도수
				                            <td><input type=text placeholder="예) '7','14'" id="md_abv" name="md_abv" maxLength=5>
				                        </tr>
				                        <tr>
				                            <td>상품이미지
				                            <td><input type=text placeholder="예) '안동소주.jpg'" id="md_image" name="md_image" maxLength=30>
				                        </tr>
				                        <tr>
				                            <td>상품정보이미지
				                            <td><input type=text placeholder="예) '확장자.gif,jpg,jpeg,png'" id="md_detail_image" name="md_detail_image" maxLength=30>
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
                                            <th>상품지역</th>
                                            <th>상품명</th>
                                            <th>상품정보</th>
                                            <th>상품가격</th>
                                            <th>상품종류</th>
                                            <th>상품도수</th>
                                            <th>상품이미지</th>
                                            <th>정보이미지</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="mds" items="${mds}">
                                        <tr>
                                        <form action="/seller/updateMd" method="post" id="updateMd${mds.md_id}">
                                            <td>${mds.md_id}<input type=hidden value=${mds.md_id } name=md_id>
                                            <td style="font-size:0em;color: white;">${mds.md_region }<input type=text value='${mds.md_region }' id="md_region${mds.md_id}" name=md_region style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_name }<input type=text value='${mds.md_name }' id="md_name${mds.md_id}" name=md_name style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_content }<input type=text value='${mds.md_content }' id="md_content${gmds.md_id}" name=md_content style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=50 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_price }<input type=text value='${mds.md_price }' id="md_price${mds.md_id}" name=md_price style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_category }<input type=text value='${mds.md_category }' id="md_category${mds.md_id}" name=md_category style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_abv }<input type=text value='${mds.md_abv }' id="md_abv${mds.md_id}" name=md_abv style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_image }<input type=text value='${mds.md_image }' id="md_image${mds.md_id}" name=md_image style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=50 readonly>
                                            <td style="font-size:0em;color: white;">${mds.md_detail_image }<input type=text value='${gmds.md_detail_image }' id="md_detail_image${mds.md_id}" name=md_detail_image style="font-size:medium;color:black;border:none;width:100%;height:100%;overflow:auto;"  maxLength=10 readonly>
                                            <td>
                                           	<a onclick="del(this);" val="${mds.md_id}" id="del${mds.md_id}" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
		                                    
                                           	<a onclick="modify(this);" val="${mds.md_id}" id="mod${mds.md_id}" class="btn btn-warning btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-exclamation-triangle"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                   	<a onclick="update(this);" id="update${mds.md_id}" val="${mds.md_id}" style="display:none;" class="btn btn-success btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-check"></i>
		                                        </span>
		                                        <span class="text">수정</span>
		                                    </a>
		                                 	<a onclick="cancelMod(this);" id="cancelMod${mds.md_id}" val="${mds.md_id}" style="display:none;" class="btn btn-primary btn-icon-split">
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
                            				$("#md_region").val("");
                            				$("#md_name").val("");
                            				$("#md_content").val("");
                            				$("#md_price").val("");
                            				$("#md_category").val("");
                            				$("#md_abv").val("");
                            				$("#md_image").val("");
                            				$("#md_detail_image").val("");
                                			
                                			$("#add").css("display","inline-block");
                                			$("#insert").css("display","none");
                                			$("#cancel").css("display","none");
                                			$("#input-new").css("display","none");	
                            			}
                            		})
                            		
          		                    $(function(){
										$("#check").on("click",function(){
											$.ajax({
												url: "/seller/checkMd",
												data:{md_name:$("#md_name").val()}
											}).done(function(resp){
												console.log(resp);
												if(resp != 0){
													$("#checkDbl").html("이미 사용중인 등급이름 입니다.");
												}else{
													$("#checkDbl").html("사용 가능한 등급이름 입니다.");
												}
											})
										});
									})
                            		
                            		$("#insert").on("click",function(){ //입력 버튼 클릭 시
                            			
                            			let mdRegion = $("#md_region").val();
                            			let mdName = $("#md_name").val();
                            			let mdContent = $("#md_content").val();
                            			let mdPrice = $("#md_price").val();
                            			let priceRegex = /^[0-9]+$/;
                            			
                            			let mdCategory = $("#md_category").val();
                            			let mdAbv = $("#md_abv").val();
                            			let abvRegex = /^[0-9]+$/;
                            			
                            			let mdImage = $("#md_image").val();
                            			let mdDetailImage = $("#md_detail_image").val();
                            			let imgRegex = /(\.gif|\.jpg|\.jpeg|\.png)$/i;
                            			                               		
                            			if(mdRegion=="") {
                            				alert("지역을 선택해주세요!");
                            				return false;
                            			}else if(mdName == "") {                            				
                            				alert("상품명을 입력해주세요!");
                            				return false;
                            			}else if(mdContent == "") {                            				
                            				alert("상품정보를 입력해주세요!");
                            				return false;
                            			}else if(mdPrice == "") {                            				
                            				alert("상품가격을 입력해주세요!");
                            				return false;
                            			}else if(mdCategory == "") {                            				
                            				alert("상품종류를 선택해주세요!");
                            				return false;
                            			}else if(mdAbv == "") {                            				
                            				alert("상품도수를 입력해주세요!");
                            				return false;
                            			}else if(mdImage == "") {                            				
                            				alert("상품이미지 경로를 입력해주세요!");
                            				return false;
                            			}else if(mdDetailImage == "") {                            				
                            				alert("상품정보이미지 경로를 입력해주세요!");
                            				return false;
                            			}else if(checkDbl == "") {
                            				alert("중복확인을 실행해주세요");
                            				return false;
                            			}else if(checkDbl == "이미 사용중인 등급이름 입니다.") {
                            				alert("등급이름이 중복됐는지 확인해주세요!");
                            				return false;
                            				
                            			}else if(!priceRegex.test(mdPrice)) {
                            				alert("상품가격을 확인해주세요!(숫자만)");
                            				return false;
                            			}else if(!abvRegex.test(mdAbv)) {
                            				alert("상품 도수를 확인해주세요!(숫자만)");
                            				return false;
                            			}else if(!imgRegex.test(mdImage)) {
                            				alert("상품이미지 파일명을 확인해주세요!");
                            				return false;
                            			}else if(!imgRegex.test(mdDetailImage)) {
                            				alert("상품정보이미지 파일명을 확인해주세요!");
                            				return false;
                            			}else{
                            				if(confirm("정말로 입력하시겠습니까?")){
                            					$("#submit-md").submit();
                            				}
                            			}
                            		})
                            		function del(element) { // 삭제버튼 클릭시
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				let value = element.getAttribute("val");
                            				location.href="/seller/deleteGrade?grade_name="+value;
                            			}
                            		}
                            		
                            		function modify(element){ //수정 버튼 클릭시
                            			let value = element.getAttribute("val");
                            			eval("bkPercent" + value + "=" + $("#grade_percent"+value).val());
                            			eval("bkTarget" + value + "=" + $("#grade_target"+value).val());

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
                            		
									
									//문자 제거
									function removeChar(event) {
										event = event || window.event;
										var keyID = (event.which) ? event.which : event.keyCode;
										if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
											return;
										else
											//숫자와 소수점만 입력가능
											event.target.value = event.target.value.replace(/[^-\.0-9]/g, "");
									}
									//콤마 찍기
									function comma(obj) {
										var regx = new RegExp(/(-?\d+)(\d{3})/);
										var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
										var strArr = obj.split('.');
										while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
											//정수 부분에만 콤마 달기
											strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
										}
										if (bExists > -1) {
											//. 소수점 문자열이 발견되지 않을 경우 -1 반환
											obj = strArr[0] + "." + strArr[1];
										} else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환
											obj = strArr[0];
										}
										return obj;//문자열 반환
									}
									//콤마 풀기
									function uncomma(str) {
										str = "" + str.replace(/,/gi, ''); // 콤마 제거
										str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거
										return (new Number(str));//문자열을 숫자로 반환
									}
									//input box 콤마달기
									function inputNumberFormat(obj) {
										obj.value = comma(obj.value);
									}
									//input box 콤마풀기 호출
									function uncomma_call(){
									var input_value = document.getElementById('input1');
									input_value.value = uncomma(input_value.value);
									}
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