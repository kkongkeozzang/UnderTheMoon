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
				                            <select name="md_region" id="md_region">
				                            	<option value="">--지역을 선택하세요--</option>
				                            	<option value="서울">서울</option>
				                            	<option value="부산">부산</option>
				                            	<option value="인천">인천</option>
				                            	<option value="대전">대전</option>
				                            	<option value="대구">대구</option>
					                            <option value="세종">세종</option>
				                            	<option value="울산">울산</option>
				                            	<option value="광주">광주</option>
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
				                            <select name="md_category" id="md_category">
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
                                            <th width=8%>상품지역</th>
                                            <th width=8%>상품명</th>
                                            <th width=15%>상품정보</th>
                                            <th width=8%>상품가격</th>
                                            <th width=9%>상품종류</th>
                                            <th width=7%>상품도수</th>
                                            <th width=15%>상품이미지</th>
                                            <th width=15%>정보이미지</th>
                                            <th width=15%>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="mds" items="${mds}">
                                        <tr>
                                        <form action="/seller/updateMd" method="post" class="updateFrm">
                                            <td style="font-size:medium;color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${mds.md_id}<input type=hidden value=${mds.md_id } class=md_id name=md_id>
                                            <td>
                                            	${mds.md_region }
                                            	<input type=text class="md_region" value=${mds.md_region } readonly>
                                            	<select class="md_region_select" name="md_region" style="display:none;">
					                            	<option value="서울">서울</option>
					                            	<option value="부산">부산</option>
					                            	<option value="인천">인천</option>
					                            	<option value="대전">대전</option>
					                            	<option value="대구">대구</option>
					                            	<option value="세종">세종</option>
					                            	<option value="울산">울산</option>
					                            	<option value="광주">광주</option>
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
                                            </td>
                                            <td>${mds.md_name }<input type=text class="md_name" value="${mds.md_name }" name=md_name maxLength=10 readonly>
                                            <td>'${mds.md_content }'<input type=text class="md_content" value="${mds.md_content }" name=md_content maxLength=50 readonly>
                                            <td>${mds.md_price }<input type=text class="md_price" value=${mds.md_price } name=md_price maxLength=10 readonly>
                                            <td>
                                            	${mds.md_category }
                                        		<input type=text class="md_category" value=${mds.md_category } readonly>
                                            	<select class="md_category_select" name="md_category" style="display:none;">
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
                                            </td>
                                            <td>${mds.md_abv }<input type=text class="md_abv" value="${mds.md_abv }" name=md_abv maxLength=10 readonly>
                                            <td>${mds.md_image }<input type=text class="md_image" value="${mds.md_image }" name=md_image maxLength=50 readonly>
                                            <td>${mds.md_detail_image }<input type=text class="md_detail_image" value="${mds.md_detail_image }" name=md_detail_image maxLength=50 readonly>
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
										$("#md_name").on("blur",function(){
											$.ajax({
												url: "/seller/checkMd",
												data:{md_name:$("#md_name").val()}
											}).done(function(resp){
 												if(resp != 0){
 													$("#checkDbl").css("color","red");
													$("#checkDbl").html("이미 사용중인 이름 입니다.");
												}else{
													let mdName = $("#md_name").val();
			                                		let nameRegex = /^[a-zA-Zㄱ-ㅎ가-힣]+/;
			                                		if(!nameRegex.test(mdName)){
			                                			$("#checkDbl").css("color","red");
			                                			$("#checkDbl").html("상품 이름을 다시 확인해주세요!");
			                                		}else{
			                                			$("#checkDbl").css("color","blue");
														$("#checkDbl").html("사용 가능한 이름 입니다.");	
			                                		}
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
                            			let checkDbl = $("#checkDbl").html();
                            			                               		
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
                            			}else if(checkDbl == "이미 사용중인 이름 입니다.") {
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
                            		
                            		$("table").on('click',"#del",function(){ // 삭제버튼 클릭시
                            			let md_id = $(this).parent().siblings("td").children(".md_id").val();
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				location.href="/seller/deleteMd?md_id="+md_id;
                            			}
                            		})
                            		
                            		$("table").on('click',"#mod",function(){ //수정 버튼 클릭시
                            			let md_id = $(this).parent().siblings("td").children(".md_id").val();
                            		
                            			bkRegion = $(this).parent().siblings("td").children(".md_region").val();
                            			bkName = $(this).parent().siblings("td").children(".md_name").val();
                            			bkContent = $(this).parent().siblings("td").children(".md_content").val();
                            			bkPrice = $(this).parent().siblings("td").children(".md_price").val();
                            			bkCategory = $(this).parent().siblings("td").children(".md_category").val();
                            			bkAbv = $(this).parent().siblings("td").children(".md_abv").val();
                            			bkImg = $(this).parent().siblings("td").children(".md_image").val();
                            			bkDetail = $(this).parent().siblings("td").children(".md_detail_image").val();

                            			$(this).prev("#del").css("display","none");
                            			$(this).css("display","none");
                            			$(this).next("#update").css("display","inline-block");
                            			$(this).siblings("#cancelMod").css("display","inline-block");
                            			$(this).parent().parent().siblings("tr").find("#mod").not($(this)).css("display","none");
                            			$(this).parent().parent().siblings("tr").find("#del").css("display","none");
                            			
                            			
                            			$(this).parent().siblings("td").children(".md_region").css("display","none");
                            			$(this).parent().siblings("td").children(".md_region_select").css("display","inline-block");
                            			$(this).parent().siblings("td").children(".md_region_select").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_region_select").val(bkRegion);
                            			$(this).parent().siblings("td").children(".md_name").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_name").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_content").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_content").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_price").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_price").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_category").css("display","none");
                            			$(this).parent().siblings("td").children(".md_category_select").css("display","inline-block");
                            			$(this).parent().siblings("td").children(".md_category_select").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_category_select").val(bkCategory);
                            			$(this).parent().siblings("td").children(".md_abv").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_abv").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_image").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_image").css("border","1px solid black");
                            			$(this).parent().siblings("td").children(".md_detail_image").removeAttr("readonly");
                            			$(this).parent().siblings("td").children(".md_detail_image").css("border","1px solid black");
                            		})
                            		
                            		$("table").on('click',"#cancelMod",function(){ //수정취소버튼 클릭시
                            			if(confirm("수정을 취소하시겠습니까?")){
                            				$(this).parent().siblings("td").children(".md_region").val(bkRegion);
                            				$(this).parent().siblings("td").children(".md_name").val(bkName);
                            				$(this).parent().siblings("td").children(".md_content").val(bkContent);
                            				$(this).parent().siblings("td").children(".md_price").val(bkPrice);
                            				$(this).parent().siblings("td").children(".md_category").val(bkCategory);
                            				$(this).parent().siblings("td").children(".md_abv").val(bkAbv);
                            				$(this).parent().siblings("td").children(".md_image").val(bkImg);
                            				$(this).parent().siblings("td").children(".md_detail_image").val(bkDetail);
                                			
                                			$(this).css("display","none");
                                			$(this).prev("#update").css("display","none");
                                			$(this).siblings("#mod").css("display","inline-block");
                                			$(this).siblings("#del").css("display","inline-block");
                                			$(this).parent().parent().siblings("tr").find("#mod").not($(this)).css("display","inline-block");
                                			$(this).parent().parent().siblings("tr").find("#del").not($(this).siblings()).css("display","inline-block");
                                			
                                			$(this).parent().siblings("td").children(".md_region").css("display","inline-block");
                                			$(this).parent().siblings("td").children(".md_region_select").css("display","none");
                                			$(this).parent().siblings("td").children(".md_region_select").css("border","none");
                                			$(this).parent().siblings("td").children(".md_name").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_name").css("border","none");
                                			$(this).parent().siblings("td").children(".md_content").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_content").css("border","none");
                                			$(this).parent().siblings("td").children(".md_price").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_price").css("border","none");
                                			$(this).parent().siblings("td").children(".md_category").css("display","inline-block");
                                			$(this).parent().siblings("td").children(".md_category_select").css("display","none");
                                			$(this).parent().siblings("td").children(".md_category_select").css("border","none");
                                			$(this).parent().siblings("td").children(".md_abv").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_abv").css("border","none");
                                			$(this).parent().siblings("td").children(".md_image").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_image").css("border","none");
                                			$(this).parent().siblings("td").children(".md_detail_image").attr("readonly","readonly");
                                			$(this).parent().siblings("td").children(".md_detail_image").css("border","none");
                            			}
                            		})
                            		
                            		$("table").on('click',"#update",function(){ //수정버튼 클릭시
                        				let mdRegion = $(this).parent().siblings("td").children(".md_region").val();
                        				let mdName = $(this).parent().siblings("td").children(".md_name").val();
                        				let mdContent = $(this).parent().siblings("td").children(".md_content").val();
                        				let mdPrice = $(this).parent().siblings("td").children(".md_price").val();
                        				let mdCategory = $(this).parent().siblings("td").children(".md_category").val();
                        				let mdAbv = $(this).parent().siblings("td").children(".md_abv").val();
                        				let mdImage = $(this).parent().siblings("td").children(".md_image").val();
                        				let mdDetail = $(this).parent().siblings("td").children(".md_detail_image").val();
                                		
                                		let numberRegex = /^[0-9]+$/;

                                		
                            			if(!numberRegex.test(mdPrice)) {
                            				alert("상품가격을 확인해주세요!");
                            				return false;
                            			}else if(!numberRegex.test(mdAbv)) {
                            				alert("상품도수를 확인해주세요!");
                            				return false;
                            			}else if(mdName == "" || mdContent == "" ||mdPrice == "" ||mdAbv == "" ||mdAbv == "") {
                            				alert("빈칸을 확인해주세요.");
                            				return false;
                            			}else{
                            				if(confirm("정말로 수정하시겠습니까?")){
                            					$(this).parent().siblings(".updateFrm").submit();
                            				}
                            			}
                            		})
									
// 									//문자 제거
// 									function removeChar(event) {
// 										event = event || window.event;
// 										var keyID = (event.which) ? event.which : event.keyCode;
// 										if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
// 											return;
// 										else
// 											//숫자와 소수점만 입력가능
// 											event.target.value = event.target.value.replace(/[^-\.0-9]/g, "");
// 									}
// 									//콤마 찍기
// 									function comma(obj) {
// 										var regx = new RegExp(/(-?\d+)(\d{3})/);
// 										var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
// 										var strArr = obj.split('.');
// 										while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
// 											//정수 부분에만 콤마 달기
// 											strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
// 										}
// 										if (bExists > -1) {
// 											//. 소수점 문자열이 발견되지 않을 경우 -1 반환
// 											obj = strArr[0] + "." + strArr[1];
// 										} else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환
// 											obj = strArr[0];
// 										}
// 										return obj;//문자열 반환
// 									}
// 									//콤마 풀기
// 									function uncomma(str) {
// 										str = "" + str.replace(/,/gi, ''); // 콤마 제거
// 										str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거
// 										return (new Number(str));//문자열을 숫자로 반환
// 									}
// 									//input box 콤마달기
// 									function inputNumberFormat(obj) {
// 										obj.value = comma(obj.value);
// 									}
// 									//input box 콤마풀기 호출
// 									function uncomma_call(){
// 									var input_value = document.getElementById('input1');
// 									input_value.value = uncomma(input_value.value);
// 									}
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