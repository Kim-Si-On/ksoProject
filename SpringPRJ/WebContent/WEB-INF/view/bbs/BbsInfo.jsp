<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.BbsDTO" %>
<%
BbsDTO bDTO = (BbsDTO)request.getAttribute("bDTO");

//������ ������ ���ҷ��Դٸ�, ��ü ����
if (bDTO==null){
	bDTO = new BbsDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));

//������ �ۼ��� �۸� ���� �����ϵ��� �ϱ�(1:�ۼ��� �ƴ� / 2: ������ �ۼ��� �� / 3: �α��ξ���)
int edit = 1;

//�α��� ���ߴٸ�....
if (ss_user_id.equals("")){
	edit = 3;
	
//������ �ۼ��� ���̸� 2�� �ǵ��� ����
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
<title>�Խ��� �ۺ���</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//�����ϱ�
function doEdit(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	
	if (user_id=="<%=SESSION_USER_ID%>"){
		location.href="/bbs/BbsEditInfo.do?bSeq=<%=CmmUtil.nvl(bDTO.getBbs_seq())%>";
	
	}else if (user_id==""){
		alert("�α��� �Ͻñ� �ٶ��ϴ�.");
		
	}else {
		alert("������ �ۼ��� �۸� ���� �����մϴ�.");
		
	}
}


//�����ϱ�
function doDelete(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	if (user_id=="<%=CmmUtil.nvl(bDTO.getUser_id())%>"){
		if(confirm("�ۼ��� ���� �����Ͻðڽ��ϱ�?")){
			location.href="/bbs/BbsDelete.do?bSeq=<%=CmmUtil.nvl(bDTO.getBbs_seq())%>";
			
		}
		
	}else if (user_id==""){
		alert("�α��� �Ͻñ� �ٶ��ϴ�.");
		
	}else {
		alert("������ �ۼ��� �۸� ���� �����մϴ�.");
		
	}
}
//������� �̵�
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


<table border="1">
	<col width="100px" />
	<col width="200px" />
	<col width="100px" />
	<col width="200px" />
	<tr>
		<td align="center">����</td>
		<td colspan="3"><%=CmmUtil.nvl(bDTO.getTitle())%></td>
	</tr>
	<tr>
		<td align="center">�ۼ���</td>
		<td><%=CmmUtil.nvl(bDTO.getReg_dt())%></td>
		<td align="center">��ȸ��</td>
		<td><%=CmmUtil.nvl(bDTO.getRead_cnt())%></td>
	</tr>	
	<tr>
		<td colspan="4" height="300px" valign="top">
		<%=CmmUtil.nvl(bDTO.getContents()).replaceAll("\r\n", "<br/>") %>
		</td>
	</tr>
<tr>
	<td align="center" colspan="4">
		<a href="javascript:doEdit();">[����]</a>
		<a href="javascript:doDelete();">[����]</a>
		<a href="javascript:doList();">[���]</a>
	</td>
</tr>		
</table>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>