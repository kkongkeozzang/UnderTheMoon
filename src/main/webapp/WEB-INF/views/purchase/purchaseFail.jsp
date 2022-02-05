<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<style>
.container {
	margin-top:100px;
}
#error-box {
    display: flex;
    flex-direction: column;
    align-items: center;
}
#img-box {
    width:150px;
    height:150px;
}
#img-box img {
    width:100%;
    height:100%;
}
#error-box #btn-box {
    margin:10px 0;
}
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-xm-12">
                <div id="error-box">
                <div id="img-box"><img src="/resources/purchase/img/error_icon.png"></div>
                <div class="h3">고객님께 불편을 드려서 대단히 죄송합니다.</div>
                <div>주문 생성시 오류가 발생하였습니다.</div>
                <div>다시 주문하여 주시기 바랍니다.</div>
                <div id="btn-box">
                    <a href="/"><button>홈으로 이동</button></a>
                    <a href="/mypage/myPageList?cPage=1"><button>주문배송현황으로 이동</button></a>
                </div>
                
                <ul>
                    <li>주문과 결제가 실패하였습니다.</li>
                    <li>다시 주문/결제 과정을 진행하여 주십시오.</li>
                    <li>시스템 이상으로 고객님의 주문/결제가 정상 처리되지 못했습니다.</li>
                    <li>지속적으로 주문/결제가 실패할 경우 고객센터(1588-0000)로 <br>연락 주시면 주문/결제를 도와드리겠습니다.</li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/homeFooter.jsp"></jsp:include>