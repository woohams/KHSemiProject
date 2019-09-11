<%@page import="com.doncar.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>관리자 페이지</title>
<style type="text/css">
#adminmain{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}

</style>

</head>

<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

<div id="adminmain">
	<h3>
		<img src="image\admin.jfif" style="width:50px; height:50px;"/>	
		관리자 페이지
	</h3>
	${MemberDto.member_nickname }님 환영합니다!<br/>
	${MemberDto.member_nickname }님의 계정은 ${MemberDto.member_roll } 계정이시군요! <br/>
	<input type="button" class="btn btn-info" value="내정보" onclick="location.href='doncar.do?command=member_selectone&member_no=${MemberDto.member_no}'"/>
	<input type="button" class="btn btn-info" value="회원정보" onclick="location.href='doncar.do?command=member_selectlist'">
</div>
<%@ include file="./include/footer.jsp" %>	
</div>
</body>
</html>


