<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />
<link rel="stylesheet" href="/resources/mypage/css/mypage.css">	
<link rel="stylesheet" href="/resources/mypage/css/myPageReviewWrite.css">	
<script src="/resources/mypage/js/myPageReviewWrite.js"></script>

<style> 
html {
	font-size:16px !important;
}
#tableHead{
    background-color: #406882;
}
#navi .gnb_search {
    top: 16px !important;
}

/*버튼 관련 */

.myPageReviewWrite .btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  padding: 10px 16px;
}
  
.myPageReviewWrite .btn-lg {
  font-size: 18px;
  line-height: 1.33;
  border-radius: 6px;
}

.myPageReviewWrite .btn-primary {
  color: #fff;
  background-color: #1A374D;
  border-color: #1A374D;
}

.myPageReviewWrite .btn-primary:hover,
.myPageReviewWrite .btn-primary:focus,
.myPageReviewWrite .btn-primary:active,
.myPageReviewWrite .btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #1A374D;
  border-color: #1A374D;
}

/***********************
  SHARP BUTTONS
************************/
.sharp {
  border-radius:0;
}

/***********************
  CUSTON BTN VALUES
************************/

.myPageReviewWrite .btn {
  padding: 14px 24px;
  border: 0 none;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.myPageReviewWrite .btn:focus, .myPageReviewWrite .btn:active:focus, .myPageReviewWrite .btn.active:focus {
  outline: 0 none;
}

.myPageReviewWrite .btn-primary {
  background: #406882;
  color: #ffffff;
}
.myPageReviewWrite .btn-primary:hover, .myPageReviewWrite .btn-primary:focus, .myPageReviewWrite .btn-primary:active, .myPageReviewWrite .btn-primary.active, .open > .myPageReviewWrite .dropdown-toggle.btn-primary {
  background: #1A374D;
}
.myPageReviewWrite .btn-primary:active, .myPageReviewWrite .btn-primary.active {
  background: #1A374D;
  box-shadow: none;
}

.myPageReviewWrite textarea {
    width: 100%;
    height:auto;
    resize: none;
    border: 1px solid #ced4da;
    overflow:auto !important;
  }
  
#tableHead{
color:white;
}


</style>
<script>
$(function(){
	//업로드 할 파일명 리스트 생성
    let fileNames = new List();
    //드래그 기본 효과를 막음
    $(".fileDrop").on("dragenter dragover", function(event){
        event.preventDefault(); //기본효과를 막는다.
    });
    //기본효과를 막지 않으면 파일 업로드를 할 시에 사진이 실행되어버리기 때문에 기본효과를 막아야 한다.
    $(".fileDrop").on("drop",function(event){
        //drop이 될 때 기본 효과를 막음
        event.preventDefault();
        //첨부파일 배열
        var files=event.originalEvent.dataTransfer.files; //드래그된 파일정보를 files변수에 저장
        var file=files[0]; //첫번째 첨부파일 (컨트롤을 누르고 파일을 여러개를 올릴수도 있기 때문에, 첫번째 첨부파일이라고 지정한다.)
        
        //파일 크기 제한, 갯수 제한
        if(fileNames.length() < 8 ) {
        	if(file.size < 1024 * 1024 * 2) {
     			//ajax로 전달할 폼 객체
     	        var formData=new FormData(); //폼 객체
     	        formData.append("file",file); //만들어진 폼 객체에 위에서 저장한 file를 file이란 이름의 변수로 저장한다
     	        //서버에 파일 업로드(백그라운드에서 실행됨)
     	        //console.log(file);
     	        //    processData : false => post 방식
     	        //    contentType : false => multipart/form-data로 처리됨
     	        $.ajax({
     	            type: "post", 
     	            url: "/upload/uploadAjax", 
     	            data: formData, 
     	            dataType: "text",
     	            processData: false,
     	            contentType: false,
     	            success: function(data,status,req){
     	            	var str="";
     	            	if(checkImageType(data)){
     	            		fileNames.append(data); // 배열에 파일명 저장
     	            		str += "<div><img src='${path}/upload/displayFile?fileName="+data+"'>"; //이미지 파일일때는 이미지 자체를 보여준다.
     	            		str += "<span data-src="+data+">[삭제]</span></div>"; 
     		            	$(".uploadedList").append(str);
     	            	} else {
     	            		alert("img 형식의 파일만 업로드해주세요.");
     	            	}
     	            }
     	        });
     		} else {
     			alert("파일 크기는 2MB를 넘을 수 없습니다.");
     		}
        } else {
        	alert("사진은 8장 이상 등록할 수 없습니다.");
        }
 		
        
    });
    
    //fileDrop 함수
    //첨부파일 삭제 함수
    $(".uploadedList").on("click","span",function(event){
        var that=$(this); 
        $.ajax({
            url: "${path}/upload/deleteFile",
            type: "post",
            data: {fileName: $(this).attr("data-src")},
            dataType: "text",
            success: function(result){
                if(result=="deleted"){
                	fileNames.remove(that.attr("data-src"));
                    that.parent("div").remove();
                }
            }
        });
    });
    
    function getOriginalName(fileName){
        if(checkImageType(fileName)){ //이미지 파일이면 skip
            return;
        }
        
        var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름을 리턴함
        return fileName.substr(idx);
    }
    function getImageLink(fileName){
        if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
            return; //함수를 종료시킨다.
        }
        
        //    이미지 파일일 경우 연월일 경로와 s_를 제거해서 리턴시킨다.
        var front=fileName.substr(0,12);//연월일 경로
        var end=fileName.substr(14);// s_ 제거
        return front+end;
    }
    
    //이미지인지, 아닌지 체크해주는 메소드
    function checkImageType(fileName){
        // i : ignore case (대소문자 무관)
        var pattern = /jpg|png|jpeg/i; //정규표현식(i는 대소문자 무시하기 때문에 넣은것.) 
        return fileName.match(pattern); //규칙에 맞으면 true
        //그러니까 파일의 확장명을 검사해서 jpg,png,jpeg형식이 있으면 fileName과 매칭해서 true를 리턴한다.
    }
	$("#write-review-btn").on("click",function(){
		if($("#md_review_title").val()=="") {
			alert("제목을 입력해주세요.");
		} else if($("#md_review_content").val()=="") {
			alert("내용을 입력해주세요.");
		} else {
			$.ajax({
				url:"/md/detail/review/rest/write",
				type:"post",
				dataType:"json",
				data:{
					md_id:$("#md_id").val(),
					md_review_title:$("#md_review_title").val(),
					md_review_content:$("#md_review_content").val().replace(/\n/g, "<br>"),
					purchase_detail_id:$("#purchase_detail_id").val()
				}
			}).done(function(resp){
				//resp : md_review_id
				if(fileNames.length()!=0){
					$.ajax({
						   url:"/upload/fileNames",
						   type:"post",
						   data: {
							   fileNames:(fileNames.dataStore).join(),
							   md_id: $("#md_id").val(),
							   md_review_id: resp
							   },
						   dataType: "json"
					   })
				}
			   location.href="/mypage/myPageAfterMdReview?cPage=1";
			})
			
		}
		   
	})
});

</script>

</head>

<body>


	<div class="container myPageReviewWrite">
        <div class="row">
            <div class="col-12">
                <div class="card">
					<jsp:include page="myPageNavBar.jsp" flush="false" />  

        
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="myPageSideBar.jsp" flush="false" />
				</div>
			</div>

			<div class="col-12 col-md-8 col-lg-9">
				<div class="card">
					<div class="card-body">						


 
        <div class="container">
       <div class="row">
       <div class="col-sm-12 text-center" >
       <div class="col-sm-12"></div>
        
       <div class="col-sm-12">
       <div id="md-box">
           <div id="md-img-box">
           		<div id="img-box2">
           			<img src="/mdImage/${md[0].md_image }">
           		</div>
           </div>
           <span>${md[0].md_name }</span>
       </div>
       <form action="/md/detail/review/write" method="post">
           <table class="table table-boardered">
               <tr>
                   <th id="tableHead">제목</th>
                   <td><input type="text" maxlength="30" class="form-control" id="md_review_title" name="md_review_title" placeholder="제목을 입력해주세요.">
                    </td>        
               </tr>
                
               <tr>
                <th id="tableHead">후기 작성</th>
                <td>
                 <textarea rows="10" cols="40" wrap="hard" maxlength="1000" id="md_review_content" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며,&#13;&#10;오해 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다.&#13;&#10;※상품 후기는 수정이 불가하니 신중하게 작성해주세요." name="md_review_content" class="form-control"></textarea>
                </td>     
            </tr>
                

              <tr>
                  <th id="tableHead">사진등록</th>
                  <td>
						<!-- 파일을 업로드할 영역 -->
						<div class="fileDrop"> 
						
						<span>등록할 사진을 이곳에 넣어주세요</span>
						<span>최대 8장, 2MB 이하</span>
						
						</div>
						<!-- 업로드된 파일 목록을 출력할 영역 -->
						<div class="uploadedList"></div>
        </td>
        </tr>
               <tr>
                   <td colspan="2">
                   <input type="button" id="write-review-btn" class="btn btn-primary sharp" value="등록하기">
                   <input type="hidden" name="md_id" id="md_id" value="${md[0].md_id }">
                   <input type="hidden" name="purchase_detail_id" id="purchase_detail_id" value="${d_purchase_detail_id}">
                   </td>
               </tr>
           </table>
       </form>
                   
       
       </div>
        
       </div>
       </div>
   </div>




					</div>
				</div>
			</div>
		</div>
	</div>
	</div>                      
	
	
	</div>
<script>
	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	});
	
	$("#sms_yn").change(function(){
		
		if($("#sms_yn").is(":checked")){
			console.log("성공");
		}
	})




</script>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>