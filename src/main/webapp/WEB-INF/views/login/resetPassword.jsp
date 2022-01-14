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
<title>Bootstrap Sign up Form Horizontal</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 화면 분할비  -->
<title>Insert title here</title>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
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
   border-bottom: 3px solid #5cd3b4;
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
   color: #5cd3b4;
   text-decoration: underline;
}

.signup-form a:hover {
   text-decoration: none;
}

.signup-form form a {
   color: #5cd3b4;
   text-decoration: none;
}

.signup-form form a:hover {
   text-decoration: underline;
}
</style>
<script>

$(function(){
	
    $("#findUsername").on("click",function(){
       $.ajax({
    	  type: 'get',
          url:"/member/findUsernameProc",
          data: {
        	  member_email:$("#email").val(),
              member_name:$("#name").val() 
          }
         
       }).done(function(resp){
           console.log("success" + resp);
           $("#findUsername").css("color","grey");
           $("#findUsername").text("귀하의 아이디는 "+resp+"입니다.");
       }).fail(function(error){
    	   $("#findUsername").css("color","pink");
           $("#findUsername").text("존재하지 않는 아이디입니다.");
           $("#email").val("");
           $("#name").val("");
           $("#email").focus();
       })
     })
 })
</script>
</head>
<body>
   <div class="signup-form">
    <form action="/member/resetPasswordProc" method="post" class="form-horizontal">
         <div class="row">
            <div class="col-8 offset-4">
               <h2 align="center">비밀번호 재설정 </h2>
               <input type="hidden" value="${member_username }" name="member_username">
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
               <button type="submit" id="findUsername" class="btn btn-primary btn-lg">비밀번호변경 </button>
            </div>
         </div>
        </form>
   </div>
</body>
</html>