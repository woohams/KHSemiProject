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
<title>Carpool 게시판 목록</title>
<%@include file="./include/paging.jsp" %>
<style type="text/css">

	table,th,td{
		border: 1px solid black;
	}
	
	#carpoolboard_sort{

	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
</style>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="./js/mapselect.js"></script>
<script type="text/javascript">
		function popUp(self){
			var id = $(self).prop('id');
			window.open("./calendar/calendar.jsp?id="+id,"","left=40px,top=20px,width=800px,height=450px");
		}
		$(function(){
			$('#startdate').on('change',function(){
				$('#enddate').val('');
			})
		})
</script>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id=carpoolboard_sort>
	<fieldset>
	<legend>검색설정칸입니다.</legend>
	<form action="doncar.do">
	<input type="hidden" name="command" value="carboard_selectlist">
	
	<table border="1" class="table table-striped table-hover">
		<thead>
		<tr>
			<th>출발일</th>
			<th>출발지</th>
			<th>도착지</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><input type="text" id="startdate" readonly="readonly"  placeholder="출발일" onclick="popUp(this);"></td>
			<td>
				<input type="hidden" readonly="readonly" name="car_board_startpoint" value="">
				<select class="cd_list">
					<option>시</option>
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
			<td>
				<input type="hidden" readonly="readonly" name="car_board_endpoint" value="">
				<select class="cd_list">
					<option>시</option>
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="조건검색" class="btn btn-info">
			</td>
		</tr>
		</tbody>
	</table>
	</form>
	</fieldset>
	
	<table border="1" class="table table-striped table-hover">
		<col width="80">
		<col width="200">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
	<thead>	
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>진행도</th>
			<th>작성자</th>
			<th>출발일</th>
			<th>출발지</th>
			<th>도착지</th>
			<th>작성 시간</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="8">작성된 글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr class="dto">
						<td>${dto.car_board_no }</td>
						<td>
							<a href="doncar.do?command=carboard_selectone&car_board_no=${dto.car_board_no }">${dto.car_board_title }</a>
						</td>
						<td>${dto.car_board_process }</td>
						<td>${dto.car_board_writer }</td>
						<td>${dto.car_board_startdate }</td>
						<td>${dto.car_board_startpoint }</td>
						<td>${dto.car_board_endpoint }</td>
						<td>${dto.car_board_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="8">
				<%@ include file="./include/searchform.jsp" %> 
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<input type="button" class="btn btn-info pull-right" value="글 작성" onclick="location.href='doncar.do?command=carboard_regist'">
				<span id="page"></span>

			</td>
		</tr>
	</tbody>	
	</table>
	<%@ include file="./include/footer.jsp" %>	
</div>
</div>
</body>
</html>