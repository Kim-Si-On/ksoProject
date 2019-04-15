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
<title>id find</title>

<script type="text/javascript">
<%if(SESSION_USER_ID==""){%>
<%}else{%>
alert("잘못된 접근입니다.");
top.location.href="/main.do";
<%}%>


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
		<form id="joinSubmit">
				<h3 style="text-align: center;">아이디 찾기</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="user_name" maxlength="20">
				</div>
					<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
								name="user_email" maxlength="20">
						</div>
						</form>
				<button type="button" onclick="idFind2()" class="btn btn-primary form-control">아이디 찾기</button>
				<div id="changeText"></div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script>


	function idFind(){
		//ajax   # id 선택 자 . 클래스 선택자   input[name=user_name]
		var username=$('input[name=user_name]').val();
		var useremail=$('input[name=user_email]').val();
		var changeCont=$('#changeText');
		var content="";
		 $.ajax({
			url:'/user/id_find.do' ,
			data:{
				'user_name':username ,
				'user_email':useremail
			},
			method: 'GET' ,
			success:function(data){
				console.log(data)
				content += '<h3> 회원님의 아이디는 '+data+' 입니다.</h3>'
				changeCont.html(content)
			},
			error:function(error){
				console.log("에러임");
			}
			
			
		}) 
	}
	 function idFind2() {

		var username = $("input[name=user_name]");
		var useremail = $("input[name=user_email]");


		if(username.val() == ""){
		    alert("이름을 입력해 주세요"); 
		    username.focus();
		    return false;
		}

		if(useremail.val() == ""){
		    alert("이메일을 입력해 주세요"); 
		    useremail.focus();
		    return false;
		}

		idFind();

		} 
	
	
	</script>
</body>
</html>