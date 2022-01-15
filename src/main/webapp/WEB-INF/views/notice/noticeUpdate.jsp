<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	width: 1000px;
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

	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div id="board-title">
			<!-- <img id="title" src="/resources/board/image/title.png"> -->
			<span><h3>공지사항</h3></span>
		</div>
		<br>

		<!-- 게시판 박스 -->
		<div class="card mb-3 col-xl-6 col-md-12">
			<!-- 게시글 등록 박스 -->
			<form action="/notice/update" method="post" id="frmDetail">
				<div class="container mb-4 mt-4">
					<div class="row" style="padding-bottom: 5px;">
						<div class="col-sm-12"> 
							<input type="hidden" value="${dto.member_id}" name="member_id">
							<input type="hidden" value="${dto.notice_id}" name="notice_id">
							<input type=text id=input-title name=notice_title placeholder="제목을 작성하세요" style="width: 100%;" value='${dto.notice_title }'>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<textarea name="notice_content" id="summernote"
								style="min-height: 200px; overflow: auto" maxlength="1000">${dto.notice_content }</textarea>
							<script>
                				autosize($("textarea"));
        			        </script>
                	<div class="contentCnt">(0 / 1000)</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="text-align: right">
							<button type="button" id="update" class="btn btn-dark"
								style="background-color: rgb(255, 111, 97);">수정완료</button>
							<button class="btn btn-dark" type=button id="cancel"
								style="background-color: rgb(255, 111, 97);">취소</button>
					<script>
					
					$("#cancel").on("click",function(){
						if(confirm("정말 취소하시겠습니까?")){
							location.href="/notice/detail?notice_id=${dto.notice_id}";
						}
					});
					
					$("#update").on("click",function(){
						if($('.note-editable').html()==""){
							alert("내용을 입력해주세요.");
						}else if(textCnt > 1000){
							alert("글자 수를 확인해주세요.(최대 1000자)");
						}else if($("#input-title").val()==""){
							alert("제목을 입력해주세요.");
						}else {
							if(confirm("이대로 수정하시겠습니까?")){
								$("#frmDetail").submit();
							}				
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
			  height: 535, // 에디터 높이
			  disableResizeEditor: true, // 에디터 사이즈 조절 금지
			  lang: "ko-KR", // 에디터 한글 설정
			  placeholder: '내용을 입력하세요',	//placeholder 설정
			  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload: function(files, editor, welEditable) {
					  for(var i = files.length - 1; i>=0; i--) {
						  sendFile(files[i], this);}  
					},
					onChange:function(contents, editable){ //텍스트 글자수 및 이미지등록개수
						setContentsLength(contents, 0);
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
		var textCnt = 0; //총 글자수
		//글자수 체크 //태그와 줄바꿈, 공백을 제거하고 텍스트 글자수만 가져옵니다.		
		function setContentsLength(str, index) {
			
			var maxCnt = 1000; //최대 글자수
			var editorText = f_SkipTags_html(str); //에디터에서 태그를 삭제하고 내용만 가져오기
			editorText = editorText.replace(/\s/gi,""); //줄바꿈 제거
			/* editorText = editorText.replace(/&nbsp;/gi, ""); //공백제거 */
			
			textCnt = editorText.length; // 줄바꿈, 공백제거한 현재 글자 수
			if(maxCnt > 0) {
				$(document).ready(function() { //글 1000글자 입력 제한 코드
		 		    $('.note-editable').on('keyup', function() { //글 1000글자 입력 제한 코드
		 		        $('.contentCnt').html("(" + textCnt +" / 1000)");  // 현재 글자 수 표시
		 		    });
		 		});
			}
		}
		
		//태그제거용
		function f_SkipTags_html(input, allowed) {
			allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
			var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
			commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
			return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
				return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
			});
		}
		
		//참고 코드
// 		$(document).ready(function() { //글 1000글자 입력 제한 코드
// 		    $('.note-editable > p').on('keyup', function() { //글 1000글자 입력 제한 코드
// 		        $('.contentCnt').html("(" + $(this).val().length +" / 1000)");
// 		        if($(this).val().length > 1000) {
// 		            $(this).val($(this).val().substring(0, 1000));
// 		            $('.contentCnt').html("(1000 / 1000)");
// 		        }
//				if(textCnt > 1000) {
// 		 			$('.note-editable').html(editorText.substring(0, 1000));
// 		 		    $('.contentCnt').html("(1000 / 1000)");
// 		 		}
// 		    });
// 		});

	</script>
	</div>
</body>
</html>