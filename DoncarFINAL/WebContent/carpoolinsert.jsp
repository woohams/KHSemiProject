<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    
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
<title>Insert title here</title>
<style type="text/css">
	table,th,td{
		border: 1px solid black;
	}
	#carpoolinsertsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
	#btn_group{
	margin-left: 87%;
	}
</style>
</head>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="./js/mapselect.js"></script>
<script type="text/javascript">

function popUp(){
	
	window.open("./map.jsp","","left=40px,top=20px,width=800px,height=450px");
}

function popUpcal(self){
	var id = $(self).prop('id');
	window.open("./calendar/calendar.jsp?id="+id,"","left=600px,top=600px,width=600px,height=300px");
}


$(function(){
	$('#startdate').on('change',function(){
		$('#enddate').val('');
	})
	$("#rent_price").change(function(){
		var rent_price = $("#rent_price").val();
	$("#rent_price_value").html(rent_price);
		
	})
	
	
	
});	
</script>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="carpoolinsertsort">
	<h3>
		<img src="image\car8.jpeg" style="width:50px; height:50px;"/>	
		카풀 게시글 등록
	</h3>
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="carboard_insert">
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>제목</th>
			<td><input type="text" name="car_board_title"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="car_board_writer" readonly="readonly" value="${MemberDto.member_nickname }"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
			
				<input type="range" id="rent_price" name="car_board_price" min="0" step="10000" max="50000" value="0";>
				<span id="rent_price_value">0</span>원
			</td>
		</tr>
		<tr>
			<th>출발일</th>
			<td>
				<input type="text" id="startdate" name="car_board_startdate" placeholder="시작일" readonly="readonly" onclick="popUpcal(this);">
			</td>
		</tr>
		<tr>
			<th>출발지</th>
			<td>
				<input type="hidden" readonly="readonly" name="car_board_startpoint" value="">
				<select class="cd_list">
					<option>시</option>
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>도착지</th>
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
			<th>출발지 설정</th>
			<td>
				<button type="button" class="btn btn-info" onclick="popUp();">좌표설정!</button> 
				<input type="hidden" id="x" name="car_board_x_point">
				<input type="hidden" id="y" name="car_board_y_point">
			</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">내용</th>
			<td><textarea id="summernote" name="car_board_content" class="noresize"></textarea></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
			<div id="btn_group">
				<input type="submit" class="btn btn-info" value="글쓰기">
				<input type="button" class="btn btn-info" value="목록" onclick="location.href='doncar.do?command=carboard_selectlist'">
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