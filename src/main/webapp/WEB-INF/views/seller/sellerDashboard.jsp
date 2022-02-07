<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대시 보드</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- 매출(연) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                ① 매출 (年)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${year.purchase_amount}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						
                        <!-- 포인트사용액(연) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                                ② 포인트사용액 (年)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${year.purchase_used_point}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 쿠폰사용액(연) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">③ 쿠폰사용액 (年)
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><fmt:formatNumber value="${year.purchase_coupon}" pattern="￦#,###"/></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 영업이익(연) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                ④ 영업이익 (年, ④=①-②-③)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${year.purchase_amount - year.purchase_used_point - year.purchase_coupon}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <!-- 매출(월) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                ⑤ 매출 (月)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${month.purchase_amount}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 포인트사용액(월) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                                ⑥ 포인트사용액 (月)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${month.purchase_used_point}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 쿠폰사용액(월) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">⑦ 쿠폰사용액 (月)
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><fmt:formatNumber value="${month.purchase_coupon}" pattern="￦#,###"/></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 영업이익(월) -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                ⑧ 영업이익 (月, ⑧=⑤-⑥-⑦)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${month.purchase_amount - month.purchase_used_point - month.purchase_coupon}" pattern="￦#,###"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 손익 현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myChart" style="width:100%;height:100%;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <!-- Content Row -->

                        <!-- Content Column -->
                        <div class="col-xl-4 col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4" style="height:100%;">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">인기상품 Top 5</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">${ranks[0].md_name } (${ranks[0].count}개)<span
                                            class="float-right"><fmt:formatNumber value="${ranks[0].count / total}" pattern="###%"/></span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width:${ranks[0].count / total * 100}%;"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">${ranks[1].md_name } (${ranks[1].count}개) <span
                                            class="float-right"><fmt:formatNumber value="${ranks[1].count / total}" pattern="###%"/></span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: ${ranks[1].count / total * 100}%;"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">${ranks[2].md_name } (${ranks[2].count}개) <span
                                            class="float-right"><fmt:formatNumber value="${ranks[2].count / total}" pattern="###%"/></span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: ${ranks[2].count / total * 100}%;"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">${ranks[3].md_name } (${ranks[3].count}개) <span
                                            class="float-right"><fmt:formatNumber value="${ranks[3].count / total}" pattern="###%"/></span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: ${ranks[3].count / total * 100}%;"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">${ranks[4].md_name } (${ranks[4].count}개) <span
                                            class="float-right 5"><fmt:formatNumber value="${ranks[4].count / total}" pattern="###%"/></span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width:${ranks[4].count / total * 100}%;"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
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

<!--     Bootstrap core JavaScript -->
<!--     <script src="/resources/admin/vendor/jquery/jquery.min.js"></script> -->
<!--     <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!--     Core plugin JavaScript -->
<!--     <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!--     Custom scripts for all pages -->
<!--     <script src="/resources/admin/js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>
    
	<script type="text/javascript">
	    var context = document
	        .getElementById('myChart')
	        .getContext('2d');
	    var myChart = new Chart(context, {
	        type: 'bar', // 차트의 형태
	        data: { // 차트에 들어갈 데이터
	            labels: [
	                //x 축
	               	'22/01','22/02','22/03','22/04','22/05','22/06','22/07','22/08','22/09','22/10','22/11','22/12'
	            ],
	            datasets: [
	                { //데이터
	                    label: '매출액', //차트 제목
	                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                    data: [
	                    	0,
	                    	${months[0].purchase_amount},
	                    	${months[1].purchase_amount},
	                    	${months[2].purchase_amount},
	                    	${months[3].purchase_amount},
	                    	${months[4].purchase_amount},
	                    	${months[5].purchase_amount},
	                    	${months[6].purchase_amount},
	                    	${months[7].purchase_amount},
	                    	${months[8].purchase_amount},
	                    	${months[9].purchase_amount},
	                    	${months[10].purchase_amount}
	                    	//x축 label에 대응되는 데이터 값
	                    ],
	                    backgroundColor: [
	                        //색상
	                        'rgba(255, 99, 132, 0.2)',
	                        'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)',
	                        'rgba(255, 99, 132, 0.2)',
	                        'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)'
	                    ],
	                    borderColor: [
	                        //경계선 색상
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)',
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)'
	                    ],
	                    borderWidth: 1 //경계선 굵기
	                } ,
	                {
	                    label: '영업이익',
	                    fill: false,
	                    data: [
	                    	0,
	                    	${months[0].purchase_amount - months[0].purchase_used_point - months[0].purchase_coupon},
	                    	${months[1].purchase_amount - months[1].purchase_used_point - months[1].purchase_coupon},
	                    	${months[2].purchase_amount - months[2].purchase_used_point - months[2].purchase_coupon},
	                    	${months[3].purchase_amount - months[3].purchase_used_point - months[3].purchase_coupon},
	                    	${months[4].purchase_amount - months[4].purchase_used_point - months[4].purchase_coupon},
	                    	${months[5].purchase_amount - months[5].purchase_used_point - months[5].purchase_coupon},
	                    	${months[6].purchase_amount - months[6].purchase_used_point - months[6].purchase_coupon},
	                    	${months[7].purchase_amount - months[7].purchase_used_point - months[7].purchase_coupon},
	                    	${months[8].purchase_amount - months[8].purchase_used_point - months[8].purchase_coupon},
	                    	${months[9].purchase_amount - months[9].purchase_used_point - months[9].purchase_coupon},
	                    	${months[10].purchase_amount - months[10].purchase_used_point - months[10].purchase_coupon}
	                    ],
	                    backgroundColor: 'rgb(157, 109, 12)',
	                    borderColor: 'rgb(157, 109, 12)'
	                }
	            ]
	        },
	        options: {
	            scales: {
	                yAxes: [
	                    {
	                        ticks: {
	                            beginAtZero: false
	                        }
	                    }
	                ]
	            }
	        }
	    });
    </script>
</body>
</html>