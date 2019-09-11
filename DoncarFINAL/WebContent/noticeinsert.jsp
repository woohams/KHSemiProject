<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
#noticeinsertsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
</style> 

<title>공지사항 글쓰기</title>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="noticeinsertsort">
	<h3>
		<img src="image\notice1.png" style="width:50px; height:50px;"/>	
		공지사항 글쓰기
	</h3>
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="noticeboard_insertres">
		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="notice_writer" value="${MemberDto.member_nickname }"/></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><input type="text" name="notice_title"/></td>
			</tr>
			<tr>
				<th style="vertical-align:middle;">내   용</th>
				<td><textarea id="summernote" name="notice_content" class="form-control noresize" ></textarea></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<input class="btn btn-default pull-right" type="submit" value="완료"/>
					<input class="btn btn-default pull-right" type="button" value="목록" onclick="location.href='doncar.do?command=noticeboard_selectlist'"/>
				</td>
			</tr>
			</tbody>
		</tbody>
		</table>
	</form>
	</div>
<%@ include file="./include/footer.jsp" %>	
<%@ include file="./js/summernote.html" %>
</div>
</body>
</html>