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
<title>������ ����</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//�ۼ��� ����üũ
function doOnload(){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	if (user_id==""){
		alert("�ۼ��ڸ� ������ �� �ֽ��ϴ�.");
		location.href="/user/UserInfo.do";
		
	}
}

function submit() {
    
    var userpassword = $("#user_password");
    var userpasswordck = $("#user_password_ck");
    var username = $("input[name=user_name]");
    var useremail = $("input[name=user_email]");
    var userphoneNumber = $("input[name=user_phoneNumber]");
  
    var joinSubmit =$("#joinSubmit");
    
    
    if(userpassword.val() == ""){
        alert("��й�ȣ�� �Է��� �ּ���"); 
        userpassword.focus();
        return false;
    }
 
    if(userpassword.val() != userpasswordck.val()){
        alert("��й�ȣ�� ���� �ٸ��ϴ�. ��й�ȣ�� Ȯ���� �ּ���."); 
        userpassword_ck.focus();
        return false; 
    }
 
    if(username.val()==""){
        alert("�̸��� �Է����ּ���");
        username.focus();
        return false;
    }
    
    if(useremail.val()==""){
        alert("�̸����� �Է����ּ���");
       useremail.focus();
        return false;
    }
   
   
    if(userphoneNumber.val()==""){
        alert("��ȭ��ȣ�� �Է����ּ���");
       userphoneNumber.focus();
        return false;
    }
    
    
    
    joinSubmit.submit();
    
    
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
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form method="post" id="joinSubmit" action="/user/UserUpdate.do">
					<h3 style="text-align: center;">ȸ������ ����</h3>
					<div class="form-group"><br>
					<label>���̵� : <%=CmmUtil.nvl(uDTO.getUser_id())%></label>
					</div> 
					<div class="form-group">
					<label>���� : <%=CmmUtil.nvl(uDTO.getUser_name())%></label> 
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="��й�ȣ"
							id="user_password" name="user_password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="��й�ȣ ���Է�"
							id="user_password_ck" name="user_password_ck" maxlength="20">
					</div>
							<div class="form-group">
							<input type="email" class="form-control" placeholder="�̸���"
								name="user_email" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="��ȭ��ȣ"
								name="user_phoneNumber" maxlength="20">
					</div>
					<input type="hidden" name="user_seq" value="<%=uDTO.getUser_seq() %>" /> 
				</form>
				<button type="button" onclick="submit()" class="btn btn-success form-control">����</button>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	 <script src="/js/bootstrap.min.js"></script>
</body>
</html>