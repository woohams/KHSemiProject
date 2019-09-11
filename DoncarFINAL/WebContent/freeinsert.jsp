<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
#freeinsertsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
#btn_group{
margin-left: 88%;
}
</style>
<title>자유게시판 글쓰기</title>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="freeinsertsort">
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="freeboard_insertres"/>
		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="free_writer" readonly="readonly" value="${MemberDto.member_nickname }"/></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><input type="text" name="free_title"/></td>
			</tr>
			<tr>
				<th style="vertical-align:middle;">내   용</th>
				<td><textarea id="summernote" name="free_content" class="form-control"></textarea></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
				<div id="btn_group">
					<input type="submit" class="btn btn-info " value="완료"/>
					<input type="button" class="btn btn-info " value="목록" onclick="location.href='doncar.do?command=freeboard_selectlist'"/>
				</div>
				</td>
			</tr>
		</tbody>
		</table>
	</form>
	</div>
<%@ include file="./include/footer.jsp" %>	
<%@ include file="./js/summernote.html" %>
</div>
</body>
</html>