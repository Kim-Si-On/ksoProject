<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String msg = (String)request.getAttribute("msg");
String url = (String)request.getAttribute("url");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>처리페이지</title>
<script type="text/javascript">
   <%if(msg.equals("")){%>
         top.location.href="<%= url%>";
      <%}else{ %>
         alert('<%= msg%>');
         location.href="<%= url%>";
      <%} %>
</script>
</head>
<body>

</body>
</html>