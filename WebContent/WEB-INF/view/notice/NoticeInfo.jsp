<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%
NoticeDTO nDTO = (NoticeDTO)request.getAttribute("nDTO");

//������ ������ ���ҷ��Դٸ�, ��ü ����
if (nDTO==null){
	nDTO = new NoticeDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID"));

//������ �ۼ��� �۸� ���� �����ϵ��� �ϱ�(1:�ۼ��� �ƴ� / 2: ������ �ۼ��� �� / 3: �α��ξ���)
int edit = 1;

//�α��� ���ߴٸ�....
if (ss_user_id.equals("")){
	edit = 3;
	
//������ �ۼ��� ���̸� 2�� �ǵ��� ����
}else if (ss_user_id.equals(CmmUtil.nvl(nDTO.getUser_id()))){
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
<title>�Խ��� �ۺ���</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//�����ϱ�
function doEdit(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id=="<%=CmmUtil.nvl(nDTO.getUser_id())%>"){
		location.href="/notice/NoticeEditInfo.do?nSeq=<%=CmmUtil.nvl(nDTO.getNotice_seq())%>";
		
	}else if (user_id==""){
		alert("�α��� �Ͻñ� �ٶ��ϴ�.");
		
	}else {
		alert("������ �ۼ��� �۸� ���� �����մϴ�.");
		
	}
}


//�����ϱ�
function doDelete(seq){
	var user_id = "<%=SESSION_USER_ID%>";
	
	if (user_id=="<%=CmmUtil.nvl(nDTO.getUser_id())%>"){
		if(confirm("���� �����Ͻðڽ��ϱ�?")){
			location.href="/notice/NoticeDelete.do?nSeq=<%=CmmUtil.nvl(nDTO.getNotice_seq())%>";
			
		}
		
	}else if (user_id==""){
		alert("�α��� �Ͻñ� �ٶ��ϴ�.");
		
	}else {
		alert("������ �ۼ��� �۸� ���� �����մϴ�.");
		
	}
}
//������� �̵�
function doList(){
	location.href="/notice/NoticeList.do";
		
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



<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <h2 class="text-center">��������</h2><p>&nbsp;</p>
    <div class="table table-responsive">
        <table class="table">
        <tr>
            <th class="success">����</th>
            <td colspan="3"><%=CmmUtil.nvl(nDTO.getTitle())%></td>
        </tr>
        <tr>
            <th class="success">������ ����</th>
            <td colspan="1">��<input type="radio" name="notice_yn" value="1" 
				<%=CmmUtil.checked(CmmUtil.nvl(nDTO.getNotice_yn()), "1") %>/>
		        �ƴϿ�<input type="radio" name="notice_yn" value="2" 
		        <%=CmmUtil.checked(CmmUtil.nvl(nDTO.getNotice_yn()), "2") %>/>
		</td>
            <th class="success">��ȸ��</th>
            <td><%=CmmUtil.nvl(nDTO.getRead_cnt())%></td>
        </tr>
        <tr>
            <th class="success">�ۼ���</th>
            <td><%=CmmUtil.nvl(nDTO.getUser_id())%></td>
            <th class="success">�ۼ���</th>
            <td><%=CmmUtil.nvl(nDTO.getReg_dt())%></td>
        </tr>
        <tr>
          <td colspan="4" height="300px" valign="top"><%=CmmUtil.nvl(nDTO.getContents()).replaceAll("\r\n", "<br/>") %></td>
        </tr>
        <tr>
          <td colspan="4" class="text-center">
            
    <input type="button" class="btn btn-warning" value="�����ϱ�" onclick="javascript:doEdit();" >          
<input type="button" class="btn btn-danger" value="�����ϱ�" onclick="javascript:doDelete();">
<input type="button" class="btn btn-primary" value="��Ϻ���" onclick="javascript:doList();">
            </td>
        </tr>
    </table>
   </div>     
 </div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>