<%@page import="com.doncar.dto.RentBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>RENT SELECTONE</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" >
<style type="text/css">
#rentselectone{

	padding-left: 50px;
	padding-top: 25px;
	padding-bottom: 50px;
}

</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div id="rentselectone">
	<h3>
		<img src="image\car2.jpeg" style="width:50px; height:50px;"/>	
		렌트카 상세보기
	</h3>
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<td>${dto.rent_board_no}</td>
		</tr>
		
		<tr>
			<th>상태</th>
			<td>${dto.rent_process}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.rent_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.rent_writer}</td>
		</tr>
		<tr>
			<th>차량회사</th>
			<td>${dto.rent_company}</td>
		</tr>
		<tr>
			<th>차량이름</th>
			<td>${dto.rent_carname}</td>
		</tr>
		<tr>
			<th>차량크기</th>
			<td>${dto.rent_size}</td>
		</tr>
		<tr>
			<th>차량연료</th>
			<td>${dto.rent_fuel}</td>
		</tr>
		<tr>
			<th>이용가격</th>
			<td>${dto.rent_price}원</td>
		</tr>
		<tr>
			<th>차량지역</th>
			<td>${dto.rent_location}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.rent_regdate}</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;">이미지</th>
			<td>
				<img alt="${dto.rent_img}" src="${dto.rent_img}">
			</td>
		</tr>
		<tr>
			<th width="20%;" style="vertical-align:middle;">내용</th>
			<td style="height:400px;">${dto.rent_content}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
			<c:choose>
				<c:when test="${empty MemberDto }">
				</c:when>
				<c:otherwise>
					<c:if test="${MemberDto.member_nickname eq dto.rent_writer }">
						<input type="button" class="btn btn-default pull-right" value="삭제" onclick="location.href='doncar.do?command=rentboard_delete&rent_board_no=${dto.getRent_board_no()}'">
						<input type="button" class="btn btn-default pull-right" value="수정" onclick="location.href='doncar.do?command=rentboard_update&rent_board_no=${dto.getRent_board_no()}'">
					</c:if>
					<c:if test="${MemberDto.member_nickname ne dto.rent_writer }">
						<input type="button" class="btn btn-default pull-right"	value="신청" onclick="location.href='rentaccinsert.jsp?seq=${dto.rent_board_no }'">
					</c:if>
				</c:otherwise>
			</c:choose>
				<input type="button" class="btn btn-default pull-right"	value="목록" onclick="location.href='doncar.do?command=rentboard_selectlist'">
			</td>
		</tr>
	</tbody>
	</table>
	<%@ include file="./include/comment.jsp"%>	
</div>
	<%@ include file="./include/footer.jsp" %>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
