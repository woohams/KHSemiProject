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
<title>Car Acc List</title>
<style type="text/css">

	table,th,td{
		border: 1px solid black;
	}
	
</style>
</head>
<%@include file="./include/paging.jsp" %>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>	
	<h1>CarAccList</h1>
	<table border="1" class="table table-striped table-hover">
		<col width="80">
		<col width="70">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<thead>
		<tr>
			<th>car acc 번호</th>
			<th>글 번호</th>
			<th>닉네임</th>
			<th>진행도</th>
			<th>위도</th>
			<th>경도</th>
			<th>코멘트</th>
			<th>acc</th>
		</tr>

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="8">작성된 글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr class="dto">
						<td>${dto.caracc_no}</td>
						<td>${dto.car_board_no }</td>
						<td><a href="doncar.do?command=caracc_selectone&caracc_no=${dto.caracc_no }">${dto.caracc_nickname }</a></td>
						<td>${dto.caracc_process }</td>
						<td>${dto.caracc_xpoint }</td>
						<td>${dto.caracc_ypoint }</td>
						<td>${dto.caracc_coment }</td>
						<td>${dto.caracc_acc }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</thead>
		<tbody>
		<tr>
			<td colspan="8">
				<input type="button" value="글 작성" class="btn btn-info pull-right" onclick="location.href='doncar.do?command=caracc_regist'"> <span id="page"></span>
			</td>
		</tr>
		</tbody>
	</table>

<%@ include file="./include/footer.jsp" %>	
</div>
</body>
</html>