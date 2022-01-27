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


<style> 

#tableHead{
    background-color: #406882;
}


/*버튼 관련 */

.btn {
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
  
.btn-lg {
  font-size: 18px;
  line-height: 1.33;
  border-radius: 6px;
}

.btn-primary {
  color: #fff;
  background-color: #1A374D;
  border-color: #1A374D;
}

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
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

.btn {
  padding: 14px 24px;
  border: 0 none;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.btn:focus, .btn:active:focus, .btn.active:focus {
  outline: 0 none;
}

.btn-primary {
  background: #406882;
  color: #ffffff;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary {
  background: #1A374D;
}
.btn-primary:active, .btn-primary.active {
  background: #1A374D;
  box-shadow: none;
}

textarea {
    width: 100%;
    height: 6.25em;
    border: none;
    resize: none;
  }
  
#tableHead{
color:white;
}


</style>


</head>

<body>
	<div class="container">
	<div class="row" id="header">
		</div>
        <div class="row">
            <div class="col-12">
                <div class="card">
					<div class="card-body">
						<div class="row mt-3">
							<div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
                                                <h6 class="detail-title-one">${memberDTO.member_username }회원님</h6>
												<button type="button" class="btn btn-light" id="all-grade">나의등급 보기</button>
												<input type="hidden" name="member_id" value="${memberDTO.member_id }">
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">

											<div class="detail">
												<h6 class="detail-title"><a href="">적립금 ></a></h6>
												<p class="detail-detail"><span>~원</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">											
											<div class="detail">
												<h6 class="detail-title"><a href="">쿠폰 ></a></h6>
												<p class="detail-detail"><span>~개</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <div class="col-12 col-lg-3">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">										
											<div class="detail">
												<h6 class="detail-title"><a href="">1:1문의 ></a></h6>
												<p class="detail-detail"><span>도움이 필요하신가요?</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
            			</div>            
            		</div>    

        
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<div class="card-body">
						<div class="d-grid"></div>
						<h5 class="my-3">My Page</h5>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="" class="list-group-item py-1"><span>주문 내역</span></a> 													
								<a href="" class="list-group-item py-1"><span>찜한 상품</span></a>
								<a href="" class="list-group-item py-1"><span>배송지 관리</span></a>
								<a href="" class="list-group-item py-1"><span>적립금</span></a>
                                <a href="" class="list-group-item py-1"><span>쿠폰</span></a>
                                <a href="" class="list-group-item py-1"><span>상품 문의</span></a>
                                <a href="" class="list-group-item py-1"><span>상품 후기</span></a>
                                <a href="" class="list-group-item py-1"><span>개인정보 수정</span></a>
                                <br>
                                <br>
								<a href="/qna/qnaList" class="list-group-item py-1"><span>도움이 필요하신가요?<br>1:1 문의하기</span></a>
							</div>
						</div>
					</div>
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
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="qa_question_category">
                        <option selected>문의 종류를 선택해주세요.</option>
                        <option value="배송지연/불만">배송지연/불만</option>
                        <option value="이벤트문의">이벤트문의</option>
                        <option value="상품제안">상품제안</option>
                        <option value="기타">기타문의</option>
                      </select>
                      <input type="hidden" name=member_id value=${member_id}> 
                      <input type="text" class="form-control" name="qa_question_title" placeholder="제목을 입력해주세요.">
                    </td>        
               </tr>
                
               <tr>
                   <th id="tableHead">문자메세지</th> <!--placeholder에 사용자 휴대폰 번호 띄우기-->
                   <td>
                       <input readonly type="text" class="form-control" name="" placeholder="${memberDTO.member_phone }">
                       <input type="checkbox"  name="qa_question_sms_yn" id="sms_yn" value="Y">답변 수신을 문자메세지로 받겠습니다. &nbsp;&nbsp;
                    </td>        
               </tr>


               <tr>
                <th id="tableHead">내용</th>
                <td>
                <div>
                    1:1 문의 작성 전 확인해 주세요!<br><br>
                    
                    반품/환불<br>
                    - 제품 하자 혹은 이상으로 반품 및 환불이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요. <br><br>

                    배송<br>
                    - 배송 및 배송시간 지정은 불가능합니다.<br>
                    
                </div>
                 <textarea rows="5" cols="40" name="qa_question_content" class="form-control"></textarea>
                </td>     
            </tr>
                

              <tr>
                  <th id="tableHead">이미지</th>
                  <td>
                      <input type="file" name="file" class="form-control" id="customFile" />
                      <label class="form-label" for="customFile">file 업로드 조건</label>
        </td>
        </tr>
               <tr>
                   <td colspan="2">
                   <input type="submit" class="btn btn-primary sharp" value="전송">
                   <input type="reset" class="btn btn-danger sharp" value="취소">
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