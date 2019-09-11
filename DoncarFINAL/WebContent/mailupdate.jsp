<%@page import="com.doncar.mail.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>메일인증</title>
<style type="text/css">
input{
margin-left:2%;
margin-top: 2%;
}
.btn{
margin-bottom: 4%;
}
</style>
</head>
<body>
	<form action="doncar.do" method="post">
		<input type="hidden" name="command" value="sendmailUpdate"> 
		<input type="hidden" name="member_no" value="${MemberDto.member_no }">
		<input type="text" name="mail_addr" placeholder="이메일을 입력해주세요">
		<input type="submit" class="btn btn-info" value="인증메일 보내기">
	</form>
</body>
</html>