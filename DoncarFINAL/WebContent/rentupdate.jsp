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
<title>RENT UPDATE</title>
<style type="text/css">
#rentupdate{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
</style>
</head>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function popUp(){
	
	window.open("./map.jsp","","left=300px,top=300px,width=1000px,height=500px");
}
$(function(){
	var rent_company = '${dto.rent_company}';
	$("#rent_company input [value="+rent_company+"]").attr("checked",true);
	var rent_size = '${dto.rent_size}';
	$("#rent_size input [value="+rent_size+"]").attr("checked",true);
	var rent_fuel = '${dto.rent_fuel}';
	$("#rent_fuel input [value="+rent_fuel+"]").attr("checked",true);
	
	$("#rent_price").change(function(){
		var rent_price = $("#rent_price").val();
	$("#rent_price_value").html(rent_price);
		
	})
});	
</script>
<script type="text/javascript" src="./js/mapselect.js"></script>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

<div id="rentupdate">

	<h3>
		<img src="image\car1.jpeg" style="width:50px; height:50px;"/>	
		렌트카 정보 수정
	</h3>
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="rentupdateres">
	<input type="hidden" name="rent_board_no" value="${dto.rent_board_no}">
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>날짜</th>
			<td>${dto.rent_regdate }</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>${dto.rent_board_no}</td>
		</tr>
		<tr>
			<th>상태</th>
			<td	>${dto.rent_process}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.rent_writer}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="rent_title" value="${dto.rent_title }"></td>
		</tr>
						<tr>
					<th>제조사</th>
					<td id="rent_company">
						<input type="radio" name="rent_company" value="KIA">KIA 
						<input type="radio" name="rent_company" value="SSANGYONG">SSANGYONG 
						<input type="radio" name="rent_company" value="CHEVORLET">CHEVORLET 
						<input type="radio" name="rent_company" value="HYUNDAI">HYUNDAI 
						<input type="radio" name="rent_company" value="SAMSUNG">SAMSUNG
					</td>
				</tr>

				<tr>
					<th>크 기</th>
					<td id="rent_size">
					 	<input type="radio" name="rent_size"  value="경차">경차 
						<input type="radio" name="rent_size"  value="소형">소형
						 <input type="radio" name="rent_size" value="준중형">준중형
						 <input type="radio" name="rent_size" value="중형">중형 
						<input type="radio" name="rent_size"  value="준대형">준대형 
						<input type="radio" name="rent_size"  value="대형">대형 
						<input type="radio" name="rent_size"  value="SUV">SUV
					</td>
				</tr>

				<tr>
					<th>연 료</th>
					<td id="rent_fuel">
						<input type="radio" name="rent_fuel"  value="경유">경유
						 <input type="radio" name="rent_fuel" value="휘발유">휘발유
						 <input type="radio" name="rent_fuel" value="하이브리드">하이브리드
					</td>
				</tr>

				<tr>
					<th>가 격</th>
					<td>
						<input type="range" id="rent_price" name="rent_price" min="0" step="10000" max="50000" value="${dto.rent_price }">
						<span id="rent_price_value">${dto.rent_price }</span>원</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
					<input type="text" name="rent_location" value="${dto.rent_location }"> 
						<select class="cd_list">
							<option value="">시</option>
						</select> 
						<select class="addr_list">
							<option>군/구</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>차량위치설정</td>
					<td>
						<button type="button" onclick="popUp();">좌표설정!</button> 
						<input type="hidden" id="x" name="rent_x_point" value="${dto.rent_x_point }">
						<input type="hidden" id="y" name="rent_y_point" value="${dto.rent_y_point }">
					</td>
				</tr>
		<tr>
			<th>이미지</th>
			<td><input type="text" name="rent_img" value="${dto.rent_img}"></td>
		</tr>
		<tr>
			<th>차량이름</th>
			<td><input type="text" name="rent_carname" value="${dto.rent_carname}"></td>
		</tr>
		<tr>
		<td>내용</td>
			<td><textarea id="summernote" name="rent_content">${dto.rent_content }</textarea></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-default pull-right" value="확인">
				<input type="button" class="btn btn-default pull-right" value="취소" onclick="location.href='doncar.do?command=rentboard_selectone&rent_board_no=${dto.rent_board_no}'">
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