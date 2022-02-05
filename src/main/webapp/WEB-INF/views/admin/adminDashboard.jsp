<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
	.chartjs-render-monitor{
		height:100% !important;
		width:100% !important;
	}
</style>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="adminSideBar.jsp"></jsp:include>
		<!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

            <!-- Topbar -->
			<jsp:include page="adminTopBar.jsp"></jsp:include>
			<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대시 보드</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                총 가입자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalMember }명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                일 가입자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${todayMember }명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            	총 누적 방문자수
                                            </div>
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${totalVisitor}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                당일 방문자수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${todayVisitor}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 방문자 수</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="barChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">등급별 회원 구성</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="doughChart"></canvas>
                                    </div>
                                    <br>
                                    <br>
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
	    var context = document.getElementById('doughChart').getContext('2d');
	    var myChart = new Chart(context, {
	   	  type: 'doughnut',
	   	    data: {
	   	    	labels:['${memberByGrade[0].grade_name}','${memberByGrade[1].grade_name}','${memberByGrade[2].grade_name}'],
	   	      datasets: [{
	   	        data: [${memberByGrade[0].count}, ${memberByGrade[1].count}, ${memberByGrade[2].count}],
	   	        backgroundColor: [
	   	          '#1A374D',
	   	          '#406882',
	   	          '#B1D0E0'
	   	        ],
	   	        borderWidth: 0,
	   	        scaleBeginAtZero: true,
	   	      }
	   	    ]
	   	  },
	   	});
	    
	    var context2 = document.getElementById('barChart').getContext('2d');
	    var myChart = new Chart(context2, {
	        type: 'bar', // 차트의 형태
	        data: { // 차트에 들어갈 데이터
	            labels: [
	                //x 축
	               	'22/01','22/02','22/03','22/04','22/05','22/06','22/07','22/08','22/09','22/10','22/11','22/12'
	            ],
	            datasets: [
	                { //데이터
	                    label: '월별 방문자 수', //차트 제목
	                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                    data: [
	                    	0,
	                    	${monthVisitor[0].count},
	                    	${monthVisitor[1].count},
	                    	${monthVisitor[2].count},
	                    	${monthVisitor[3].count},
	                    	${monthVisitor[4].count},
	                    	${monthVisitor[5].count},
	                    	${monthVisitor[6].count},
	                    	${monthVisitor[7].count},
	                    	${monthVisitor[8].count},
	                    	${monthVisitor[9].count},
	                    	${monthVisitor[10].count}
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
	                }],
		        },
		        options: {
		            scales: {
		                yAxes: [
		                    {
		                        ticks: {
		                            beginAtZero: true
		                        }
		                    }
		                ]
		            }
		        }
		    });
        </script>
    </body>
</html>
</body>
</html>