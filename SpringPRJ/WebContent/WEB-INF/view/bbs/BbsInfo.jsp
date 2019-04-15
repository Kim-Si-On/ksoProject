<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.BbsDTO" %>
<%
BbsDTO bDTO = (BbsDTO)request.getAttribute("bDTO");

//공지글 정보를 못불러왔다면, 객체 생성
if (bDTO==null){
	bDTO = new BbsDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
int edit = 1;

//로그인 안했다면....
if (ss_user_id.equals("")){
	edit = 3;
	
//본인이 작성한 글이면 2가 되도록 변경
}else if (ss_user_id.equals(CmmUtil.nvl(bDTO.getUser_id()))){
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글보기</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//수정하기
function doEdit(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	
	if (user_id=="<%=SESSION_USER_ID%>"){
		location.href="/bbs/BbsEditInfo.do?bSeq=<%=CmmUtil.nvl(bDTO.getBbs_seq())%>";
	
	}else if (user_id==""){
		alert("로그인 하시길 바랍니다.");
		
	}else {
		alert("본인이 작성한 글만 수정 가능합니다.");
		
	}
}


//삭제하기
function doDelete(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	if (user_id=="<%=CmmUtil.nvl(bDTO.getUser_id())%>"){
		if(confirm("작성한 글을 삭제하시겠습니까?")){
			location.href="/bbs/BbsDelete.do?bSeq=<%=CmmUtil.nvl(bDTO.getBbs_seq())%>";
			
		}
		
	}else if (user_id==""){
		alert("로그인 하시길 바랍니다.");
		
	}else {
		alert("본인이 작성한 글만 삭제 가능합니다.");
		
	}
}
//목록으로 이동
function doList(){
	location.href="/bbs/BbsList.do";
		
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


<table border="1">
	<col width="100px" />
	<col width="200px" />
	<col width="100px" />
	<col width="200px" />
	<tr>
		<td align="center">제목</td>
		<td colspan="3"><%=CmmUtil.nvl(bDTO.getTitle())%></td>
	</tr>
	<tr>
		<td align="center">작성일</td>
		<td><%=CmmUtil.nvl(bDTO.getReg_dt())%></td>
		<td align="center">조회수</td>
		<td><%=CmmUtil.nvl(bDTO.getRead_cnt())%></td>
	</tr>	
	<tr>
		<td colspan="4" height="300px" valign="top">
		<%=CmmUtil.nvl(bDTO.getContents()).replaceAll("\r\n", "<br/>") %>
		</td>
	</tr>
<tr>
	<td align="center" colspan="4">
		<a href="javascript:doEdit();">[수정]</a>
		<a href="javascript:doDelete();">[삭제]</a>
		<a href="javascript:doList();">[목록]</a>
	</td>
</tr>		
</table>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>