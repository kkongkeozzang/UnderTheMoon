<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link rel="icon" href="#">

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style>
body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: .88rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #eef1f3;
}

.mt-100 {
	margin-top: 80px;
}

.card {
	box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem
		1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem
		rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
	border-width: 0;
	transition: all .2s;
	margin: auto;
}

.card-header:first-child {
	border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}

.card-header {
	display: flex;
	align-items: center;
	border-bottom-width: 1px;
	padding-top: 0;
	padding-bottom: 0;
	padding-right: .625rem;
	height: 3.5rem;
	background-color: #fff;
	border-bottom: 1px solid rgba(26, 54, 126, 0.125);
}

.btn-primary.btn-shadow {
	box-shadow: 0 0.125rem 0.625rem rgba(63, 106, 216, 0.4), 0 0.0625rem
		0.125rem rgba(63, 106, 216, 0.5);
}

.btn.btn-wide {
	padding: .375rem 1.5rem;
	font-size: .8rem;
	line-height: 1.5;
	border-radius: .25rem;
}

.btn-primary {
	color: #fff;
	background-color: #3f6ad8;
	border-color: #3f6ad8;
}

.form-control {
	display: block;
	width: 100%;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.card-body {
	flex: 1 1 auto;
	padding: 1.25rem
}

.flex-truncate {
	min-width: 0 !important
}

.d-block {
	display: block !important
}

a {
	color: #E91E63;
	text-decoration: none !important;
	background-color: transparent
}

.media img {
	width: 40px;
	height: auto
}

#board-title {
	text-align: center;
	height: 100px;
	line-height: 100px;
	padding: 100px 0;
}

#title {
	width: 50px;
	height: 50px;
}

.search-bar {
	margin: auto;
}

* {
	box-sizing: border-box;
}

.container {
/* 	width: 1000px; */
}

textarea {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	width: 100%;
}

body {
	margin: 0;
	line-height: 1.5;
	color: #495057;
	text-align: left;
	background-color: #eef1f3
}

.profile-box {
	display: flex;
}

.img-profile {
	border-radius: 70%;
	width: 100%;
	height: 100%;
}

.profile-detail {
	text-align: center;
}

.name {
	font-weight: bold;
}

.list li {
	margin-top: 5px;
}

.label {
	font-size: 12px;
}

.profile-detail {
	justify-content: flex-start;
	flex-direction: column;
}
</style>
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	

	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div id="board-title">
			<span><h3>자주묻는질문</h3></span>
		</div>
		<br>

		<!-- 게시판 박스 -->
		<div class="card mb-3 col-xl-6 col-md-12">
			<!-- 게시글 등록 박스 -->
			<form action="/faq/insert" method="post" id="frm">
				<div class="container mb-4 mt-4">
					<div class="row" style="padding-bottom: 5px; margin:0px;">
						<select class="select" name="faq_category" style="margin-bottom:5px;">
							<option value="">-카테고리 선택-</option>
							<option value="회원">회원</option>
							<option value="서비스 이용">서비스 이용</option>
							<option value="주문/결제">주문/결제</option>
							<option value="상품">상품</option>
							<option value="이벤트/쿠폰/적립금">이벤트/쿠폰/적립금</option>>
							<option value="취소/교환/환불">취소/교환/환불</option>>
						</select>
						<br>
						<div class="col-sm-12" style="padding:0px;">
							<input type="hidden" name=member_id value=${member_id}> 
							<input type=text id=input-title name=faq_title placeholder="제목을 작성하세요 (최대 30자)" style="width: 100%;" maxlength=30>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<textarea name="faq_content" id="summernote"
								style="min-height: 200px; overflow: auto" onkeyup="fn_checkByte(this)"></textarea>
							<script>
                				autosize($("textarea"));
        			        </script>
        			<sup>(<span id="nowByte">0</span>/4000bytes)</sup>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="text-align: right">
							<button type="button" id="board-list" class="btn btn-dark"
								style="background-color: #406882;">목록으로</button>
							<button class="btn btn-dark" type=button id="write"
								style="background-color: #406882;">작성하기</button>
							<script>
					$("#board-list").on("click",function(){
						location.href="javascript:history.back()";
					})
					
					$("#write").on("click",function(){
						if($('.note-editable').html()==""){
							alert("내용을 입력해주세요.");
						}else if($('.select').val()==""){
							alert("카테고리를 선택해주세요.");
						}else if(totalByte <= 11){
							alert("바이트 수를 확인해주세요.(최소 12bytes)");
						}else if(totalByte > maxByte){
							alert("바이트 수를 확인해주세요.(최대 4000bytes)");
						}else if($("#input-title").val()==""){
							alert("제목을 입력해주세요.");
						}else {
							$("#frm").submit();			
						}
					})
				</script>
						</div>
					</div>
				</div>
			</form>
		</div>

		<br>

		<script>
		
		$(document).ready(function() {
			$('#summernote').summernote({  // summernote 에디터 설정 코드
			  height: 500, // 에디터 높이
			  disableResizeEditor: true, // 에디터 사이즈 조절 금지
			  lang: "ko-KR", // 에디터 한글 설정
			  placeholder: '내용을 입력하세요',	//placeholder 설정
			  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload: function(files, editor, welEditable) {
					  for(var i = files.length - 1; i>=0; i--) {
						  sendFile(files[i], this);}  
					},
					onChange:function(contents, editable){ //텍스트 글자수 및 이미지등록개수
						fn_checkByte(contents);
					},
					onInit: function(contents, editable) {
						fn_checkByte_update(contents);
					}
			  },
			  focus : true, // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
			  toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview', 'help']]
				  ],
				  // 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				 // 추가한 폰트사이즈
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				
			});
		});
		
		/* 이미지 파일 업로드 */
		function sendFile(file, el) { // summernote에서 이미지 업로드시 실행할 함수
			data = new FormData(); // 파일 전송을 위한 폼생성
			data.append("file", file);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data : data,
				type : "POST",
				url : "/faq/uploadSummernoteImageFile",
				cache : false,
				enctype : 'multipart/form-data',
				contentType : false,
				processData: false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url); // 게시판에 사진 업로드
				}
			});
		}
		
		function fn_checkByte(obj){
			maxByte = 4000; //최대 4000바이트
		    const text_val = obj //입력한 문자
		    const text_len = text_val.length; //입력한 문자수
		    
		    totalByte = 0; // 입력한 바이트수		    
		    for(let i=0; i<text_len; i++){
		    	const each_char = text_val.charAt(i);
		        const uni_char = escape(each_char) //유니코드 형식으로 변환
		        if(uni_char.length>4){
		        	// 한글 : 3Byte
		            totalByte += 3;
		        }else{
		        	// 영문,숫자,특수문자 : 1Byte
		            totalByte += 1;
		        }
		    }
		    
		    if(totalByte>maxByte){
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "red";
	        }else{
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "green";
	        }
	    }
		
		function fn_checkByte_update(obj){
			maxByte = 4000; //최대 4000바이트
		    const text_val = $(".note-editable").html(); //입력한 문자
		    const text_len = text_val.length; //입력한 문자수
		    
		    totalByte = 0; // 입력한 바이트수		    
		    for(let i=0; i<text_len; i++){
		    	const each_char = text_val.charAt(i);
		        const uni_char = escape(each_char) //유니코드 형식으로 변환
		        if(uni_char.length>4){
		        	// 한글 : 3Byte
		            totalByte += 3;
		        }else{
		        	// 영문,숫자,특수문자 : 1Byte
		            totalByte += 1;
		        }
		    }
		    
		    if(totalByte>maxByte){
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "red";
	        }else{
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "green";
	        }
	    }

	</script>
	</div>
</body>
</html>
<!--footer 시작 -->
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>