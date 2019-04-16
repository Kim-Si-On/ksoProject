<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>	
	    <%
   request.setCharacterEncoding("euc-kr");

   String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("user_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap.css">
<title>join</title>
<script type="text/javascript">
<%if(SESSION_USER_ID==""){%>
<%}else{%>
alert("�߸��� �����Դϴ�.");
top.location.href="/main.do";
<%}%>





function submit() {
    
    var userid = $("input[name=user_id]");
    var userpassword = $("#user_password");
    var userpasswordck = $("#user_password_ck");
    var username = $("input[name=user_name]");
    var usergender = $("input[name=user_gender]");
    var useremail = $("input[name=user_email]");
    var userbirthday = $("#user_birthday");
    var userbirthday2 = $("#user_birthday2");
    var userbirthday3 = $("#user_birthday3");
    var userphoneNumber = $("input[name=user_phoneNumber]");
    
	var joinSubmit =$("#joinSubmit");
    
    if(userid.val() == ""){
        alert("���̵� �Է��� �ּ���"); 
        userid.focus();
        return false;
    }
    
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
  	
    if(usergender==false){
        alert("������ �������ּ���");
        usergender[0].focus();
        return false;
    }
    
    if(useremail.val()==""){
        alert("�̸����� �Է����ּ���");
       useremail.focus();
        return false;
    }
    
    if(userbirthday.val()==""){
        alert("������ �������ּ���");
        userbirthday.focus();
        return false;
    }
    
    if(userbirthday2.val()==""){
        alert("������ �������ּ���");
        userbirthday2.focus();
        return false;
    }
   
    if(userbirthday3.val()==""){
        alert("������ �������ּ���");
        userbirthday3.focus();
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
						<li class="active"><a href="/user/user_login.do">�α���</a></li>
						<li><a href="/user/user_join.do">ȸ������</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form method="post" id="joinSubmit"  action="/user/user_join_Action.do">
					<h3 style="text-align: center;">ȸ������</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="���̵�"
							name="user_id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="��й�ȣ"
						 id="user_password"	name="user_password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="��й�ȣ ���Է�"
						id="user_password_ck"	name="user_password_ck" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="����"
							name="user_name" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> 
							<input type="radio" id="user_gender" name="user_gender" autocomplete="off" value="����" >����</label> 
							<label class="btn btn-primary"> 
							<input type="radio" id="user_gender" name="user_gender" autocomplete="off" value="����" >����</label>
					</div>
					</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="�̸���"
							id="user_email" name="user_email" maxlength="20">
						</div>
						<div class="form-group">
							<select class="form-control" name="user_birthday" id="user_birthday"
								style="width: 40%; float: left;">
									<option>��</option>
							<%for (int year = 2019; year > 1919; year--) {
							%>
							<option value="<%=year%>"><%=year%></option>
							<%
							}
							%>
							</select>
							<select class="form-control" name="user_birthday2" id="user_birthday2"
							style="width: 30%; float: left;">
							<option>��</option>
							<%for (int month = 1; month < 13; month++) {
							%>
							<option value="<%=month%>"><%=month%></option>
							<%
								}
							%>
							</select>
							 <select class="form-control" name="user_birthday3" id="user_birthday3"
							style="width: 30%; float: left;">
							<option>��</option>
							<%for (int day = 1; day < 32; day++) {
							%>
							<option value="<%=day%>"><%=day%></option>
							<%
								}
							%>
						</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="��ȭ��ȣ" id="user_phoneNumber"
								name="user_phoneNumber" maxlength="20">
					</div>
				
				</form>
					<button type="button" onclick="submit()" class="btn btn-primary form-control"> ȸ������</button>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>