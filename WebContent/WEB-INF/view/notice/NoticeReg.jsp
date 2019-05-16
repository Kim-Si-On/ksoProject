<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%
request.setCharacterEncoding("EUC-KR");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("user_id"));
String SESSION_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("user_seq"));
System.out.println("ss_user_seq : " + CmmUtil.nvl((String) session.getAttribute("user_seq")));
System.out.println("ss_user_id : " + SESSION_USER_ID);
%>   




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//�α��� ���� üũ
function doOnload(){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id==""){
		alert("�α��ε� ����ڸ� ���� �� �� �ֽ��ϴ�.");
		top.location.href="/notice/NoticeList.do";
	}
	
	
}

//���۽� ��ȿ�� üũ
function submit() {

	var Title = $("input[name=title]");
	var noticeYn = $("input[name=notice_yn]");
	var Contents = $("textarea[name=contents]")

	var joinSubmit =$("#joinSubmit");

	if(Title.val()==""){
	    alert("������ �Է��� �ּ���"); 
	    Title.focus();
	    return false;
	}

	var noticeCheck = false; //üũ ���� Ȯ�� ����
	for(var i=0;i<noticeYn.length;i++){
		if (noticeYn[i].checked){
			noticeCheck = true;
		}
	}
	
	if(noticeCheck==false){
		alert("������ ���θ� �����Ͻñ� �ٶ��ϴ�.");
		noticeYn[0].focus();
		return false;
	}	
	
	if(Contents.val()==""){
	    alert("������ �Է��� �ּ���"); 
	    Contents.focus();
	    return false;
	}



	joinSubmit.submit();


	}
function reset(){
	document.getElementById('joinSubmit').reset()
}

//���� ���� ����Ʈ ������ üũ�ϱ�(����Ʈ�� ����)
function calBytes(str){
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	for (i=0;i<strCnt;i++){
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4){
			tcount += 2;
		}else{
			tcount += 1;
		}
	}
	
	return tcount;
}



</script>	
</head>
<body onload="doOnload();">
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navar-collapse-1"
				aria-expanded="fasle">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<%if(SESSION_USER_SEQ==""){ %>
						<li class="active"><a href="/user/user_login.do">�α���</a></li>
						<li><a href="/user/user_join.do">ȸ������</a></li>
						<%}else if(SESSION_USER_SEQ.equals("1")){%>
						<li class="active"><a href="/user/logout.do">�α׾ƿ�</a></li>
						<li><a href="/user/UserList.do">ȸ������Ʈ</a></li>
						<%}else{ %>
						<li class="active"><a href="/user/logout.do">�α׾ƿ�</a></li>
						<li><a href="/user/UserInfo.do">�� ����</a></li>
						<%} %>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	
<div class="container" style="margin-top:30px;" >
<h2>�������� �۾���</h2>
<form name="f" method="post" id="joinSubmit" action="/notice/Noticeinsert.do" target= "ifrPrc">
<input type="text"  class="form-control" id="title" name="title" placeholder="������ �Է����ּ���"><br>
<div class="form-control" style="margin-bottom: 20px;" >
	<div style="display: flex;justify-content: space-between;">
	<div><b align="center">������ ����</b></div>
	<div><b>��<input type="radio" name="notice_yn" id="notice_yn" value="1" />
			       �ƴϿ�<input type="radio" name="notice_yn" id="notice_yn" value="2" />
	</b></div>
	</div>	
</div>	
			
	<textarea name="contents" id="contents" class="form-control" rows="20" placeholder="������ �Է����ּ���"></textarea><br>
	
	</form>
	<div align="center">
	<button type="button" onclick="submit()" class="btn btn-primary">���</button>
	<button type="button" onclick="reset()" class="btn btn-warning">�ٽ� �ۼ�</button></div>

</div>


<!-- ���μ��� ó���� iframe / form �±׿��� target�� iframe���� �Ѵ�. -->
<iframe name="ifrPrc" style="display:none"></iframe>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>