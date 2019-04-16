<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.UserDTO" %>
<%
UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");

if (uDTO==null){
	uDTO = new UserDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("user_id"));

int edit = 1;


if (ss_user_id.equals("")){
	edit = 3;

}else if (ss_user_id.equals(CmmUtil.nvl(uDTO.getUser_id()))){
	edit = 2;
	
}
%>

   
<%
   request.setCharacterEncoding("EUC-KR");

   String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("user_id"));
   String SESSION_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("user_seq"));
   System.out.println("ss_user_seq : " + CmmUtil.nvl((String) session.getAttribute("user_seq")));
   System.out.println("ss_user_id : " + SESSION_USER_ID);
   %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>내정보</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">
<%if(CmmUtil.nvl(uDTO.getUser_id())==null){%>
alert("잘못된 접근입니다.");
top.location.href="/main.do";
<%}%>


//수정하기
function doEdit(seq){
		location.href="/user/UserEditInfo.do?uSeq="+seq;
}


//탈퇴하기
function doDelete(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id=="<%=SESSION_USER_ID%>"){
		if(confirm("회원을 탈퇴하시겠습니까?")){
			location.href="/user/UserDelete.do?uSeq=<%=CmmUtil.nvl(uDTO.getUser_seq())%>";
			
		}
		
	}else if (user_id==""){
		alert("로그인 하시길 바랍니다.");
		
	}else {
		alert("본인이 작성한 글만 삭제 가능합니다.");
		
	}
}
//목록으로 이동
function doList(){
	location.href="/main.do";
		
}

</script>
</head>
<body>
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
	
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form method="post" action="/user/UserUpdate.do">
					<%if(SESSION_USER_SEQ.equals("1")){%>
					<h3 style="text-align: center;">회원정보</h3>
					<%}else { %>
					<h3 style="text-align: center;">내정보</h3>
					<%} %>
					<div class="form-group"><br>
					<label>아이디 : <%=CmmUtil.nvl(uDTO.getUser_id())%></label>
					</div> 
					<div class="form-group">
					<label>비밀번호 : <%=CmmUtil.nvl(uDTO.getUser_password())%></label> 
					</div>
					<div class="form-group">
					<label>성명 : <%=CmmUtil.nvl(uDTO.getUser_name())%></label> 
					</div>
					<div class="form-group">
					<label>생일 : <%=CmmUtil.nvl(uDTO.getUser_birthday())%> /</label>
					<label><%=CmmUtil.nvl(uDTO.getUser_birthday2())%> /</label>
					<label><%=CmmUtil.nvl(uDTO.getUser_birthday3())%></label> 
					</div>
					<div class="form-group">
					<label>성별 : <%=CmmUtil.nvl(uDTO.getUser_gender())%></label> 
					</div>
					<div class="form-group">
					<label>이메일 : <%=CmmUtil.nvl(uDTO.getUser_email())%></label> 
					</div>
					<div class="form-group">
					<label>전화번호 : <%=CmmUtil.nvl(uDTO.getUser_phoneNumber())%></label> 
					</div>
				</form>
				<div class="position a">
				<div class="find_info" align="center"><br>
					<%if(SESSION_USER_SEQ.equals("1")){%>
					<a class="btn btn-success" align="center" href="javascript:doEdit('<%=CmmUtil.nvl(uDTO.getUser_seq())%>');">회원정보 수정</a>
					<%}else { %>
						<a class="btn btn-success" align="center" href="javascript:doEdit();">내정보 수정</a>
					<%} %>
					<a class="btn btn-danger" align="center" href="javascript:doDelete();">계정 삭제</a>
					<a class="btn btn-primary" align="center" href="javascript:doList();">&nbsp&nbsp목록&nbsp&nbsp</a>
					
					
					
				</div>
			</div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>