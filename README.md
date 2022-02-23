# 월하합작(UnderTheMoon)
KH 정보교육원 Final Project (2021-1-12 ~ 2021-02-09 : 총 29일)  
자세한 정보는 아래 노션 페이지에서 확인해주세요! :point_down:  
https://www.notion.so/FINAL-Project-10356e5988474b5fa69612ca56c19e7f

## 1. 이름과 역할

| 이름                 | 역할           | 맡은 기능 | 
| -------------------- | -------------- | --------- | 
| 박주영([github바로가기](https://github.com/kkongkeozzang))    | Project Leader<br>Git 담당자<br>PPT 제작<br>WireFrame 설계  | 관리자<br>판매자<br>상품<br>주문 & 결제<br>이벤트 게시판 (UI) |
| 김도경([github바로가기](https://github.com/danaKim-dokyung))  | WireFrame 설계<br>PPT 자료 조사 <br>Git 담당자 | 회원가입<br>1:1문의<br>메인<br>이벤트 게시판 (UI)  |
| 이승훈([github바로가기](https://github.com/SlimskiTheWise))   | ERD 설계<br>PPT 자료 조사  |  로그인<br>주문 & 결제<br>  |
| 이준협([github바로가기](https://github.com/jhleeeeeeee))      | 서버 배포<br>발표   |   회원가입<br>마이페이지<br>  |
| 조성훈([github바로가기](https://github.com/craving4u))        | DB 관리자<br>ERD 설계<br>PPT 자료 조사  <br> 요구사항 정의서 제작  |  관리자<br>판매자<br>공지사항 게시판<br>자주묻는질문 게시판<br>이벤트 게시판  |


## 2. 프로젝트 제목

💡 월하합작 - 전국 8도 명주를 찾아서

## 3. 프로젝트 개요

- 주류를 온라인으로 판매가 가능
- 코로나 확산으로 인한 사회적 거리두기 → 혼술 과 홈술이 크게 증가
- 현 20 대, 30대의 새로움과 다양성을 찾는 경향
- 한국의 세계화로 인한 한국적인 전통성 인기 증가

위와 같은 이유로 술을 판매하는 쇼핑몰을 기획하였고, 그 중 여행가서 마셨던 특색있는 지역 전통주를 찾고 싶었던 경험을 살려 지역 별로 구분하여 전통주를 판매하는 사이트를 만들게 됨.

## 4. 주요 구현 기능 목록

| 구현 기능                                                       | 상세 기능                                      |
| ---------------------------------------------------------------- | ---------------------------------------------- |
| 메인                                                         | 메인화면(지도API, 이벤트 타이머)Navbar, Footer |
| 로그인<br>PW & ID찾기                               | 스프링 시큐리티 로그인<br>인터셉터 기능 구현<br>Coolsms API Rest 방식 비밀번호 찾기 기능 구현   |
| 회원가입                                                     | 유효성 검사, 휴대폰번호 인증API                |
| 등급                                                         | 최초가입시 "별" 등급부여<br>등급별혜택 확인기능<br>다음 등급 도달을 위한 실적확인기능                       |
| 상품                                                         | 상품 리스트 조회 (비동기로 구현, 페이징)<br>상품 리스트 분류 (지역)<br>상품 리스트 정렬(최신순, 리뷰순)<br>최근 본 상품(쿠키 사용, 스크롤)<br>상품 상세 페이지(비동기로 구현) <br>상품 검색 페이지<br>상품 후기 게시판(조회, 삭제, 정렬, 조회수, 추천, 페이징)<br> 상품 후기 게시판(조회, 삭제, 정렬, 조회수, 추천, 페이징)<br>상품 문의 게시판(조회, 입력, 삭제, 조회수, 페이징)<br>장바구니 담기<br>찜하기(하트 아이콘 채움 or 비움)     |
| 주문 & 결제                                                  | 장바구니(crud,유효성검사)<br>결제(Bootpay API Rest 방식 결제 로직, 검증, 취소 구현,적립금, 쿠폰, 배송비 유효성검사,적립금 생성, 주소 API 배송지 수정)                      |
| 고객센터                                                     | 이벤트(조회)<br>자주묻는질문(게시글 생성(summernote), 수정(summernote), 삭제, 글자체크, 목록조회, 상세페이지, 페이징, 검색)<br>공지사항(게시글 생성(summernote), 수정(summernote), 삭제, 글자체크, 목록조회, 상세페이지, 페이징, 검색)<br>1:1문의(비동기로 구현) <br>회원(문의글 작성, 본인이 작성한 글 조회, 관리자 답변 조회)<br>관리자(전체 글 조회, 전체 글 삭제, 답변 작성 권한)                                 |
| 마이페이지                                                   | 주문내역(주문내역, 상세주문내역 확인기능)<br>찜한상품(찜한상품 확인,삭제기능) <br>적립금(적립금 획득,사용내역 확인기능)<br>쿠폰(쿠폰 획득,사용내역 확인기능 및 쿠폰등록 기능)<br>상품문의(문의한 내용 확인,삭제 기능 팝업구현)<br>상품후기(작성가능한 후기 상품 페이징 및 작성 시 사진첨부, 썸네일 사진 출력, 작성 완료 후기 확인기능)       |
| 판매자                                                       | 대시보드(chart.js)<br>상품 관리(상품 조회, 입력, 삭제, 수정) <br>주문 관리(주문내역, 조회, 삭제, 상세주문 조회, 삭제, 배송확정)<br>상품문의 관리(상품문의 조회, 문의답변 입력, 수정, 삭제)<br>포인트 관리(포인트 조회, 입력, 삭제, 수정)<br>쿠폰 관리(쿠폰 조회, 입력, 삭제, 수정)                       |
| 관리자                                                       | 대시보드(chart.js)<br>등급 관리(등급 조회, 입력, 삭제, 수정)<br>공지사항 관리(조회, 입력, 삭제)<br>자주묻는질문 관리(조회, 입력 삭제)<br>1:1문의 관리(삭제, 답변)                           |


## 5. 설계의 주안점

- 기획보다는 기능의 완성을 중점으로
- 프론트단보다는 서버단을 중점으로
- 가짓수만 많은 복붙식의 기능 늘리기가 아닌 해보지 않은 새로운 기능을 중점적으로 시도

## 6. 사용 기술 및 개발 환경

Back-end  `Java11` `OJDBC8` `DBCP` `MyBatis` `Spring Security` `Eclipse` `Spring MVC`  

Front-end `HTML5` `CSS3` `Javascript` `Jquery` `VS code` `Bootstrap` `JSTL` `Gson`  

Server `AWS` `Tomcat 8.5`  `Oracle` `SQLDeveloper`  

Collaboration tool `Slack` `notion`  `Git` `Github` `ERDcloud` `Figma`  `Google Spread Sheet`
