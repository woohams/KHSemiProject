<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
#freeonesort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
</style>
<title>자유게시판 상세보기</title>
</head>
<body>
<div class="container">
	<%@ include file="./include/header.jsp"%>
	<div id="freeonesort">
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="update"/>
	<input type="hidden" name="free_board_no" value="${dto.free_board_no }"/>
		<input type="hidden" name="command" value="update" /> 
		<input type="hidden" name="free_board_no" value="${dto.free_board_no }" />
		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>작성자</th>
				<td>${dto.free_writer }</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${dto.free_title }</td>
			</tr>
			<tr>
				<th width="20%;" style="vertical-align:middle;">내 용</th>
				<td style="height:400px;">${dto.free_content }</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">
				<c:if test="${!empty MemberDto}">
						<c:if test="${ MemberDto.member_nickname eq dto.free_writer }">
							<input type="button" class="btn btn-default pull-right" value="수정" onclick="location.href='doncar.do?command=freeboard_update&free_board_no=${dto.free_board_no}'" />
							<input type="button" class="btn btn-default pull-right" value="삭제" onclick="location.href='doncar.do?command=freeboard_delete&free_board_no=${dto.free_board_no}'" />
						</c:if>
					</c:if> 
					<input type="button" class="btn btn-default pull-right" value="목록" onclick="location.href='doncar.do?command=freeboard_selectlist'" />
				</td>
			</tr>
			</tbody>
		</table>
	</form>
	</div>

	<%@ include file="./include/comment.jsp"%>
<%@ include file="./include/footer.jsp" %>		
</div>
</body>
</html>