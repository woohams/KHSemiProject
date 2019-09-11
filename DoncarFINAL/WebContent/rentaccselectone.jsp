<%@page import="com.doncar.dto.RentAccDto"%>
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
<%@ include file="./js/summernote.html" %>
<title>렌트승인 확인</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container">
	<h3>
		<img src="image\ok.png" style="width:50px; height:50px;"/>	
		렌트승인 확인
	</h3>
	<form action="doncar.do" method="post">	
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>승인번호</th>
			<td>${dto.rentacc_no}</td>
		</tr>
		<tr>
			<th>렌트게시판번호</th>
			<td>${dto.rent_board_no}</td>
		</tr>
		<tr>
			<th>진행도</th>
			<td>${dto.rentacc_process }</td>
		</tr>
		<tr>
			<th>시작날짜</th>
			<td>${dto.rentacc_start_date}</td>
		</tr>
		<tr>
			<th>끝나는날짜</th>
			<td>${dto.rentacc_end_date}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${dto.rentacc_nickname}</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;" width="20%;">남기는말</th>
			<td height="200px;">${dto.rentacc_comment}</td>
		</tr>
		<tbody>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-default pull-right"	value="삭제" onclick="location.href='doncar.do?command=rentacc_delete&rentacc_no=${dto.rentacc_no}'">
				<input type="button" class="btn btn-default pull-right"	value="메인" onclick="location.href='main.jsp'">
			</td>
		</tr>
		</tbody>
	</table>	
	</form>
</div>
<%@ include file="./include/footer.jsp" %>	
</body>
</html>