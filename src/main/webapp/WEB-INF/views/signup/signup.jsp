<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <form action="/member/signup" method="post" class="form-horizontal">
         <div class="row">
           <div class="col-8 offset-4">
            <h2>회원가입</h2>
         </div>   
         </div>         
        <div class="form-group row">
         <label class="col-form-label col-3">아이디*</label>
         <div class="col-6">
                <input type="text" class="form-control" id="member-username" name="member_username">
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
                <input type="text" class="form-control" id="member-name" name="member_name">
            </div>           
        </div>      
      <div class="form-group row">
         <label class="col-form-label col-3">이메일</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-email" name="member_email">
            </div>           
        </div> 
        <div class="form-group row">
         <label class="col-form-label col-3">생년월일*</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-birth-date" name="member_birth_date">
               <div id="birthday-Condition1" class="birthday-Condition">YYYYMMDD 의 형식으로 입력</div>
               <div id="birthday-Condition2" class="birthday-Condition">만 19세 이상만 회원가입 가능</div>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">휴대폰*</label>
         <div class="col-5">
                <input type="text" class="form-control" id="member-phone" name="member_phone">
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
                <input type="text" class="form-control" id="postcode" name="member_zipcode" readonly>
            </div>
            <div class="col-4">
               <button type="button" class="btn btn-primary" id="addressSearch">주소검색</button>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">상세주소1*</label>
         <div class="col-7">
                <input type="text" class="form-control" id="roadAddress" name="member_address1" readonly>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">상세주소2</label>
         <div class="col-7">
                <input type="text" class="form-control" id="member-address2" name="member_address2">
            </div>           
        </div>
      <div class="form-group row">
         <label class="col-form-label col-3">추천인</label>
         <div class="col-5">
                <input type="text" class="form-control" id="recommend-id" name="recommend_id">
            </div>
            <div class="col-4">
               <button type="button" class="btn btn-primary" id="recommend-member-check">추천인확인</button>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-3">이벤트</label>
         <div class="col-5">
                <input type="text" class="form-control" id="event" name="event">
            </div>
            <div class="col-4">
               <button type="button" class="btn btn-primary" id="event-check">이벤트확인</button>
            </div>           
        </div>
        <div class="form-group row">
         <label class="col-form-label col-10">* 는 필수 입력사항입니다.</label>
        </div>        
        <div class="form-group row">
         <div class="col-8 offset-4">
            <p><label class="form-check-label"><input type="checkbox"> <a href="#popup1"> 개인정보 활용 동의서</a> 에 동의합니다.</label></p>
            <button type="submit" id="submit" class="btn btn-primary btn-lg">가입하기</button>
         </div>  
      </div>            
    </form>
   <div class="text-center">이미 계정이 있으신가요? <a href="login">로그인 하러 가기</a></div>
</div>
<div id="popup1" class="overlay">
   <div class="popup">
      <h2>이용약관</h2>
      <a class="close" href="javascript:history.back()">&times;</a>
      <div class="content">
         제1조(목적)<br>
         이 약관은 월하합작(전자상거래 사업자)가 운영하는<br>
         인터넷사이트 월하합작에서 제공하는 전자상거래 관련 서비스를<br> 
         이용함에 있어 월하합작과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.<br>
         <br>
         제2조(정의)<br>
         ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 
         설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
          ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
           ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
          ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.                               
      </div>
   </div>
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
         $.ajax({
            url:"member/idDuplCheck",
            data:{id:$("#member-username").val()}
         }).done(function(resp){
            if(resp == "1"){
               $("#idCheckResult").css("color","red");
               $("#idCheckResult").text("이미 사용중인 ID입니다.");
               $("#member-username").val("");
               $("#member-username").focus();
            }else{
               $("#idCheckResult").css("color","green");
               $("#idCheckResult").text("사용 가능한 ID 입니다.");
            }
         });
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
         $("#pwCondition1").css("color","blue");
         $("#pwCondition2").css("color","blue");
      }else if(resultPw1 == false && resultPw2){
         $("#pwCondition1").css("color","red");
         $("#pwCondition2").css("color","blue");
      }else if(resultPw1 && resultPw2 == false){
         $("#pwCondition1").css("color","blue");
         $("#pwCondition2").css("color","red");
      }else{
         $("#pwCondition1").css("color","red");
         $("#pwCondition2").css("color","red");
      }
   })
   
   
   //생년월일 유효성 검사
      let today = new Date(); 
      let yearNow = today.getFullYear(); 
      let adultYear = yearNow - 20; 
      let resultBirthday2 = true;

   
   $("#member-birth-date").on("input", function(){
      let regexBirthday1 = /^[0-9]{0,8}$/; //조건1  : yyyymmdd
      let regexBirthday2; //조건2  : 만 19세 이상 회원가입
      
      let resultBirthday1 = regexBirthday1.test($("#member-birth-date").val());

   
      let memberYear = $("#member-birth-date").val();
      let year = memberYear.substr(0,4);
      console.log(year);

      
      if(year > adultYear){
         resultBirthday2 = false;
      }else{
         resultBirthday2 = true;
      }

      if(resultBirthday1 && resultBirthday2 ){
         $("#birthday-Condition1").css("color","blue");
         $("#birthday-Condition2").css("color","blue");
      }else if(resultBirthday1 == false && resultBirthday2){
         $("#birthday-Condition1").css("color","red");
         $("#birthday-Condition2").css("color","blue");
      }else if(resultBirthday1 && resultBirthday2 == false){
         $("#birthday-Condition1").css("color","blue");
         $("#birthday-Condition2").css("color","red");
      }else{
         $("#birthday-Condition1").css("color","red");
         $("#birthday-Condition2").css("color","red");
      }
      
   })
   


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
		
		let regexMail = /^[a-zA-Z\d]{1,}@[a-z]{1,}.com$/;
		let resultMail = regexMail.test($("#member-email").val());
			if(resultMail == false){
			    alert("이메일을 다시 확인해주세요")
			    return false;
			}
			
		let regexBirth = ""
		let resultBirth = regexBirth.test($("#member-birth-date").val());
		     if(resultBirth == true){
		         alert("생년월일이 올바른 형식이 아닙니다.")
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
         } else if (pw1 ==""){
            pwConfirm.innerHTML = ""
         } else if (pw2 ==""){
            pwConfirm.innerHTML = ""
         }else  {
            pwConfirm.innerHTML = "패스워드가 일치합니다."
         }
      }
      
   //휴대폰 번호 인증 API 시작
   //생성된 인증번호를 저장할 전역변수 선언
   var confirmNumber ="";
   
   $(function(){
      $("#member-confirm-send").on("click",function(){
         $.ajax({
            url:"signup/confirmPhoneProc",
            data:{phone:$("#member-phone").val()}
         }).done(function(randomNumber){
            console.log(randomNumber); //인증번호 확인을 위한 코드 추후 삭제
            confirmNumber = randomNumber; //생성된 인증번호를 비교하기 위해 가져온 뒤, 변수에 저장
         })
      })
      }
   )
   
   
   $(function(){
      $("#member-confirm-check").on("click", function(){   
         $.ajax({
            url:"signup/confirmNumberProc",
            data:{number:$("#member-confirm-phone").val()}
         }).done(function(result){   
            if($("#member-confirm-phone").val() == confirmNumber){ //사용자가 입력한 인증번호와 생성된 인증번호를 비교
                  alert("휴대폰 인증에 성공했습니다.");
               console.log("성공"); 
            }else{
               console.log("f");
            }})   
      })
   })   
   
   //추천인 입력 시 포인트 적립
   $(function(){
      $("#recommend-member-check").on("click",function(){
         $.ajax({
            url:"member/idDuplCheck",
            data:{id:$("#recommend-id").val()}
         }).done(function(resp){
            if(resp == "1"){
               if(confirm("추천인으로 입력 가능한 아이디입니다. 입력하시겠습니까? (확인 시 변경 불가능)"))
                  $("#recommend-id").attr("readonly",true);
            }else{
               alert("존재하지않는 아이디입니다.")
            }
         });
      })
   })
   
   //이벤트 입력 시 포인트 적립
   $("#event-check").on("click",function(){
      if($("#event").val() == "월하합작"){
         alert("이벤트 정답입니다!")
         $("#event").attr("readonly",true);
      }else{
         alert("이벤트 정답이 아닙니다. 현재 진행중인 이벤트를 확인해주세요.")
      }

   })
     
</script>
</body>
</html>