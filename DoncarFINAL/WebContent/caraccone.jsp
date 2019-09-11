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
<title>Car Acc One</title>
<style type="text/css">
	table,th,td{
		border: 1px solid black;
	}
</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c0a0d22b781ecb062840d3c4133c7220"></script>
<script type="text/javascript" src="./js/setMap.js"></script>
<body>
<input type="hidden" id="x" value="${dto.caracc_xpoint }">
<input type="hidden" id="y" value="${dto.caracc_ypoint }">
<div class="container">
<%@ include file="./include/header.jsp" %>
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>진행도</th>
			<td>${dto.caracc_process }</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${dto.caracc_nickname }</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;">하차지역</th>
			<td>
				<div id="map" style="width:350px; height:350px;"></div>
			</td>
		</tr>
		<tr>
			<th width="20%;" style="vertical-align:middle;">코멘트</th>
			<td style="height:200px;">${dto.caracc_coment }</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-default pull-right"	 value="수정" onclick="location.href='doncar.do?command=caracc_update&caracc_no=${dto.caracc_no }'">
				<input type="button" class="btn btn-default pull-right"	 value="삭제" onclick="location.href='doncar.do?command=caracc_delete&caracc_no=${dto.caracc_no }'">
				<input type="button" class="btn btn-default pull-right"	 value="목록" onclick="location.href='doncar.do?command=caracc_selectlist'">
			</td>
		</tr>
		</tbody>
	</table>
	<%@ include file="./include/footer.jsp" %>	
</div>

</body>
</html>