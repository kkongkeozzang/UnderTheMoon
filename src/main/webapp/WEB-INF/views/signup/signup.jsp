<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
			<label class="col-form-label col-3">아이디</label>
			<div class="col-6">
                <input type="text" class="form-control" id="member_username" name="member_username">
            </div>
     		<div class="col-3">
     		 	<span id="idCheckResult"></span>
     		</div>
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">비밀번호</label>
			<div class="col-7">
                <input type="password" class="form-control" id="member_password" name="member_password">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">비밀번호확인</label>
			<div class="col-7">
                <input type="password" class="form-control" id="member_confirm_password" name="member_confirm_password">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">이름</label>
			<div class="col-7">
                <input type="text" class="form-control" id="member_name" name="member_name">
            </div>        	
        </div>		
		<div class="form-group row">
			<label class="col-form-label col-3">이메일</label>
			<div class="col-7">
                <input type="text" class="form-control" id="member_email" name="member_email">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">생년월일</label>
			<div class="col-7">
                <input type="text" class="form-control" id="member_birth_date" name="member_birth_date">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">휴대폰</label>
			<div class="col-5">
                <input type="text" class="form-control" id="member_phone" name="member_phone">
            </div>
             <div class="col-4">
            	<button type="button" class="btn btn-primary">인증받기</button>
            </div>          	
        </div>
         <div class="form-group row">
			<label class="col-form-label col-3">인증번호</label>
			<div class="col-5">
                <input type="text" class="form-control" id="member_confirm_phone" name="member_confirm_phone">
            </div>
             <div class="col-4">
            	<button type="button" class="btn btn-primary">인증확인</button>
            </div>          	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">우편번호</label>
			<div class="col-5">
                <input type="text" class="form-control" id="postcode" name="member_zipcode" readonly>
            </div>
            <div class="col-4">
            	<button type="button" class="btn btn-primary" id="addressSearch">주소검색</button>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">상세주소1</label>
			<div class="col-7">
                <input type="text" class="form-control" id="roadAddress" name="member_address1" readonly>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">상세주소2</label>
			<div class="col-7">
                <input type="text" class="form-control" id="member_address2" name="member_address2">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">추천인</label>
			<div class="col-7">
                <input type="text" class="form-control" id="member_id" name="member_id">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">이벤트</label>
			<div class="col-7">
                <input type="text" class="form-control" id="event" name="event">
            </div>        	
        </div>
        <div class="form-group row">
			<div class="col-8 offset-4">
				<p><label class="form-check-label"><input type="checkbox"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
				<button type="submit" id="submit" class="btn btn-primary btn-lg">가입하기</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">Already have an account? <a href="#">Login here</a></div>
</div>

<script>
	$("#submit").on("click",function(){
		let regexId = /^[a-z]{1}[a-z\d]{5,13}$/;
		let resultId = regexId.test($("#member_username").val());
			if(resultId == false){
    			alert("아이디 형식이 올바르지 않습니다. 다시 확인해주세요")
    			return false;
		}
			
		let regexPw = /^[a-zA-Z\d]{8,16}$/;
		let resultPw = regexPw.test($("#member_password").val());
			if(resultPw == false){
			    alert("비밀번호 형식이 올바르지않습니다.")
			    return false;
			}
		
			if($("#member_password").val() != $("#member_confirm_password").val()){
				 alert("비밀번호를 다시 확인 해주세요")
			     return false;
			}
		
		let regexName = /^[a-zA-Z가-힣]{1,8}$/
		let resultName = regexName.test($("#member_name").val());
			if(resultName == false){
			      alert("이름이 올바른 형식이 아닙니다. 다시 확인해주세요.")
			      return false;
			     }
		
		let regexMail = /^[a-zA-Z\d]{1,}@[a-z]{1,}.com$/;
		let resultMail = regexMail.test($("#member_email").val());
			if(resultMail == false){
			    alert("이메일을 다시 확인해주세요")
			    return false;
			}
			
		let regexBirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/
		let resultBirth = regexBirth.test($("#member_birth_date").val());
		     if(resultBirth == false){
		         alert("생년월일이 올바른 형식이 아닙니다.")
		         return false;
		     }
		 
		let regexPhone = /^010\d{4}\d{4}$/;
		let resultPhone = regexPhone.test($("#member_phone").val());
		     if(resultPhone == false){
		         alert("휴대폰 번호가 올바르지않은 형식입니다.")
		         return false;
		     }
		
		let regexAddress1 = /^[가-힣\d]{1,}/;
		let resultAddress1 = regexAddress1.test($("#roadAddress").val());
		     if(resultAddress1 == false){
		         alert("주소를 입력해주세요.")
		         return false;
		     }
		
		let regexAddress2 = /^[가-힣\d]{1,}/;
		let resultAddress2 = regexAddress2.test($("#member_address2").val());
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
	
	$(function(){
		$("#member_username").on("blur",function(){
			$.ajax({
				url:"member/idDuplCheck",
				data:{id:$("#member_username").val()}
			}).done(function(resp){
				if(resp == "1"){
					$("#idCheckResult").css("color","red");
					$("#idCheckResult").text("이미 사용중인 ID입니다.");
					$("#member_username").val("");
					$("#member_username").focus();
				}else{
					$("#idCheckResult").css("color","green");
					$("#idCheckResult").text("사용 가능한 ID 입니다.");
				}
			});
		})
	})
	
	document.getElementById("member_confirm_phone").oninput = function() {
	      let pw1 = $("#member_password").val();
	      let pw2 = $("#member_confirm_phone").val();
	      if (pw1 != pw2) {
	         result.innerHTML = "패스워드가 일치하지않습니다"

	      }else if (pw1 ==""){
	         result.innerHTML = ""
	      } else if (pw2 ==""){
	         result.innerHTML = ""
	      }else {
	         result.innerHTML = "패스워드가 일치합니다."
	      }
	   }
	
	   document.getElementById("member_password").oninput = function() {
	      let pw1 = $("#member_password").val();
	      let pw2 = $("#member_confirm_phone").val();
	      if (pw1 != pw2) {
	         result.innerHTML = "패스워드가 일치하지않습니다"

	      } else if (pw1 ==""){
	         result.innerHTML = ""
	      } else if (pw2 ==""){
	         result.innerHTML = ""
	      }else  {
	         result.innerHTML = "패스워드가 일치합니다."
	      }
	   }
</script>
</body>
</html>