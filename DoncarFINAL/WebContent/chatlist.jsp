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
<title>Insert title here</title>
<style type="text/css">
#charsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
</style>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<%@include file="./include/paging.jsp" %>
<div id="charsort">
<table border="1" class="table table-striped table-hover">
		<col width="120px">
		<col width="200px">
		<col width="450px">
		<col width="120px">
	<tr>
		<th>채팅번호</th>
		<th>상대방</th>
		<th>방제목</th>
		<th>생성일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4">------------------채팅방이없습니다--------------</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr class="dto">
					<td>${dto.chat_no }</td>
					<c:choose>
						<c:when test="${dto.user1 eq MemberDto.member_nickname }">
							<td>${dto.user2 }</td>
						</c:when>
						<c:otherwise>
							<td>${dto.user1 }</td>
						</c:otherwise>
					</c:choose>
					<td><a href="msg.do?command=selectlist_msg&chat_no=${dto.chat_no }">${dto.content }</a></td>
					<td>${dto.regdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="4">
			<span id="page"></span>
		</td>
	</tr>
</table>
</div>
</div>
<%@ include file="./include/footer.jsp" %>	

</body>
</html>