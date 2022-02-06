<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
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
<link rel="stylesheet" href="/resources/notice/css/noticeDetail.css">
</head>
<body>
	<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
	
	
	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div class="row">
			<!-- 사이드네비 -->
			<div class="col-0 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="/WEB-INF/views/event/navi.jsp"></jsp:include>	
				</div>
			</div>
			<!-- 게시판 박스 -->
			<div class="col-12 col-md-8 col-lg-9">
				<div id="board-title">
					<h2 class="title">공지사항<span class="title-sub">월하합작의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
				</div>
		
				<!-- 게시판 박스 -->
				<div class="card mb-3 col-xl-6 col-md-12">
					<!-- 게시글 등록 박스 -->
					<form action="/notice/insert" method="post" id="frm">
						<div class="container mb-4 mt-4">
							<div class="row" style="padding-bottom: 5px;">
								<div class="col-sm-12">
									<input type="hidden" name=member_id value=${member_id}> 
									<input type=text id=input-title name=notice_title placeholder="제목을 작성하세요 (최대 30자)" style="width: 100%;" maxlength=30>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<textarea name="notice_content" id="summernote"
										style="min-height: 200px; overflow: auto" onkeyup="fn_checkByte(this)"></textarea>
									<script>
		                				autosize($("textarea"));
		        			        </script>
		        			<sup>(<span id="nowByte">0</span>/4000bytes)</sup>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12" style="text-align: right">
									<button type="button" id="board-list" class="btn btn-dark">목록으로</button>
									<button class="btn btn-dark" type=button id="write">작성하기</button>
									<script>
							$("#board-list").on("click",function(){
								location.href="javascript:history.back()";
							})
							
							$("#write").on("click",function(){
								if($('.note-editable').html()==""){
									alert("내용을 입력해주세요.");
								}else if(totalByte <= 11){
									alert("바이트 수를 확인해주세요.(최소 12bytes)");
								}else if(totalByte > maxByte){
									alert("바이트 수를 확인해주세요.(최대 4000bytes)");
								}else if($("#input-title").val()==""){
									alert("제목을 입력해주세요.");
								}else {
									if(confirm("이대로 입력하시겠습니까?")){
										$("#frm").submit();										
									}
								}
							})
						</script>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
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
				url : "/notice/uploadSummernoteImageFile",
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
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>