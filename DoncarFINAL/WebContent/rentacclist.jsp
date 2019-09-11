<%@page import="com.doncar.biz.RentBoardBiz"%>
<%@page import="com.doncar.dto.RentBoardDto"%>
<%@page import="java.util.List"%>
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
<title>RENTACC LIST</title>
<%@include file="./include/paging.jsp" %>
</head>
<body>
<%@ include file="./include/header.jsp" %>
	<h3>
		<img src="image\car9.png" style="width:50px; height:50px;"/>	
		렌트카 승인리스트
	</h3>	
	<table border="1" class="table table-striped table-hover">
		<col width="80">
		<col width="80">
		<col width="250">
		<col width="250">
		<col width="80">
		<col width="200">
		<col width="80">
		
		<thead>
		<tr>
			<th>승인번호</th>
			<th>렌트게시판번호</th>
			<th>시작날짜</th>
			<th>끝나는날짜</th>
			<th>승인</th>
			<th>삭제상태</th>
			<th>남길 말</th>
			<th>닉네임</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="8" style="text-align: center;">
						등록된 글이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr class="dto">
						<td><a href="doncar.do?command=rentacc_selectone&rentacc_no=${dto.rentacc_no }">${dto.rentacc_no }</a></td>
						<td>${dto.rentacc_board_no }</td>
						<td>${dto.rentacc_start_date }</td>
						<td>${dto.rentacc_end_date }</td>
						<td>${dto.rentacc_acc }</td>
						<td>${dto.rentacc_delflag }</td>
						<td>${dto.rentacc_comment }</td>
						<td>${dto.rentacc_nickname }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="1">
				<input type="button" class="btn btn-default pull-right" value="글쓰기" onclick="location.href='doncar.do?command=rentacc_insert'">
				<span id="page"></span>
			</td>
		</tr>
		</tbody>
	</table>
<%@ include file="./include/footer.jsp" %>	
</body>
</html>