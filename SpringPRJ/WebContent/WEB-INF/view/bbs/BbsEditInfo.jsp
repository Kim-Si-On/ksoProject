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
<title>�Խ��� �۾���</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//�ۼ��� ����üũ
function doOnload(){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id!="<%=CmmUtil.nvl(bDTO.getUser_id())%>"){
		alert("�ۼ��ڸ� ������ �� �ֽ��ϴ�.");
		location.href="/bbs/BbsInfo.do?bSeq=<%=CmmUtil.nvl(bDTO.getBbs_seq())%>";
	
	}
}

//���۽� ��ȿ�� üũ
function doSubmit(f){
	if(f.title.value == ""){
		alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
		f.title.focus();
		return false;
	}
	
	if(calBytes(f.title.value) > 200){
		alert("�ִ� 200Bytes���� �Է� �����մϴ�.");
		f.title.focus();
		return false;
	}		
	
	if(f.contents.value == ""){
		alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
		f.contents.focus();
		return false;
	}	
	
	if(calBytes(f.contents.value) > 4000){
		alert("�ִ� 4000Bytes���� �Է� �����մϴ�.");
		f.contents.focus();
		return false;
	}		
	
	
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
	
<h2>�� ����!</h2>
<form name="f" method="post" action="/bbs/BbsUpdate.do" onsubmit="return doSubmit(this);">
<input type="hidden" name="bSeq" value="<%=CmmUtil.nvl(request.getParameter("bSeq")) %>" />
	<table border="1">
		<col width="100px" />
		<col width="500px" />
		<tr>
			<td align="center">����</td>
			<td>
			<input type="text" name="title" maxlength="100" 
				   value="<%=CmmUtil.nvl(bDTO.getTitle()) %>" style="width: 450px"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea 
						name="contents" style="width: 550px; height: 400px"
						><%=CmmUtil.nvl(bDTO.getContents()) %></textarea>
			</td>
		</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" value="����" />
			<input type="reset" value="�ٽ� �ۼ�" />
		</td>
	</tr>		
	</table>
</form>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>