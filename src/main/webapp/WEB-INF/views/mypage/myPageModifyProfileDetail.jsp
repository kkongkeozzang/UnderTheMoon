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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/signup/css/signup.css">
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>


   <div class="signup-form">
    <form action="/mypage/UpdateProfile" method="post" class="form-horizontal">
         <div class="row">
           <div class="col-12" align="center">
            <h2>회원정보 수정</h2>
         </div>   
         </div>         
        <div class="form-group row">
         <label class="col-form-label col-3">아이디*</label>
         <div class="col-6">
         		<input type="hidden" id="member-id" value="${memberDTO.member_id }">
                <input type="text" class="form-control" id="member-username" name="member_username" value="${memberDTO.member_username }" readonly>
               <div id="idCheckResult" class="idCondition"></div>
               <div id="idCheckResult2" class="idCondition"></div> <!-- 아이디 유효성 검사 필요 시 -->
            </div>
        </div>
      <div class="form-group row">
         <label class="col-form-label col-3">비밀번호*</label>
         <div class="col-7">
                <input type="password" class="form-control" id="member-password" name="member_password">
            <div id="pwCondition1" class="pwCondition">8자 - 16자 입력</div>
               <div id="pwCondition2" class="pwCondition">영문/숫자/특수문자를 반드시 포함</div>
            </div>        
        </div>
      <div class="form-group row">
         <label class="col-form-label col-3">비밀번호확인*</label>
         <div class="col-7">
                <input type="password" class="form-control" id="member-confirm-password" name="member_confirm_password">
                <div id="pwConfirm"></div>
            </div>           
        </div>
      <div class="form-group row">
         <label class="col-form-label col-3">이름*</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-name" name="member_name" value="${memberDTO.member_name }">
            </div>           
        </div>      
      <div class="form-group row">
         <label class="col-form-label col-3">이메일</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-email" name="member_email" value="${memberDTO.member_email}">
            </div>           
        </div> 
        <div class="form-group row">
         <label class="col-form-label col-3">생년월일*</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-birth-date" name="member_birth_date" value="${memberDTO.member_birth_date }" readonly>
               <div id="birthday-Condition1" class="birthday-Condition">YYYYMMDD 의 형식으로 입력</div>
               <div id="birthday-Condition2" class="birthday-Condition">만 19세 이상만 회원가입 가능</div>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">휴대폰*</label>
         <div class="col-5">
                <input type="text" class="form-control" id="member-phone" name="member_phone" value="${memberDTO.member_phone }"  placeholder="ex) 01012341234">
            </div>
             <div class="col-4">
               <button type="button" class="btn btn-primary" id="member-confirm-send">인증받기</button>
            </div>             
        </div>
         <div class="form-group row">
         <label class="col-form-label col-3">인증번호*</label>
         <div class="col-5">
                <input type="text" class="form-control" id="member-confirm-phone" name="member_confirm_phone">
            </div>
             <div class="col-4">
               <button type="button" class="btn btn-primary" id="member-confirm-check">인증확인</button>
            </div>             
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">우편번호*</label>
         <div class="col-5">
                <input type="text" class="form-control" id="postcode" name="member_zipcode" value="${memberDTO.member_zipcode }" readonly>
            </div>
            <div class="col-4">
               <button type="button" class="btn btn-primary" id="addressSearch">주소검색</button>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">상세주소1*</label>
         <div class="col-7">
                <input type="text" class="form-control" id="roadAddress" name="member_address1" value="${memberDTO.member_address1 }" readonly>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">상세주소2</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-address2" name="member_address2" value="${memberDTO.member_address2 }">
            </div>           
        </div>    
        <div class="form-group row">
         <label class="col-form-label col-10">* 는 필수 입력사항입니다.</label>
        </div>        
        <div class="form-group row" align="center">
         <div class="col-12">                      
            <button type="submit" id="submit" class="btn btn-primary btn-lg" >회원정보 수정</button>
            <button type="button" id="deleteMember" class="btn btn-primary btn-lg">회원 탈퇴</button>
         </div>  
      </div>            
    </form>
</div>


<script> 


   //아이디 유효성 검사, 중복 검사
   $("#member-username").on("input", function(){
      let regexId = /^[a-z]{1}[a-z\d]{5,13}$/;
      
      if(regexId){
         $("#idCheckResult2").css("color","blue");      
      }else{
         $("#idCheckResult2").css("color","red");      
      }
      
   })
   
      $(function(){
      $("#member-username").on("input",function(){
    	let regexId = /^[a-z]{1}[a-z\d]{5,13}$/;
  		let resultId = regexId.test($("#member-username").val());
  		if(resultId == false){
  				$("#idCheckResult").css("color","green");
  				$("#idCheckResult").text("아이디가 올바른 형식이 아닙니다.");
  		}else{
  			$.ajax({
  	            url:"member/idDuplCheck",
  	            data:{id:$("#member-username").val()}
  	         }).done(function(resp){
  	            if(resp == "1"){
  	               $("#idCheckResult").css("color","#F67280");
  	               $("#idCheckResult").text("이미 사용중인 ID입니다.");
  	            }else{
  	               $("#idCheckResult").css("color","#6998AB");
  	               $("#idCheckResult").text("사용 가능한 ID 입니다.");
  	            }       
  	         });
  		}
      })
   })
   
   
   //비밀번호 유효성 검사
   $("#member-password").on("click", function(){    //focus 시 입력 조건 띄우기
      $(".pwCondition").css("display","block");   
   })
   //$("#member-password").on("blur", function(){
   //   $(".pwCondition").css("display","none");   
   //})
      
   
   
   //입력값과 조건을 검사하기
   $("#member-password").on("input", function(){
      let regexPw1 = /^.{8,16}$/; //조건 1 : 최소 8자 최대 16자
      let regexPw2 = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{1,}$/; //조건 2 : 영문/숫자/특수문자 최소 한 자 반드시 포함

      let resultPw1 = regexPw1.test($("#member-password").val());
      let resultPw2 = regexPw2.test($("#member-password").val());

      if(resultPw1 && resultPw2 ){
          $("#pwCondition1").css("color","#6998AB");
          $("#pwCondition2").css("color","#6998AB");
       }else if(resultPw1 == false && resultPw2){
          $("#pwCondition1").css("color","#F67280");
          $("#pwCondition2").css("color","#6998AB");
       }else if(resultPw1 && resultPw2 == false){
          $("#pwCondition1").css("color","#6998AB");
          $("#pwCondition2").css("color","#F67280");
       }else{
          $("#pwCondition1").css("color","#F67280");
          $("#pwCondition2").css("color","#F67280");
       }
   })
   
	let resultChecknumber = false;
    let ifNumberCheck = false; 

   //필수 입력값 유효성 검사
   $("#submit").on("click",function(){
      let regexId = /^[a-z]{1}[a-z\d]{5,13}$/;
      let resultId = regexId.test($("#member-username").val());
         if(resultId == false){
             alert("아이디는 필수 입력사항입니다.")
             return false;
      }
         
      let regexPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
      let resultPw = regexPw.test($("#member-password").val());
         if(resultPw == false){
             alert("비밀번호는 필수 입력사항입니다.")
             return false;
         }
      
         if($("#member-password").val() != $("#member-confirm-password").val()){
             alert("비밀번호 확인을 진행 해주세요.")
              return false;
         }
      
      let regexName = /^[a-zA-Z가-힣]{1,8}$/
      let resultName = regexName.test($("#member-name").val());
         if(resultName == false){
               alert("이름이 올바른 형식이 아닙니다. 다시 확인해주세요.")
               return false;
              }
      
      let regexMail = /^[a-zA-Z\d]{1,15}@[a-z]{1,15}(.com)|(.net)|(.co.kr)$/;
 	  let resultMail = regexMail.test($("#member-email").val());
 			if(resultMail == false){
 			    alert("이메일을 다시 확인해주세요")
 			    return false;
 			}
       
      let regexPhone = /^010\d{4}\d{4}$/;
      let resultPhone = regexPhone.test($("#member-phone").val());
           if(resultPhone == false){
               alert("휴대폰 번호가 올바르지않은 형식입니다.")
               return false;
           }
      
      let regexAddress1 = /^[가-힣\d]{1,}/;
      let resultAddress1 = regexAddress1.test($("#roadAddress").val());
           if(resultAddress1 == false){
               alert("주소는 필수 입력사항입니다.")
               return false;
           }
      
       let regexChecknumber =  /\d{4}/;;
		   resultChecknumber = regexChecknumber.test($("#member-confirm-phone").val());
		     if(resultChecknumber == false){
		     alert("휴대폰 인증을 진행해주세요.")
		     return false;
		     }if(resultChecknumber == true){
		    	 if(ifNumberCheck == true){
		    		 
		    	 }else{
		    		 
		    	 alert("휴대폰 인증을 진행해주세요.")
		    	 return false;
		    	 }
		    	 
		     }
           
           
      let regexAddress2 = /^[가-힣\d]{1,}/;
      let resultAddress2 = regexAddress2.test($("#member-address2").val());
           if(resultAddress2 == false){
               alert("상세주소를 입력해주세요.")
               return false;
           }
   })
   
   document.getElementById("addressSearch").onclick = function(){
        new daum.Postcode({
            oncomplete: function(data) {                                 
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = data.roadAddress;                   
            }            
        }).open();
    }
   
   
  	 document.getElementById("member-confirm-password").oninput = function() {
       let pw1 = $("#member-password").val();
       let pw2 = $("#member-confirm-password").val();
       if (pw1 != pw2) {
          pwConfirm.innerHTML = "패스워드가 일치하지 않습니다."
          $("#pwConfirm").css("color","#F67280");
       } else if (pw1 ==""){
          pwConfirm.innerHTML = ""
       } else if (pw2 ==""){
          pwConfirm.innerHTML = ""
       }else  {
          pwConfirm.innerHTML = "패스워드가 일치합니다."
          $("#pwConfirm").css("color","#6998AB");
       }
    }
      
   //휴대폰 번호 인증 API 시작
   //생성된 인증번호를 저장할 전역변수 선언
   var confirmNumber ="";
   
 //인증확인 버튼을 누를 경우
   $(function(){
      $("#member-confirm-check").on("click", function(){   
         $.ajax({
            url:"/signup/confirmNumberProc",
            data:{number:$("#member-confirm-phone").val()}
         }).done(function(result){   
            if($("#member-confirm-phone").val() == confirmNumber){ //사용자가 입력한 인증번호와 생성된 인증번호를 비교
                  alert("휴대폰 인증에 성공했습니다.");
                  document.getElementById('member-phone').readOnly = true;
                  resultChecknumber = true;
                  ifNumberCheck = true
                  console.log("success"); 
            }else{
               console.log("fail");
               alert("인증번호를 다시 한 번 확인해주세요.");
               $('#member-confirm-phone').val('');
               $('#member-confirm-phone').focus();

            }})   
      })
   })   
   
   //인증받기 버튼을 누를경우
   $("#member-confirm-send").on("click", function(){
		let regexPhone = /^010\d{4}\d{4}$/;
		let resultPhone = regexPhone.test($("#member-phone").val());
		     if(resultPhone == false){
		         alert("인증번호 전송을 위해 휴대폰 번호를 올바르게 입력해주세요.");
	               $('#member-phone').val('');
	               $('#member-phone').focus();
		         return false;
		     }else{
		    	 $(function(){
		    		 $(document).ready(function(){
		    	         $.ajax({
		    	            url:"/signup/confirmPhoneProc",
		    	            data:{phone:$("#member-phone").val()}
		    	         }).done(function(randomNumber){
		    	            console.log(randomNumber); //인증번호 확인을 위한 코드 추후 삭제
		    	            confirmNumber = randomNumber; //생성된 인증번호를 비교하기 위해 가져온 뒤, 변수에 저장
		    	     	   alert("인증번호가 전송되었습니다. \n수신까지는 최대 1분이 소요될 수 있습니다.");
		    	            return true; })
		    	      })
		    	      }
		    	   )
		     }
	   
   })   
   
   $("#deleteMember").on("click",function(){
	   if(confirm("회원탈퇴를 하시겠습니까?")){
		   $.ajax({
			   type: 'post',
			   url:"/mypage/deleteMember",
			   data:{member_id:$("#member-id").val()}
		   }).done(function(result){
			   alert("저희 월하합작을 이용해주셔서 감사합니다.");
			   location.href="/"
		   })
	   }
   })    
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>