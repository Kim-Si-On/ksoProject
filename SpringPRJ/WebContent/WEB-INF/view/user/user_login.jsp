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
alert("�߸��� �����Դϴ�.");
top.location.href="/main.do";
<%}%>


function submit() {

var userid = $("input[name=user_id]");
var userpassword = $("#user_password");


var joinSubmit =$("#joinSubmit");

if(userid.val() == ""){
    alert("���̵� �Է��� �ּ���"); 
    userid.focus();
    return false;
}

if(userpassword.val() == ""){
    alert("��й�ȣ�� �Է��� �ּ���"); 
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
			<a class="navbar-brand">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/main.do">����</a></li>
				<li><a href="/notice/NoticeList.do">��������</a></li>
				<li><a href="/bbs/BbsList.do">�����Խ���</a></li>
				<li><a href="board.jsp">�����Ʒ��� �ȳ�</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="/user/user_login.do">�α���</a></li>
						<li><a href="/user/user_join.do">ȸ������</a></li>
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
				<h3 style="text-align: center;">�α���</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="���̵�"
						name="user_id" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="��й�ȣ"
						name="user_password" maxlength="20">
				</div>				
			</form>
			<button type="button" onclick="submit()" class="btn btn-primary form-control">�α���</button>
			<div class="position a">
				<div class="find_info" align="center"><br>
					<a target="_blank" href="/user/id_find_view.do">���̵� ã��</a>
					<span class="bar" aria-hidden="true">|</span> <a target="_blank" href="/user/password_find_view.do">��й�ȣ ã��</a> 
					<span class="bar" aria-hidden="true">|</span> <a target="_blank" id="join" href="/user/user_join.do">ȸ������</a>
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