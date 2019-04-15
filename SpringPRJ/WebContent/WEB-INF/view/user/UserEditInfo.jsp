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
<title>내정보 수정</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript">

//작성자 여부체크
function doOnload(){
	var user_id = "<%=SESSION_USER_ID%>";
	
	
	if (user_id==""){
		alert("작성자만 수정할 수 있습니다.");
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
        alert("비밀번호를 입력해 주세요"); 
        userpassword.focus();
        return false;
    }
 
    if(userpassword.val() != userpasswordck.val()){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        userpassword_ck.focus();
        return false; 
    }
 
    if(username.val()==""){
        alert("이름을 입력해주세요");
        username.focus();
        return false;
    }
    
    if(useremail.val()==""){
        alert("이메일을 입력해주세요");
       useremail.focus();
        return false;
    }
   
   
    if(userphoneNumber.val()==""){
        alert("전화번호를 입력해주세요");
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
				<form method="post" id="joinSubmit" action="/user/UserUpdate.do">
					<h3 style="text-align: center;">회원정보 수정</h3>
					<div class="form-group"><br>
					<label>아이디 : <%=CmmUtil.nvl(uDTO.getUser_id())%></label>
					</div> 
					<div class="form-group">
					<label>성명 : <%=CmmUtil.nvl(uDTO.getUser_name())%></label> 
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							id="user_password" name="user_password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 재입력"
							id="user_password_ck" name="user_password_ck" maxlength="20">
					</div>
							<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
								name="user_email" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="전화번호"
								name="user_phoneNumber" maxlength="20">
					</div>
					<input type="hidden" name="user_seq" value="<%=uDTO.getUser_seq() %>" /> 
				</form>
				<button type="button" onclick="submit()" class="btn btn-success form-control">수정</button>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	 <script src="/js/bootstrap.min.js"></script>
</body>
</html>