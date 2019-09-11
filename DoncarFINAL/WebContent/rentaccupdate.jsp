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
<title>RENTACC UPDATE</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>
	<h1>RentAccUpdate Page</h1>
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="rentaccupdateres">
	<input type="hidden" name="rentacc_no" value="${dto.rentacc_no}">
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>승인번호</th>
			<td>${dto.rentacc_no}</td>
		</tr>
		<tr>
			<th>렌트게시판번호</th>
			<td>${dto.rentacc_board_no}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${dto.rentacc_nickname}</td>
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
			<th>승인상태</th>
			<td>${dto.rentacc_acc}</td>
		</tr>
		<tr>
			<th>삭제상태</th>
			<td>${dto.rentacc_delflag}</td>
		</tr>
		<tr>
			<th>남기는말</th>
			<td><textarea rows="10" cols="60" name="rentacc_comment"  class="form-control noresize">${dto.rentacc_comment}</textarea></td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-default pull-right" value="수정">
				<input type="button" class="btn btn-default pull-right" value="취소" onclick="location.href='doncar.do?command=rentacc_selectone&rentacc_no=${dto.rentacc_no}'">
			</td>
		</tr>
		</tbody>
	</table>
	</form>
<%@ include file="./include/footer.jsp" %>	
</body>
</html>