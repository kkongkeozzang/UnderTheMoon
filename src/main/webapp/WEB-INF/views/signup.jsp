<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div class="signup-form">
    <form action="/examples/actions/confirmation.php" method="post" class="form-horizontal">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2>Sign Up</h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-4">Username</label>
			<div class="col-8">
                <input type="text" class="form-control" name="username" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Email Address</label>
			<div class="col-8">
                <input type="email" class="form-control" name="email" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Password</label>
			<div class="col-8">
                <input type="password" class="form-control" name="password" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Confirm Password</label>
			<div class="col-8">
                <input type="password" class="form-control" name="confirm_password" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<div class="col-8 offset-4">
				<p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
				<button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">Already have an account? <a href="#">Login here</a></div>
</div>
</body>
</html>