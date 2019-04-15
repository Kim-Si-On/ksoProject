<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="poly.util.CmmUtil" %>   
    
 <%
   request.setCharacterEncoding("euc-kr");

   String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("user_id"));
   String SESSION_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("user_seq"));
   System.out.println("ss_user_seq : " + CmmUtil.nvl((String) session.getAttribute("user_seq")));
   System.out.println("ss_user_id : " + SESSION_USER_ID);
   %>   
  
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap.css">
<title>main</title>
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("images/4.jpg");
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}
{
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  word-break: 
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
  word-break: keep-all;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.hero-text button:hover {
  background-color: #555;
  color: white;
}
</style>

</head>
<body>


<div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:70px">Reservist</h1>
    <p>대한민국 예비군들을 위한 지도 제공 홈페이지 </p>
    <a href="#about" class="btn btn-primary js-scroll-trigger">자세히 알아보기</a>
  </div>
  <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<%if(SESSION_USER_SEQ==""){ %>
     <a href="/user/user_login.do">로그인</a>
     <a href="/user/user_join.do">회원가입</a>
     <a href="/notice/NoticeList.do">공지사항</a>
     <a href="/bbs/BbsList.do">자유게시판</a>
     <a href="#">예비군훈련장</a>
  <%}else if(SESSION_USER_SEQ.equals("1")){%>
  	 <a href="/user/logout.do">로그아웃</a>
  	 <a href="/user/UserList.do">회원리스트</a>
  	 <a href="/notice/NoticeList.do">공지사항</a>
  	 <a href="/bbs/BbsList.do">자유게시판</a>
  	 <a href="#">예비군훈련장</a>
  	<%}else{ %>
  	 <a href="/user/logout.do">로그아웃</a>
  	 <a href="/user/UserInfo.do">내정보</a>
  	 <a href="/notice/NoticeList.do">공지사항</a>
  	 <a href="/bbs/BbsList.do">자유게시판</a>
  	 <a href="#">예비군훈련장</a>
    <%}%>
			</div>
		<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
	</div>
</body>
<section class="w3-container w3-center w3-content" style="max-width:600px">
  <h2 class="w3-wide" align="center">Reservist</h2>
  <p class="w3-justify">이 홈페이지는 전역을 하고 예비군인이 된 사람들을 위한 홈페이지입니다. 게시판은 총 3가지로 구성되어 있습니다. 1번째 공지사항이 있는 공지게시판, 2번째 자유롭게 글을 쓸 수 있는 자유게시판, 그리고 3번째 에비군훈련장을 모르는 예비군들을 위한 맞춤 지도 찾기가 있습니다. <br>
  This page is for a Solider who discharge from the army and We have created a fictional band website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
</section>

<!-- Band Members -->
<section class="w3-row-padding w3-center w3-light-grey">
  <article class="w3-third">
    <p>John</p>
    <img src="images/1.jpg" alt="Random Name" style="width:50%">
    <p>John is the smartest.</p>
  </article>
  <article class="w3-third">
    <p>Paul</p>
    <img src="images/2.jpg" alt="Random Name" style="width:50%">
    <p>Paul is the prettiest.</p>
  </article>
  <article class="w3-third">
    <p>Ringo</p>
    <img src="images/3.jpg" alt="Random Name" style="width:50%">
    <p>Ringo is the funniest.</p>
  </article>
</section>




 <script>
 
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>	
</body> 
</html>