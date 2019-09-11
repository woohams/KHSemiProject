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
<title>CarPool Update</title>
<style type="text/css">

	table,th,td{
		border: 1px solid black;
	}
	
	#carpoolupdate{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
	}
	
</style>
</head>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="./js/mapselect.js"></script>
<script type="text/javascript">

function popUp(){
	
	window.open("./map.jsp","","left=300px,top=300px,width=1000px,height=500px");
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
<div id="carpoolupdate">
	<h3>
		<img src="image\car3.jpeg" style="width:50px; height:50px;"/>	
		카풀 글 수정하기
	</h3>
	<form action="doncar.do" method="get">
	<input type="hidden" name="command" value="carboard_updateres">
	<input type="hidden" name="car_board_no" value="${dto.car_board_no }">
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>제목</th>
			<td><input type="text" name="car_board_title" value="${dto.car_board_title }"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="car_board_writer" value="${dto.car_board_writer }"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
			
				<input type="range" id="rent_price" name="car_board_price" min="0" step="10000" max="50000" value="${dto.car_board_price }" >
				<span id="rent_price_value">${dto.car_board_price }</span>원
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
				<input type="text" readonly="readonly" name="car_board_startpoint" value="${dto.car_board_startpoint }">
				<select class="cd_list">
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>도착지</th>
			<td>
				<input type="text" readonly="readonly" name="car_board_endpoint" value="${dto.car_board_endpoint }">
				<select class="cd_list">
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
		</tr>
		
				<tr>
					<th>출발지설정</th>
					<td>
						<button type="button" class="btn btn-info" onclick="popUp();">출발지설정하기</button> 
						<input type="hidden" id="x" name="car_board_x_point" value="${dto.car_board_x_point }">
						<input type="hidden" id="y" name="car_board_y_point" value="${dto.car_board_y_point }">
					</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;">내용</th>
			<td><textarea id="summernote" name="car_board_content">${dto.car_board_content }</textarea></td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="8">
				<input class="btn btn-info pull-right" type="submit" value="수정">
				<input class="btn btn-info pull-right" type="button" value="목록" onclick="location.href='doncar.do?command=carboard_selectlist'">
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