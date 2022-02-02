<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/homeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />
<link rel="stylesheet" href="/resources/mypage/css/mypage.css">	

    <style>
        .submenu h3{
            margin-bottom: 16px;
            cursor: pointer;
            color: teal;
        }
        .submenu h3:hover{
            text-decoration: underline;
        }
        /* 가려질 수 있도록 하자 */
        .hidden{
            display: none;
        }
        textarea{
        resize:none;
        width:100%;
        }
        
        
        /*버튼 관련 */

.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  padding: 10px 16px;
}
  
.btn-lg {
  font-size: 18px;
  line-height: 1.33;
  border-radius: 6px;
}

.btn-primary {
  color: #fff;
  background-color: #1A374D;
  border-color: #1A374D;
}

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #1A374D;
  border-color: #1A374D;
}

/***********************
  SHARP BUTTONS
************************/
.sharp {
  border-radius:0;
}

/***********************
  CUSTON BTN VALUES
************************/

.btn {
  padding: 14px 24px;
  border: 0 none;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.btn:focus, .btn:active:focus, .btn.active:focus {
  outline: 0 none;
}

.btn-primary {
  background: #406882;
  color: #ffffff;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary {
  background: #1A374D;
}
.btn-primary:active, .btn-primary.active {
  background: #1A374D;
  box-shadow: none;
}
        
        
        
        
        
    </style>



<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>

</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
					<jsp:include page="../mypage/myPageNavBar.jsp" flush="false" />    
       
	<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
				<div class="card">
					<jsp:include page="../mypage/myPageSideBar.jsp" flush="false" />
				</div>
			</div>

			<div class="col-12 col-md-8 col-lg-9"> <!-- 1대 1 문의 시작부분 -->
				<div class="card" >
					<div class="card-body" >						


<div>

<table class="table">
  <thead>

  </thead>
  <tbody>
	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
		<div id="board-title">
			<span><h3>1:1 문의</h3></span>
		</div>
		<br>

		<!-- 게시판 박스 -->
		<div class="card mb-12 col-xl-12 col-md-12">
			<!-- 분류 네비 -->
			<div class="card-header pl-0 pr-0"
				style="justify-content: space-around; background-color: #406882; color: white;">
				<div class="row no-gutters w-100 align-items-center"
					style="justify-content: space-around">
					<div class="col-1 d-none d-md-block" style="text-align: center;">번호</div>
					<div class="col-2 d-none d-md-block" style="text-align: center;">카테고리</div>
					<div class="col-7 d-none d-md-block" style="text-align: center;">제목</div>
					<div class="col-2 d-none d-md-block" style="text-align: center;">작성일</div>

					<div class="col-1 d-md-none" style="text-align: center;">번호</div>
					<div class="col-2 d-md-none" style="text-align: center;">카테고리</div>
					<div class="col-7 d-md-none" style="text-align: center;">제목</div>
					<div class="col-2 d-md-none" style="text-align: center;">작성일</div>

				</div>
			</div>
<!-- 관리자 권한으로 로그인 시, 전체글 조회 가능 / 관리자가 작성한 글 없을 시 조회 불가 -->
     <c:choose>
            <c:when test="${empty qnas }">
               <div style="text-align: center; line-height: 100px;">작성된 글이 없습니다.</div>
               
            </c:when>
            <c:when test="${empty qnasAdmin }">
               <sec:authorize access="hasRole('ROLE_ADMIN')">      
               <div style="text-align: center; line-height: 100px;">관리자 권한으로 작성글을 조회하려면 최소 하나의 글을 작성해주세요.</div>
               </sec:authorize>
             </c:when>  
            <c:when test="${!empty qnas}">
            <sec:authorize access="hasRole('ROLE_ADMIN')">            
            <c:forEach var="qnasAdmin" items="${qnasAdmin}" varStatus="status" >

            <div class="card-body py-3 " style="justify-content: space-around; margin:0px;">
                  <input type="hidden" value="${qnasAdmin.member_id}" name="member_id" id="member_id${qnasAdmin.qa_question_id}">
                  <input type="hidden" value="${qnasAdmin.qa_question_id}" name="qa_question_id" id="qa_question_id${qnasAdmin.qa_question_id} ">
                  <input type="hidden" value="${username}" id="username${qnasAdmin.qa_question_id}">
                  
                  <script>
                  console.log(${qnasAdmin.qa_question_id});
                  str = "";
                  $(document).ready(function() {
                     $.ajax({
                        url:"/qna/username",
                        data:{
                        member_id:   $("#member_id${qnasAdmin.qa_question_id}").val(),   
                        writer_id:	 ${qnasAdmin.qa_question_id},    
                        },
                        
                        success : function(data) {
                           	console.log("data.member_id" , data);
                            console.log(${qnasAdmin.qa_question_id});  
                        }
                            	
                     }).done(function(resp){
                         //$(username${qnasAdmin.qa_question_id}).val(resp);
                        username = resp;
                        let str = "";
                        if(principal == username) {
                           str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
                           str += "<button type='button' class='btn btn-dark' id='delete${qnasAdmin.qa_question_id}' style='background-color: #406882;'>내 글 삭제하기</button>";
                           str += "</div>";
                           $(".buttons${qnasAdmin.qa_question_id}").html(str);   
                        }else{
                           str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
                           str += "<form action='adminWriteProc' method='post'>";
                           str += "<input type='hidden' name=member_id value=${qnasAdmin.member_id}>";
                           str += "<input type='hidden' name=qa_question_id value=${qnasAdmin.qa_question_id}>";
                           str += "<div><textarea name='qa_response_content'></textarea></div>";

                           str += "<button type=\"submit\" class=\"btn btn-dark\" id=\"insert${qnasAdmin.qa_question_id}\" style=\"background-color: #406882;\">답변하기</button>";
                           str += "<button type=\"button\" class=\"btn btn-dark\" id=\"delete${qnasAdmin.qa_question_id}\" style=\"background-color: #406882;\">해당 회원 글 삭제하기</button>";
                           str += "<hr>";
                           str += "<div>${ response[status.index].qa_response_content }</div>";

                           str += "<form>";
                           str += "</div>";

                           $(".buttons${qnasAdmin.qa_question_id}").html(str);
                        }
                        
                        $("#delete${qnasAdmin.qa_question_id}").on("click", function(){
                           if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
                                   location.href="/qna/delete?qa_question_id=${qnasAdmin.qa_question_id}";
                               }
                            });
                     });
                  })
                  </script>
                  <input type="hidden" value="${principal.username}" id="principal${qnasAdmin.qa_question_id}">
                  <div class="row no-gutters align-items-center"
                     style="justify-content: space-around" data-toggle="collapse"> <!-- data-target="#demo2" --> 
   
                     <%-- 웹버전 seq --%>
                     <div class="col-1 d-none d-md-block" align=left>${qnasAdmin.qa_question_id }</div>
                     <%-- 웹버전 category --%>
                     <div class="col-2 d-none d-md-block" align=left>${qnasAdmin.qa_question_category }</div>
                     <%-- 웹버전 title --%>
                     <div class="col-7 d-none d-md-block" align=left>${qnasAdmin.qa_question_title }</div> 
                      <%-- 웹버전 title --%>
                     <div class="col-2 d-none d-md-block" align=right>${qnasAdmin.getFormedDate() }</div> 
   
                     <!--모바일버전 seq -->
                     <div class="col-1 d-md-none pl-2">${qnasAdmin.qa_question_id }</div>
                     <!--모바일버전 category -->
                     <div class="col-2 d-md-none pl-2">${qnasAdmin.qa_question_category }</div>
                     <!--모바일버전 title,작성자,날짜-->
                     <div class="col-7 d-md-none pl-2">${qnasAdmin.qa_question_title }</div>
                     <!--모바일버전 title,작성자,날짜-->
                     <div class="col-2 d-md-none pl-2">${qnasAdmin.getFormedDate() }</div>
                  </div>
               </div>
               <%-- 웹버전 내용 --%>
                <div class="hidden-row" style="border-top:1px solid rgba(0,0,0,.125);display:none;padding:30px;">
                   <span style="margin-right:10px;"></span>${qnasAdmin.qa_question_content }
                   <div class=buttons${qnasAdmin.qa_question_id}>
                   </div>
                   <div class="col-sm-12" style="text-align: right; margin-top:15px;margin-bottom:15px;">
                   <hr>
      <button  type='button' class='btn btn-dark' id='write-response'>문자로 알리기 test</button>
            <button  type='button' class='btn btn-dark' id='write-response'>here</button>
      
                     <script>
                        username = $("#username${qnasAdmin.qa_question_id}").val();
                        principal = $("#principal${qnasAdmin.qa_question_id}").val();
                     </script>
                  </div>
                 ↳  ${qnasAdmin.qa_question_content } 
                </div>
               <hr class="m-0">
            </c:forEach>
            </sec:authorize>
            
            
<!-- 일반 권한으로 로그인 시, 본인이 작성한 글만 조회 가능 -->
            <sec:authorize access="hasRole('ROLE_USER')">
         
                        
         <c:forEach var="qnas" items="${qnas}" varStatus="status">
            <div class="card-body py-3 " style="justify-content: space-around; margin:0px;">
                  <input type="hidden" value="${qnas.member_id}" name="member_id" id="member_id${qnas.qa_question_id}">
                  <input type="hidden" value="${qnas.qa_question_id}" name="qa_question_id" id="qa_question_id${qnas.qa_question_id} ">
                  <input type="hidden" value="${username}" id="username${qnas.qa_question_id}">
                  
                  <script>

                  
                  str = "";
                  $(document).ready(function() {
                	  $.ajax({
                          url:"/qna/username",
                          data:{
                          member_id:   $("#member_id${qnas.qa_question_id}").val(),   
                          writer_id:	 ${qnas.qa_question_id},    
                          },
                          
                          success : function(data) {
                             	console.log("data.member_id" , data);
                              console.log(${qnas.qa_question_id});  
                          }
                              	
                     }).done(function(resp){
                         $(username${qnas.qa_question_id}).val(resp);
                        username = resp;
                        let str = "";
                        if(principal == username) {
                           str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
                           str += "<button type='button' class='btn btn-dark' id='delete${qnas.qa_question_id}' style='background-color: #406882;'>내 글 삭제하기</button>";
                           
                           str += "<div>${ response[status.index].qa_response_content }</div>";
                           str += "</div>";
                           $(".buttons${qnas.qa_question_id}").html(str);   
                        }else{
                           str += "<sec:authorize access="hasRole('ROLE_ADMIN')">";
                           str += "<div class='col-sm-12' style='text-align: right; margin-top:15px;margin-bottom:15px;'>";
                           str += "<button type=\"button\" class=\"btn btn-dark\" id=\"delete${qnas.qa_question_id}\" style=\"background-color: #406882;\">삭제하기</button>";
                           str += "</sec:authorize>";
                           $(".buttons${qnas.qa_question_id}").html(str);
                        }
                        
                        $("#delete${qnas.qa_question_id}").on("click", function(){
                           if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
                                   location.href="/qna/delete?qa_question_id=${qnas.qa_question_id}";
                               }
                            });
                     });
                  })
                  </script>
                  <input type="hidden" value="${principal.username}" id="principal${qnas.qa_question_id}">
                  <div class="row no-gutters align-items-center"
                     style="justify-content: space-around" data-toggle="collapse"> <!-- data-target="#demo2" --> 
   
                     <%-- 웹버전 seq --%>
                     <div class="col-1 d-none d-md-block" align=left>${status.count }</div>
                     <%-- 웹버전 category --%>
                     <div class="col-2 d-none d-md-block" align=left>${qnas.qa_question_category }</div>
                     <%-- 웹버전 title --%>
                     <div class="col-7 d-none d-md-block" align=left>${qnas.qa_question_title }</div> 
                      <%-- 웹버전 title --%>
                     <div class="col-2 d-none d-md-block" align=right>${qnas.getFormedDate() }</div> 
   
                     <!--모바일버전 seq -->
                     <div class="col-1 d-md-none pl-2">${qnas.qa_question_id }</div>
                     <!--모바일버전 category -->
                     <div class="col-2 d-md-none pl-2">${qnas.qa_question_category }</div>
                     <!--모바일버전 title,작성자,날짜-->
                     <div class="col-7 d-md-none pl-2">${qnas.qa_question_title }</div>
                     <!--모바일버전 title,작성자,날짜-->
                     <div class="col-2 d-md-none pl-2">${qnas.getFormedDate() }</div>
                  </div>
               </div>
               <%-- 웹버전 내용 --%>
                <div class="hidden-row" style="border-top:1px solid rgba(0,0,0,.125);display:none;padding:30px;">
                   <span style="margin-right:10px;"></span>
                   <div class=buttons${qnas.qa_question_id}>
                   </div>
                   <div class="col-sm-12" style="text-align: right; margin-top:15px;margin-bottom:15px;">
                   <hr>
                     <script>
                        username = $("#username${qnas.qa_question_id}").val();
                        principal = $("#principal${qnas.qa_question_id}").val();
                     </script>
                  </div>
                 ↳  답변 준비 중입니다. 
                </div>
               <hr class="m-0">
            </c:forEach>
            </sec:authorize>
            </c:when>
            <c:otherwise>
            
            
            
 </c:otherwise>
         </c:choose>
    

<script>
                     $(".btn-write").on("click",function(){
                        location.href="/faq/toWrite";
                     });
                     let search = function(){
                        let select = $(".select").val();
                        let keyword = $(".input-search").val();
                        location.href="/faq/search?cPage=1&select="+select+"&keyword="+keyword;
                     };
                     $(".btn-search").on("click",search);
                     $(".input-search").on("keyup",function(key){
                        if(key.keyCode==13){
                           let select = $(".select").val();
                           let keyword = $(".input-search").val();
                           location.href="/faq/search?cPage=1&select="+select+"&keyword="+keyword;
                        }
                     })
                     
                     $(".card-body.py-3").on("click",function(){
                        $(this).next(".hidden-row").slideToggle(0);
                         $(this).siblings(".hidden-row").not($(this).next(".hidden-row")).slideUp(0);
                     })
                  
                     
                     /*
                     //API 관련 


            			
            			var phone = ${memberDTO.member_phone};
      $("#write-response").on("click",function(){
    	  console.log(${memberDTO.member_phone});
    	  console.log(phone);

         $.ajax({
            url:"/qnaAPI/qnaSmsProc",
            data:{phone:"phone"}
         }).done(function(resp){
            console.log(resp); 
         })
      })			*/
            			</script>
  </tbody>
</table>



<button id="btn-write"  class="btn btn-primary sharp"> 문의하기 </button>

</div>
</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
<script>
$("#btn-write").on("click", function(){
	location.href="/qna/qnaWrite";
	
});

	$("#all-grade").on("click",function(){
		location="/mypage/myPageGrade"
	})
</script>
</body>
</html>