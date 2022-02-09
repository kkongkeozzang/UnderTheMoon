<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="/resources/qna/css/qnaWrite.css">


</head>

<body>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>

	<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
					<jsp:include page="../mypage/myPageNavBar.jsp" flush="false" />    
     
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="../mypage/myPageSideBar.jsp" flush="false" />
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
       <h2>1:1 문의</h2>
       <form action="/qna/writeProc" method="post" enctype="multipart/form-data">
           <table class="table table-boardered">
               <tr>
                   <th id="tableHead">제목</th>
                   <td>
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="qa_question_category" id="qa_question_category">
                        <option value="기타" selected>기타문의</option>
                        <option value="배송지연/불만">배송지연/불만</option>
                        <option value="이벤트문의">이벤트문의</option>
                        <option value="상품제안">상품제안</option>
                      </select>
                      <input type="hidden" name=member_id value=${member_id}> 
                      <input type="text" class="form-control" name="qa_question_title" id="qa_question_title" placeholder="제목을 입력해주세요.">
                    </td>        
               </tr>
                
               <tr>
                   <th id="tableHead">문자메세지</th> <!--placeholder에 사용자 휴대폰 번호 띄우기-->
                   <td>
                       <input readonly type="text" class="form-control"  placeholder="${memberDTO.member_phone }">
                       <input type="checkbox"   id="sms_yn" value="Y">답변 수신을 문자메세지로 받겠습니다. &nbsp;&nbsp;
                    </td>        
               </tr>


               <tr>
                <th id="tableHead">내용</th>
                <td>
                <div>
                    1:1 문의 작성 전 확인해 주세요!<br><br>
                    
                    반품/환불<br>
                    - 제품 하자 혹은 이상으로 반품 및 환불이 필요한 경우 구체적인 내용을 남겨주세요. <br><br>

                    배송<br>
                    - 배송 및 배송시간 지정은 불가능합니다.<br>
                    
                </div>
                 <textarea  rows="5" cols="40" name="qa_question_content" id="qa_question_content" class="form-control"></textarea>
                </td>     
            </tr>
                

               <tr>
                   <td colspan="2">
                   <button type="submit" id="submit" class="btn btn-primary sharp">입력</button>
                   <button type="reset" id="btn-cancleQna"  class="btn btn-danger sharp">취소</button>
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
	
	
	//휴대폰 인증 API 관련
	$("#sms_yn").change(function(){
		
		if($("#sms_yn").is(":checked")){
			console.log("성공");
		}
	});
	
	//공백 유효성 검사
	$("#submit").on("click",function(){
		console.log($("#qa_question_title").val().trim());
			if($("#qa_question_title").val().trim() == "")
			{
				console.log($("#qa_question_title").val().trim());
				console.log($("#qa_question_content").val().trim());

    			alert("제목은 필수 입력사항입니다.");
    			$("#qa_question_title").focus();
    			return false;
    		}

			if($("#qa_question_content").val().trim() == ""){
				console.log($("#qa_question_content").val().trim());
    			alert("글 내용을 작성해 주세요.");
    			$("#qa_question_content").focus();
    			return false;

    			}
			


    	

    			
		});
			
	





</script>
</div>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>

</body>
</html>