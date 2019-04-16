<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.BbsDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%



List<BbsDTO> cList = (List<BbsDTO>)request.getAttribute("cList");

//게시판 조회 결과 보여주기
if (cList==null){
	cList = new ArrayList<BbsDTO>();
	
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유 리스트</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">



//상세보기 이동
function doDetail(seq) {
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id==""){
		alert("로그인된 사용자만 글을 볼 수 있습니다.");
	    top.location.href="/bbs/BbsList.do";

	}else if(user_id=="<%=SESSION_USER_ID%>") {
		location.href="/bbs/BbsInfo.do?bSeq="+ seq;
		
	}

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
				<li><a href="BbsList.do">자유게시판</a></li>
				<li><a href="board.do">예비군훈련장 안내</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
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
<h2>자유게시판</h2>
<table class="table table-striped">
<tr>
	<th>순번</th>
	<th>제목</th>
	<th>조회수</th>
	<th>등록자</th>
	<th>등록일</th>

</tr>
<%
for (int i=0;i<cList.size();i++){
	BbsDTO bDTO = cList.get(i);

	if (bDTO==null){
		bDTO = new BbsDTO();
	}
	
%>
<tr>
	<td align="left"><%=CmmUtil.nvl(bDTO.getBbs_seq()) %></td>
	<td align="left">
		<a href="javascript:doDetail('<%=CmmUtil.nvl(bDTO.getBbs_seq())%>');">
		<%=CmmUtil.nvl(bDTO.getTitle()) %></a>
	</td>
	<td align="left"><%=CmmUtil.nvl(bDTO.getRead_cnt()) %></td>
	<td align="left"><%=CmmUtil.nvl(bDTO.getUser_id()) %></td>
	<td align="left"><%=CmmUtil.nvl(bDTO.getReg_dt()) %></td>
</tr>
<%
}
%>
</table>
	<a class="btn btn-success pull-right" href="/bbs/BbsReg.do">글쓰기</a>
	</div>
	
	
<ul class="pagination justify-content-center" style="display: table;margin: 0 auto">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">이전</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">다음</a>
    </li>
 </ul>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>