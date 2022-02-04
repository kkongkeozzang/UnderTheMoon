<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Under The Moon</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="/resources/home/css/home.css">
<link  rel="stylesheet" href="/resources/home/css/homeFooter.css">


<!--CDN-->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>



 <!-- Footer -->
<footer class="text-center text-lg-start bg-white text-muted">
  <!-- Section: Social media -->
  <section
    class="d-flex justify-content-center justify-content-lg-between"
  >
    <!-- Left -->

    <!-- Left -->

    <!-- Right -->
  
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-5 col-lg-6 col-xl-6 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <p><i class="fas fa-phone me-3"></i>  고객센터</p>
          </h6>
          <p id="footerButton">
            <button type="button" onclick = "location.href = '/views/qna/qnaList'"class="btn btn-primary btn-sm outline sharp">
              1:1 문의
            </button>
          <span style="font-weight: bold;">24시간 접수 가능 <br></span>
          고객센터 운영시간에 순차적으로 답변드리겠습니다.  
          </p>
          <p id="footerButton">
            <button type="button" onclick = "location.href = '/views/qna/qnaList'"class="btn btn-primary btn-sm outline sharp">
              공지사항
            </button>
            <span style="font-weight: bold;">24시간 이용 가능 <br></span>
            배송 및 이벤트 관련 문의는 공지사항을 확인해주세요.  
          </p>
          <p id="footerButton">
            <button type="button" onclick = "location.href = '/views/qna/qnaList'"class="btn btn-primary btn-sm outline sharp">
              자주 묻는 질문
            </button>
            <span style="font-weight: bold;">24시간 이용 가능 <br></span>
            자주 묻는 질문에 대한 답변을 제공해드립니다. 
          </p>


        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-5 col-lg-4 col-xl-4 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            월하합작 TEAM
          </h6>
          <p id="contact">
            <i class="fab fa-github"></i><a href="">&nbsp;박주영</a>  &nbsp;&nbsp;          
            <i class="fas fa-envelope me-3"></i> info@example.com
          </p>
          <p>
            <i class="fab fa-github"></i><a href="">&nbsp;김도경</a>  &nbsp;&nbsp;        
            <i class="fas fa-envelope me-3"></i> info@example.com
          </p>
          <p>
            <i class="fab fa-github"></i><a href="">&nbsp;이승훈</a>   &nbsp;&nbsp;       
            <i class="fas fa-envelope me-3"></i> info@example.com
          </p>
          <p>
            <i class="fab fa-github"></i><a href="">&nbsp;이준협</a>   &nbsp;&nbsp;       
            <i class="fas fa-envelope me-3"></i> info@example.com
          </p>
          <p>
            <i class="fab fa-github"></i><a href="">&nbsp;조성훈</a>     &nbsp;&nbsp;     
            <i class="fas fa-envelope me-3"></i> info@example.com
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            이용안내
          </h6>
          <p>
            <a href="#!" class="text-reset">개인정보제공동의서</a>
          </p>
          <p>
            <a href="#!" class="text-reset">개인정보처리방침</a>
          </p>
          <p>
            <a href="#!" class="text-reset">이용약관</a>
          </p>
        </div>
        <!-- Grid column -->

       

      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: white">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="github.com">Under The Moon</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</html>