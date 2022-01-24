<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러오피스</title>
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

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color:#406882;">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i><!-- 여기 로고-->
                </div>
                <div class="sidebar-brand-text mx-3">Seller Office</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                판매자
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/seller/sellerOffice" data-target="#collapse-one"
                    aria-expanded="true" aria-controls="collapse-one">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>대쉬 보드</span>
                </a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-target="#collapse-two"
                    aria-expanded="true" aria-controls="collapse-two">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품 관리</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse-three"
                    aria-expanded="true" aria-controls="collapse-three">
                    <i class="fas fa-fw fa-table"></i>
                    <span>주문 관리</span>
                </a>
                <div id="collapse-three" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/resources/admin/login.html">주문내역</a>
                        <a class="collapse-item" href="/resources/admin/register.html">상세주문</a>
                    </div>
                </div>
            </li>
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-target="#collapse-four"
                    aria-expanded="true" aria-controls="collapse-five">
                    <i class="fas fa-fw fa-table"></i>
                    <span>리뷰 관리</span>
                </a>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/seller/grade" data-target="#collapse-five"
                    aria-expanded="true" aria-controls="collapse-six">
                    <i class="fas fa-fw fa-table"></i>
                    <span>등급 관리</span>
                </a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse-six"
                    aria-expanded="true" aria-controls="collapse-seven">
                    <i class="fas fa-fw fa-table"></i>
                    <span>포인트/쿠폰 관리</span>
                </a>
                <div id="collapse-six" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/resources/admin/login.html">포인트</a>
                        <a class="collapse-item" href="/resources/admin/register.html">쿠폰</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="/resources/admin/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components,
                    and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
                    Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->
        
</body>
</html>