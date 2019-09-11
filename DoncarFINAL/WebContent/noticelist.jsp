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
#nocitelistsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
</style>
<title>공지사항 리스트</title>
<%@include file="./include/paging.jsp" %>
</head>

<body>
	<div class="container">
	<%@ include file="./include/header.jsp"%>
	<div id="nocitelistsort">
	<h3>
		<img src="image\notice2.png" style="width:50px; height:80px;"/>	
		공지사항 리스트
	</h3>

	<table border="1" class="table table-striped table-hover">
		<col width="50px" />
		<col width="100px" />
		<col width="300px" />
		<col width="100px" />
	<thead>
		<tr>
			<th>번 호</th>
			<th>작성자</th>
			<th>제 목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5">-----작성된 글이 존재하지 않습니다.-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr class="dto">
						<td>${dto.notice_no }</td>
						<td>${dto.notice_writer }</td>
						<td><a
							href="doncar.do?command=noticeboard_selectone&notice_no=${dto.notice_no}">${dto.notice_title }</a></td>
						<td>${dto.notice_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
					<tr>
						<td colspan="4">
							<%@ include file="./include/searchform.jsp" %> 
						</td>
					</tr>
		<c:if test="${!empty MemberDto }">
			<c:choose>
				<c:when test="${MemberDto.member_roll eq 'ADMIN'}">
					<tr>
						<td colspan="4">
							<input type="button" value="글쓰기" class="btn btn-default pull-right" onclick="location.href='doncar.do?command=noticeboard_insert'">
						</td>
					</tr>
				</c:when>
			</c:choose>
		</c:if>
		<tr>
			<td colspan="4">
				<span id="page"></span>
			</td>
		</tr>
		</tbody>
	</table>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>