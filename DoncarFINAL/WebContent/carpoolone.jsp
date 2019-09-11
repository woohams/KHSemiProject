<%@page import="com.doncar.dto.CarBoardDto"%>
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
<title>카풀 자세히보기</title>
<style type="text/css">
	#btn_group{
	margin-left: 82%;
	}
	table,td,th{
	
		border: 1px solid black;
	}
	#carpoolone{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c0a0d22b781ecb062840d3c4133c7220"></script>
<script type="text/javascript" src="./js/setMap.js"></script>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="carpoolone">

<input type="hidden" id="x" value="${dto.car_board_x_point }">
<input type="hidden" id="y" value="${dto.car_board_y_point }">
	<h3>
		<img src="image\car6.jpeg" style="width:50px; height:50px;"/>	
		카풀게시글 상세보기
	</h3>
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>제목</th>
			<td>${dto.car_board_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.car_board_writer }</td>
		</tr>
		<tr>
			<th>진행도</th>
			<td>${dto.car_board_process }</td>
		</tr>
		<tr>
			<th>출발일</th>
			<td>${dto.car_board_startdate }</td>
		</tr>
		<tr>
			<th>출발지</th>
			<td>${dto.car_board_startpoint }</td>
		</tr>
		<tr>
			<th>도착지</th>
			<td>${dto.car_board_endpoint }</td>
		</tr>
		<tr>
			<th width="20%;" style="vertical-align:middle;">내 용</th>
			<td style="height:400px;">${dto.car_board_content }</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;">출발지</th>
			<td>
				<div id="map" style="width:350px; height:350px;" ></div>
			</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
			<div id="btn_group">
			<c:choose>
				<c:when test="${empty MemberDto }">
				</c:when>
				<c:otherwise>
					<c:if test="${MemberDto.member_nickname eq dto.car_board_writer }">
						<input type="button" class="btn btn-info" value="수정" onclick="location.href='doncar.do?command=carboard_update&car_board_no=${dto.car_board_no }'">
						<input type="button" class="btn btn-info" value="삭제" onclick="location.href='doncar.do?command=carboard_delete&car_board_no=${dto.car_board_no }'">
					</c:if>
					<c:if test="${MemberDto.member_nickname ne dto.car_board_writer }">
						<input type="button" class="btn btn-info" value="신청" onclick="location.href='caraccinsert.jsp?seq=${dto.car_board_no }'">
					</c:if>
				</c:otherwise>
			</c:choose>
				<input type="button" class="btn btn-info" value="목록" onclick="location.href='doncar.do?command=carboard_selectlist'">
			</div>
			</td>
		</tr>
		</tbody>
		<%@ include file="./include/comment.jsp" %>
	</table>
</div>
	
	<%@ include file="./include/footer.jsp" %>	
</div>

</body>
</html>