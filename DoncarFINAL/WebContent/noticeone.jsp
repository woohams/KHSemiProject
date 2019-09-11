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
#noticeonelist{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
</style>

<title>공지사항 자세히보기</title>
<style type="text/css">
thead > tr> th{
	weight: 100px;
}

</style>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div>
	<h3 id="noticeonelist">
		<img src="image\notice3.jpg" style="width:50px; height:50px;"/>	
		공지사항 자세히보기
	</h3>

	<form action="doncar.do" method="post">
	<input type="hidden" name="comman" value="update"/>
	<input type="hidden" name="notice_no" value="${dto.notice_no }"/>
		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>작성자</th>
				<td>${dto.notice_writer }</td>
			</tr>
			<tr>
				<th>제   목</th>
				<td>${dto.notice_title }</td>
			</tr>
			<tr>
				<th width="20%;" style="vertical-align:middle;">내 용</th>
				<td style="height:400px;">${dto.notice_content }</td>
			</tr>
		</thead>
			<tbody>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-default pull-right" value="수정" onclick="location.href='doncar.do?command=noticeboard_update&notice_no=${dto.notice_no}'"/>
					<input type="button" class="btn btn-default pull-right" value="삭제" onclick="location.href='doncar.do?command=noticeboard_delete&notice_no=${dto.notice_no}'"/>
					<input type="button" class="btn btn-default pull-right" value="목록" onclick="location.href='doncar.do?command=noticeboard_selectlist'"/>
				</td>
			</tr>
			</tbody>
		</table>
	</form>
	</div>
</div>
</body>
</html>