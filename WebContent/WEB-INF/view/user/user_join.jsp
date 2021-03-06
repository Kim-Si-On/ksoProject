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
alert("잘못된 접근입니다.");
top.location.href="/main.do";
<%}%>

function submit() {
    
    var userid = $("input[name=user_id]");
    var userpassword = $("#user_password");
    var userpasswordck = $("#user_password_ck");
    var username = $("input[name=user_name]");
    var usergender = $("input[name=user_gender]");
    var useremail = $("input[name=user_email]");
    var userbirthday = $("input[name=user_birthday]");
    var userbirthday2 = $("input[name=user_birthday2]");
    var userbirthday3 = $("input[name=user_birthday3]");
    var userphoneNumber = $("input[name=user_phoneNumber]");
    
	var joinSubmit =$("#joinSubmit");
    
    if(userid.val() == ""){
        alert("아이디를 입력해 주세요"); 
        userid.focus();
        return false;
    }
    
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
  	
    
    var genderCheck = false; //체크 여부 확인 변수
	for(var i=0;i<usergender.length;i++){
		if (usergender[i].checked){
			genderCheck = true;
		}
	}
	
	if(genderCheck==false){
		alert("성별을 선택해주세요.");
		usergender[0].focus();
		return false;
	}	
    
    
    
    if(useremail.val()==""){
        alert("이메일을 입력해주세요");
       useremail.focus();
        return false;
    }
    
    if(user_birthday.value=="년"){
        alert("생일을 선택해주세요1");
        user_birthday.focus();
        return false;
    }
    
    if(user_birthday2.value=="월"){
        alert("생일을 선택해주세요2");
        user_birthday2.focus();
        return false;
    }
   
    if(user_birthday3.value=="일"){
        alert("생일을 선택해주세요3");
        user_birthday3.focus();
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
						<li class="active"><a href="/user/user_login.do">로그인</a></li>
						<li><a href="/user/user_join.do">회원가입</a></li>
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
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="user_id" id="user_id" maxlength="20">
							<input type="button" class="btn btn-success" value="아이디 중복확인" id="idCk" />
								<!-- 이메일이 중복이면  유효성 검사를 통해 안넘어가게 -->
								<input type="hidden" id="conf"value="0"/>
					</div>
					
					<div class="form-group">
						
						<input type="password" class="form-control" placeholder="비밀번호"
						 id="user_password"	name="user_password" maxlength="20">
						 <div id="textChange"></div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 재입력"
						id="user_password_ck"	name="user_password_ck" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="성명"
							name="user_name" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> 
							<input type="radio" id="user_gender" name="user_gender" autocomplete="off" value="남자" >남자</label> 
							<label class="btn btn-primary"> 
							<input type="radio" id="user_gender" name="user_gender" autocomplete="off" value="여자" >여자</label>
					</div>
					</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
							id="user_email" name="user_email" maxlength="20">
						</div>
						<div class="form-group">
							<select class="form-control" name="user_birthday" id="user_birthday"
								style="width: 40%; float: left;">
									<option value="년">년</option>
							<%for (int year = 2019; year > 1919; year--) {
							%>
							<option value="<%=year%>"><%=year%></option>
							<%
							}
							%>
							</select>
							<select class="form-control" name="user_birthday2" id="user_birthday2"
							style="width: 30%; float: left;">
							<option value="월">월</option>
							<%for (int month = 1; month < 13; month++) {
							%>
							<option value="<%=month%>"><%=month%></option>
							<%
								}
							%>
							</select>
							 <select class="form-control" name="user_birthday3" id="user_birthday3"
							style="width: 30%; float: left;">
							<option value="일">일</option>
							<%for (int day = 1; day < 32; day++) {
							%>
							<option value="<%=day%>"><%=day%></option>
							<%
								}
							%>
						</select><br><br>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="전화번호" id="user_phoneNumber"
								name="user_phoneNumber" maxlength="20">
					</div>
				
				</form>
					<button type="button" onclick="submit()" class="btn btn-primary form-control"> 회원가입</button>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<script>
$("#user_password").keyup(function(){
	var kim = $("#user_password").val();
	var txtChange =$("#textChange");
	
	//정규식
	if(!checkUnion(kim)){
		txtChange.css('color','red');
		txtChange.html("보안이 취약합니다.")
	}else{
		txtChange.css('color','green');
		txtChange.html("적절한 비밀번호 입니다.")
	}
})
	function checkUnion(str){
		var reg1=/^[a-zA-Z0-9]{8,20}$/;//대문자 소만자 8 -20 자리 허용
		var reg2=/[a-zA-Z]/g;
		var reg3=/[0-9]/g;
		return(reg1.test(str) && reg2.test(str) &&reg3.test(str))
	}
	

//아이디 중복체크
$(function() {
/////이메일 중복체크////////
	 //idck 버튼을 클릭했을 때 
	    
	    $("#idCk").click(function() {
	    	  var idck = 0;
	    	  
	        //userid 를 param.
	         var userid =  $("#user_id").val(); 
	        
	        $.ajax({
	            type : 'POST',
	            data : {'user_id':userid} ,// parameter
	           	// resquest.getParameter X
	           	// @requestParameter("userid");
	           
	            url : "/user/userChecked.do",
				//dataType : "json",
				//contentType: "application/json; charset=UTF-8",
	            success : function(data){ // return 갑 {
	            
	            	console.log(data);
	                if (data>0) {
	                     
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    
	                	$("#conf").val("0");// 회원가입 유효성검사를 위해 바꾸는 값
	                    $("#user_id").focus();
	                   
	                
	                
	                } else {
	                    alert("사용가능한 아이디입니다.");
	                	$("#conf").val("1");
	                
	                    $("#user_id").focus();
	                  
	                    idck = 1;
	                   // $("#idCk").val("가능합니다");
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	               
	            }
	        });
	    });
});
	
	
	</script>

</body>
</html>