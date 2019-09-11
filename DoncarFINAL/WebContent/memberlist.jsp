<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>회원리스트</title>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

	<form action="" method="post">
		<input type="hidden" name="command" value="member_selectlist"/>
		<input type="hidden" name="member_no" value="${MemberDto.member_no }"/>
		<table border="1" class="table table-striped table-hover">
			
			
		
		</table>	
	</form>

<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>