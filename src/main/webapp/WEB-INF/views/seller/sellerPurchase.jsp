<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월하합작 - 전국 8도 명주를 찾아서</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	
	#input-new td{
		font-size:medium;
		color:black;
	}
	
	#input-new td select{
		border: 1px solid black;
	}
	
	#input-new td input{
		border: 1px solid black;
	}
	
 	#dataTable>tbody>tr>td{
 		font-size:0em;
 		color: white;
 	}
 	
	#dataTable>tbody>tr>td>input {
		font-size:medium;
		color:black;
		border:none;
		width:100%;
		height:100%;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	#dataTable>tbody>tr>td>select {
		font-size:medium;
		color:black;
		border:none;
		width:100%;
		height:100%;
		disabled:true;
		display:inline-block;
	}
</style>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
		<!-- Sidebar -->
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
		<!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            <!-- Topbar -->
			<jsp:include page="sellerTopBar.jsp"></jsp:include>
			<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">주문 관리</h1>
                    <p class="mb-4">주문 관리 메뉴입니다. 여기에서 상품을 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">주문 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    	<tr>
                                    		<th>ID</th>
                                            <th>주문회원</th>
                                            <th>주문날짜</th>
                                            <th>배송지번호</th>
                                            <th>주문총금액</th>
                                            <th>배송비</th>
                                            <th>적립금사용액</th>
                                            <th>쿠폰사용액</th>
                                            <th>최종결제금액</th>
                                            <th>결제수단</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="purchases" items="${purchases}">
                                        <tr>
                                        <form action="/seller/updateMd" method="post" class="updateFrm">
                                            <td style="font-size:medium;color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${purchases.purchase_id}<input type=hidden value="${purchases.purchase_id}" class=purchase_id name=purchase_id>
                                            <td>${purchases.member_username}<input type=text class="member_username" value="${purchases.member_username}" name="member_username" readonly>
                                            <td>${purchases.purchase_date}<input type=text class="purchase_date" value="${purchases.purchase_date}" name=purchase_date maxLength=10 readonly>
                                            <td>${purchases.delivery_id}<input type=text class="delivery_id" value="${purchases.delivery_id}" name=delivery_id maxLength=50 readonly>
                                            <td>${purchases.purchase_amount}<input type=text class="purchase_amount" value="${purchases.purchase_amount}" name=purchase_amount maxLength=10 readonly>
                                            <td>${purchases.purchase_delivery_fee}<input type=text class="purchase_delivery_fee" value="${purchases.purchase_delivery_fee}" name="purchase_delivery_fee" readonly>
                                            <td>${purchases.purchase_used_point}<input type=text class="purchase_used_point" value="${purchases.purchase_used_point}" name=purchase_used_point maxLength=10 readonly>
                                            <td>${purchases.purchase_coupon}<input type=text class="purchase_coupon" value="${purchases.purchase_coupon}" name=purchase_coupon maxLength=50 readonly>
                                            <td>${purchases.purchase_payment}<input type=text class="purchase_payment" value="${purchases.purchase_payment}" name=purchase_payment maxLength=50 readonly>
                                            <td>${purchases.purchase_method}<input type=text class="purchase_method" value="${purchases.purchase_method}" name=purchase_method maxLength=50 readonly>
                                            <td>
                                           	<a id="del" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
                                            </td>
                                            </form>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <script>
                            		$("table").on('click',"#del",function(){ // 삭제버튼 클릭시
                            			let purchase_id = $(this).parent().siblings("td").children(".purchase_id").val();
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				location.href="/seller/deletePurchase?purchase_id="+purchase_id;
                            			}
                            		})
                            		
                            	</script>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
           	<footer class="sticky-footer bg-white">
			    <div class="container my-auto">
			        <div class="copyright text-center my-auto">
			            <span>Copyright &copy; 月下合酌 2022</span>
			        </div>
			    </div>
			</footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
</body>
</html>