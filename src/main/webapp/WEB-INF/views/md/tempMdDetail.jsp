<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<script>

$(function(){
$("#cart").on("click",function(){
	$.ajax({
  	  type: 'post',
        url:"/cart/rest/addToCart",
        data: {
      	  member_username: $("#member_username").val(),
            md_id: $("#md_id").val(),
            cart_item_count: $("#cart_item_count").val()
        }
     }).done(function(resp){
    	 if(confirm("장바구니에 선택하신 상품을 추가하였습니다. 장바구니로 이동하시겠습니까?")){
    		 document.location.href="/cart/cart";
    		}
     })
   })
})

</script>
<body>
	<input id="cart" type="button" value="장바구니추가.">
	<input id="md_id" type=text value='1'>
	<input id="member_username" type=text value=${principal.username }>
	<input type="text" id="cart_item_count" value="1">
</body>
</html>