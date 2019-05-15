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
    <a href="#about" class="btn btn-success js-scroll-trigger">자세히 알아보기</a>
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