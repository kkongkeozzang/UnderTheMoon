<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 화면 분할비  -->

<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.btn {
    background-color: #406882 !important;
    border-color: #1A374D !important;
    border-top-color: rgb(26, 55, 77) !important;
    border-right-color: rgb(26, 55, 77) !important;
    border-bottom-color: rgb(26, 55, 77) !important;
    border-left-color: rgb(26, 55, 77) !important;
}
body {
   color: #999;
   background: #f3f3f3;
   font-family: 'Roboto', sans-serif;
}

.form-control {
   border-color: #eee;
   min-height: 41px;
   box-shadow: none !important;
}

.form-control:focus {
   border-color: #5cd3b4;
}

.form-control, .btn {
   border-radius: 3px;
}

.signup-form {
   width: 500px;
   margin: 0 auto;
   padding: 30px 0;
}

.signup-form h2 {
   color: #333;
   margin: 0 0 30px 0;
   display: inline-block;
   padding: 0 30px 10px 0;
   border-bottom: 3px solid #406882;
}

.signup-form form {
   color: #999;
   border-radius: 3px;
   margin-bottom: 15px;
   background: #fff;
   box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
   padding: 30px;
}

.signup-form .form-group row {
   margin-bottom: 20px;
}

.signup-form label {
   font-weight: normal;
   font-size: 14px;
   line-height: 2;
}

.signup-form input[type="checkbox"] {
   position: relative;
   top: 1px;
}

.signup-form .btn {
   font-size: 16px;
   font-weight: bold;
   background: #5cd3b4;
   border: none;
   margin-top: 20px;
   min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
   background: #41cba9;
   outline: none !important;
}

.signup-form a {
   color: #406882;
   text-decoration: underline;
}

.signup-form a:hover {
   text-decoration: none;
}

.signup-form form a {
   color: #406882;
   text-decoration: none;
}

.signup-form form a:hover {
   text-decoration: underline;
}

.signup-form{
	padding-top: 125px;
    padding-bottom: 25px;
}
</style>


<script>

 $(function(){
	
    $("#resetPassword").on("click",function(){
    	if($("#password").val()==$("#password2").val()){
       $.ajax({
    	  type: 'post',
          url:"/member/resetPasswordProc",
          data: {
        	  member_password:$("#password").val(),
              member_username:$("#member_username").val() 
          }
       }).done(function(resp){
         	alert("비밀번호가 변경되었습니다.");
         	document.location.href="/login";
       })
    	}else if(!($("#password").val()==$("#password2").val())){
    		alert("비밀번호가 일치하지 않습니다.");
    		 $("#password").val("");
             $("#password2").val("");
             $("#password").focus();
    	}
     })
 }) 
</script>
</head>
<body>

<!-- #userMenu 는 상단 로그인, 회원가입, 고객센터 메뉴-->
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>

   <div class="signup-form">
    <form action class="form-horizontal">
         <div class="row">
            <div class="col-8 offset-4">
               <h2 align="center">비밀번호 재설정 </h2>
               <input type="hidden" id="member_username" value="${member_username }" name="member_username">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-form-label col-4">비밀번호</label>
            <div class="col-8">
               <input type="password" id="password" class="form-control" name="member_password"
                  required="required">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-form-label col-4">비밀번호확인</label>
            <div class="col-8">
               <input type="password" id="password2" class="form-control" 
                  required="required">
            </div>
         </div>
         <div class="form-group row">
            <div class="col-8 offset-4">
               <button type="button" id="resetPassword" class="btn btn-primary btn-lg">비밀번호변경 </button>
            </div>
         </div>
        </form>
   </div>
   
   <!--footer 시작 -->
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>
</body>
</html>