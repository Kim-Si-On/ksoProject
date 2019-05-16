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
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//로그인 여부 체크
function doOnload(){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id==""){
		alert("로그인된 사용자만 글을 쓸 수 있습니다.");
		top.location.href="/notice/NoticeList.do";
	}
	
	
}

//전송시 유효성 체크
function submit() {

	var Title = $("input[name=title]");
	var noticeYn = $("input[name=notice_yn]");
	var Contents = $("textarea[name=contents]")

	var joinSubmit =$("#joinSubmit");

	if(Title.val()==""){
	    alert("제목을 입력해 주세요"); 
	    Title.focus();
	    return false;
	}

	var noticeCheck = false; //체크 여부 확인 변수
	for(var i=0;i<noticeYn.length;i++){
		if (noticeYn[i].checked){
			noticeCheck = true;
		}
	}
	
	if(noticeCheck==false){
		alert("공지글 여부를 선택하시기 바랍니다.");
		noticeYn[0].focus();
		return false;
	}	
	
	if(Contents.val()==""){
	    alert("내용을 입력해 주세요"); 
	    Contents.focus();
	    return false;
	}



	joinSubmit.submit();


	}
function reset(){
	document.getElementById('joinSubmit').reset()
}

//글자 길이 바이트 단위로 체크하기(바이트값 전달)
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
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<%if(SESSION_USER_SEQ==""){ %>
						<li class="active"><a href="/user/user_login.do">로그인</a></li>
						<li><a href="/user/user_join.do">회원가입</a></li>
						<%}else if(SESSION_USER_SEQ.equals("1")){%>
						<li class="active"><a href="/user/logout.do">로그아웃</a></li>
						<li><a href="/user/UserList.do">회원리스트</a></li>
						<%}else{ %>
						<li class="active"><a href="/user/logout.do">로그아웃</a></li>
						<li><a href="/user/UserInfo.do">내 정보</a></li>
						<%} %>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	
<div class="container" style="margin-top:30px;" >
<h2>공지사항 글쓰기</h2>
<form name="f" method="post" id="joinSubmit" action="/notice/Noticeinsert.do" target= "ifrPrc">
<input type="text"  class="form-control" id="title" name="title" placeholder="제목을 입력해주세요"><br>
<div class="form-control" style="margin-bottom: 20px;" >
	<div style="display: flex;justify-content: space-between;">
	<div><b align="center">공지글 여부</b></div>
	<div><b>예<input type="radio" name="notice_yn" id="notice_yn" value="1" />
			       아니오<input type="radio" name="notice_yn" id="notice_yn" value="2" />
	</b></div>
	</div>	
</div>	
			
	<textarea name="contents" id="contents" class="form-control" rows="20" placeholder="내용을 입력해주세요"></textarea><br>
	
	</form>
	<div align="center">
	<button type="button" onclick="submit()" class="btn btn-primary">등록</button>
	<button type="button" onclick="reset()" class="btn btn-warning">다시 작성</button></div>

</div>


<!-- 프로세스 처리용 iframe / form 태그에서 target을 iframe으로 한다. -->
<iframe name="ifrPrc" style="display:none"></iframe>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>