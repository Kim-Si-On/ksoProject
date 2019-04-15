<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.UserDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%> 


<%List<UserDTO> uList =	(List<UserDTO>)request.getAttribute("uList");


//�Խ��� ��ȸ ��� �����ֱ�
if (uList==null){
	uList = new ArrayList<UserDTO>();
	
}%>       
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
	    top.location.href="/user/UserList.do";

	}else if(user_id=="<%=SESSION_USER_ID%>") {
		location.href="/user/UserInfo.do?uSeq="+ seq;
		
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
				<li><a href="board.jsp">�����Ʒ��� �ȳ�</a></li>
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
						<li class="active"><a href="user/logout.do">�α׾ƿ�</a></li>
						<li><a href="/user/UserInfo.do">�� ����</a></li>
						<%} %>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

<div class="container">
<h2>ȸ������Ʈ</h2>
<table class="table table-striped">
<tr>
	<th>����</th>
	<th>���̵�</th>
	<th>�̸�</th>
	<th>�̸���</th>

</tr>
<%
for (int i=0;i<uList.size();i++){
	UserDTO uDTO = uList.get(i);

	if (uDTO==null){
		uDTO = new UserDTO();
	}
	
%>

<tr>
	<td align="left"><%=CmmUtil.nvl(uDTO.getUser_seq()) %></td>
	<td align="left">
	<a href="javascript:doDetail('<%=CmmUtil.nvl(uDTO.getUser_seq())%>');">
	<%=CmmUtil.nvl(uDTO.getUser_id()) %></a>
	</td>
	<td align="left"><%=CmmUtil.nvl(uDTO.getUser_name()) %></td>
	<td align="left"><%=CmmUtil.nvl(uDTO.getUser_email()) %></td>
</tr>
<%
}
%>
</table>
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