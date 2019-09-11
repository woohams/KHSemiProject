<%@page import="com.doncar.mail.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일인증</title>
</head>
<body>
	<form action="doncar.do" method="post">
		<input type="hidden" name="command" value="email_findid">
		<input type="text" name="mail_addr" placeholder="이메일을 입력해주세요">
		<input type="submit" value="등록된 이메일로 ID찾기">
	</form>
</body>
</html>