<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.BbsDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%



List<BbsDTO> cList = (List<BbsDTO>)request.getAttribute("cList");

//�Խ��� ��ȸ ��� �����ֱ�
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
<title>���� ����Ʈ</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">



//�󼼺��� �̵�
function doDetail(seq) {
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id==""){
		alert("�α��ε� ����ڸ� ���� �� �� �ֽ��ϴ�.");
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
			<a class="navbar-brand">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/main.do">����</a></li>
				<li><a href="/notice/NoticeList.do">��������</a></li>
				<li><a href="BbsList.do">�����Խ���</a></li>
				<li><a href="board.do">�����Ʒ��� �ȳ�</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
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


<div class="container">
<h2>�����Խ���</h2>
<table class="table table-striped">
<tr>
	<th>����</th>
	<th>����</th>
	<th>��ȸ��</th>
	<th>�����</th>
	<th>�����</th>

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
	<a class="btn btn-success pull-right" href="/bbs/BbsReg.do">�۾���</a>
	</div>
	
	
<ul class="pagination justify-content-center" style="display: table;margin: 0 auto">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">����</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">����</a>
    </li>
 </ul>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>