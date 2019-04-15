<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>	
<%
request.setCharacterEncoding("euc-kr");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("user_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap.css">
<title>login</title>
<script type="text/javascript">
<%if(SESSION_USER_ID==""){%>
<%}else{%>
alert("잘못된 접근입니다.");
top.location.href="/main.do";
<%}%>


function submit() {

var userid = $("input[name=user_id]");
var userpassword = $("#user_password");


var joinSubmit =$("#joinSubmit");

if(userid.val() == ""){
    alert("아이디를 입력해 주세요"); 
    userid.focus();
    return false;
}

if(userpassword.val() == ""){
    alert("비밀번호를 입력해 주세요"); 
    userpassword.focus();
    return false;
}



joinSubmit.submit();


}


</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navar-collapse-1"
				aria-expanded="fasle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/main.do">메인</a></li>
				<li><a href="/notice/NoticeList.do">공지사항</a></li>
				<li><a href="/bbs/BbsList.do">자유게시판</a></li>
				<li><a href="board.jsp">예비군훈련장 안내</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="/user/user_login.do">로그인</a></li>
						<li><a href="/user/user_join.do">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px">
			<form method="post" id="joinSubmit" action="/user/user_login_Action.do">
				<h3 style="text-align: center;">로그인</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="user_id" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="user_password" maxlength="20">
				</div>				
			</form>
			<button type="button" onclick="submit()" class="btn btn-primary form-control">로그인</button>
			<div class="position a">
				<div class="find_info" align="center"><br>
					<a target="_blank" href="/user/id_find_view.do">아이디 찾기</a>
					<span class="bar" aria-hidden="true">|</span> <a target="_blank" href="/user/password_find_view.do">비밀번호 찾기</a> 
					<span class="bar" aria-hidden="true">|</span> <a target="_blank" id="join" href="/user/user_join.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>