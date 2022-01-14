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
			<div class="col-7">
                <input type="text" class="form-control" name="member_username">
            </div>
     	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">비밀번호</label>
			<div class="col-7">
                <input type="password" class="form-control" name="member_password">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">비밀번호확인</label>
			<div class="col-7">
                <input type="password" class="form-control" name="password">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">이름</label>
			<div class="col-7">
                <input type="text" class="form-control" name="member_name">
            </div>        	
        </div>		
		<div class="form-group row">
			<label class="col-form-label col-3">이메일</label>
			<div class="col-7">
                <input type="text" class="form-control" name="member_email">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">생년월일</label>
			<div class="col-7">
                <input type="text" class="form-control" name="member_birth_date">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">휴대폰</label>
			<div class="col-5">
                <input type="text" class="form-control" name="member_phone">
            </div>
             <div class="col-4">
            	<button type="button" class="btn btn-primary">인증받기</button>
            </div>          	
        </div>
         <div class="form-group row">
			<label class="col-form-label col-3">인증번호</label>
			<div class="col-5">
                <input type="text" class="form-control" name="username">
            </div>
             <div class="col-4">
            	<button type="button" class="btn btn-primary">인증확인</button>
            </div>          	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">우편번호</label>
			<div class="col-5">
                <input type="text" class="form-control" name="member_zipcode">
            </div>
            <div class="col-4">
            	<button type="button" class="btn btn-primary">주소검색</button>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">상세주소1</label>
			<div class="col-7">
                <input type="text" class="form-control" name="member_address1">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">상세주소2</label>
			<div class="col-7">
                <input type="text" class="form-control" name="member_address2">
            </div>        	
        </div>
        <div class="form-group row">
			<div class="col-8 offset-4">
				<p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
				<button type="submit" class="btn btn-primary btn-lg">가입하기</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">Already have an account? <a href="#">Login here</a></div>
</div>
</body>
</html>