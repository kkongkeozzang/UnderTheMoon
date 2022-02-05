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
                    <h1 class="h3 mb-2 text-gray-800">상세주문 관리</h1>
                    <p class="mb-4">상세주문 관리 메뉴입니다. 여기에서 상세주문 내역을 조회, 생성, 수정, 삭제할 수 있습니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상세주문 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div>
                                    <a id="complete" class="btn btn-info btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">배송확정</span>
                                    </a>

                            	</div>

                            	
                            	<hr>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    	<tr style="text-align:center;">
                                    		<th><input type="checkbox" name='checkAll'></th>
                                    		<th>ID</th>
                                            <th>주문번호</th>
                                            <th>주문자</th>
                                            <th>상품번호</th>
                                            <th>상품명</th>
                                            <th>주문수량</th>
                                            <th>주문단가</th>
                                            <th>배송처리유무</th>
                                            <th>배송완료날짜</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- <form action="/seller/completeDelivery" method="get" id="frm"> -->
									<c:forEach var="purchaseDetails" items="${purchaseDetails}">
                                        <tr style="text-align:center;">
                                        	<td style="font-size:0em;">0
                                        	<c:choose>
	                                        	<c:when test="${purchaseDetails.purchase_detail_result == 'Y'}">
	                                        		<input type="checkbox" value="${purchaseDetails.purchase_detail_id}" disabled checked>
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        		<input type="checkbox" name='check' value="${purchaseDetails.purchase_detail_id}">
	                                        	</c:otherwise>
                                        	</c:choose>
	                                        	<input type=hidden id=name class=purchase_detail_id value="${purchaseDetails.purchase_detail_id}">
                                        	</td>
                                            <td style="font-size:medium;color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${purchaseDetails.purchase_detail_id}
                                            <td>${purchaseDetails.purchase_id}
                                            <td>${purchaseDetails.member_username}
                                            <td>${purchaseDetails.md_id}
                                            <td>${purchaseDetails.md_name }
                                            <td>${purchaseDetails.purchase_detail_quantity}
                                            <td>${purchaseDetails.purchase_detail_price}
                                            <td>${purchaseDetails.purchase_detail_result}
                                            <td>${purchaseDetails.purchase_detail_delivery_date}
                                            <td>
                                           	<a id="del" class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
		                                    <c:if test="${purchaseDetails.purchase_detail_result == 'Y'}">
	                                        	<a id="cancel" class="btn btn-primary btn-icon-split">
						                            <span class="icon text-white-50">
						                                 <i class="fas fa-flag"></i>
						                            </span>
						                            <span class="text">배송취소</span>
						                        </a>
                                        	</c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- </form> -->
                                    </tbody>
                                </table>
                                <script>
                            		$("table").on('click',"#del",function(){ // 삭제버튼 클릭시
                            			let purchase_detail_id = $(this).parent().siblings("td").children(".purchase_detail_id").val();
                            			if(confirm("정말 삭제하시겠습니까?")){
                            				location.href="/seller/deletePurchaseDetail?purchase_detail_id="+purchase_detail_id;
                            			}
                            		})
                            		
									$('#dataTable').dataTable( {  // 체크박스로 정렬되는 것을 막는 코드
									      "aoColumnDefs": [
									          { 'bSortable': false, 'aTargets': [ 0 ] }
									       ]
									});
                            		
                            		$("#dataTable").on("mouseover",function(){  // 체크박스 전체선택 관련 코드
								 		chk_listArr = $("input[name='check']");
							 			rowCnt = chk_listArr.length;
							 			
								 		$("input[name='checkAll']").on("click",function(){
								 			for(let i = 0; i<chk_listArr.length; i++){
								 				chk_listArr[i].checked = this.checked;
								 			}
								 		});
								 		
								 		$("input[name='check']").on("click",function(){
								 			if($("input[name='check']:checked").length == rowCnt){
								 				$("input[name='checkAll']")[0].checked = true;
								 			}else{
								 				$("input[name='checkAll']")[0].checked = false;
								 			}
								 		});	
								 	});
                            		
                            		$("#complete").on('click',function(){ // 배송완료버튼 클릭시
                            			
                            			if($("table input[name='check']:checked").length == 0){ // 체크된 체크박스가 없을 때
                             				alert("선택된 주문내역이 없습니다.");
                             				return false;
                             			}else{
                             				if(confirm("선택하신 주문내역을 배송확정 하시겠습니까?")){
                             					var checkArr = [];
                                 				$("table input[name='check']:checked").each(function(i){
                                 					checkArr.push($(this).val());
                                 				});
                                 				$.ajax({
                                 			        url: '/seller/completeDelivery',
                                 			        
                                 			        data: {
                                 			            valueArrTest: checkArr
                                 			        }
                                 			    }).done(function(resp){
     	                         					location.reload();
    	                         					alert("업데이트가 완료되었습니다.");
    	                         				})	
                             				}
                             			}	
                            		})
                            		
                      		        $("table").on('click',"#cancel",function(){ // 배송취소버튼 클릭시
                            			let purchase_detail_id = $(this).parent().siblings("td").children(".purchase_detail_id").val();
                            			if(confirm("배송확정을 취소하시겠습니까?")){
                            				location.href="/seller/cancelDelivery?purchase_detail_id="+purchase_detail_id;
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