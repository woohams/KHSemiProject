<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"	rel="stylesheet">
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>

<title>RENT INSERT</title>

<style type="text/css">
#btn_group{
margin-left: 90%;
}
#rentinsert {
	padding-left: 50px;
	padding-top: 25px;
	padding-bottom: 50px;
}

</style>
</head>
<script type="text/javascript">

	function popUp(){
		window.open("./map.jsp","","left=300px,top=20px,width=1000px,height=500px");
	}
	
	function popUpImg(){
		window.open("imguploadform.jsp","","left=600px,top=50px,width=600px,height=600px");
	}


$(function(){
	$("#price").change(function(){
		var price = $("#price").val();
	$("#price_value").html(price);
		
	})
});	
</script>
<script type="text/javascript" src="./js/mapselect.js"></script>
<body>
	<%@ include file="./include/header.jsp"%>
	<div id="rentinsert">
		<h3>
			<img src="image\car5.jpeg" style="width: 50px; height: 50px;" /> 렌트카
			등록
		</h3>


		<form action="doncar.do" method="post">
			<input type="hidden" name="command" value="rentinsertres">
				<table border="1" class="table table-striped table-hover">
					<thead>
					<tr>
						<th>진행도</th>
						<td><input type="text" name="rent_process" value="대기" readonly="readonly"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="rent_title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="rent_writer" value="${MemberDto.member_nickname }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>제조사</th>
						<td id="company">
							<div class="form-check">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="rent_company" value="KIA">KIA
									<input type="radio" class="form-check-input" name="rent_company" value="SSANGYONG" style="margin-left:10px;">SSANGYONG
									<input type="radio" class="form-check-input" name="rent_company" value="CHEVORLET" style="margin-left:10px;">CHEVORLET
									<input type="radio" class="form-check-input" name="rent_company" value="HYUNDAI" style="margin-left:10px;">HYUNDAI
									<input type="radio" class="form-check-input" name="rent_company" value="SAMSUNG" style="margin-left:10px;">SAMSUNG
								</label>
							</div>
						</td>
					</tr>

					<tr>
						<th>크 기</th>
						<td id="size">
							<div class="form-check">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="rent_size"  value="경차">경차 
									<input type="radio" class="form-check-input" name="rent_size"  value="소형" style="margin-left:10px;">소형
									<input type="radio" class="form-check-input" name="rent_size"  value="준중형" style="margin-left:10px;">준중형
									<input type="radio" class="form-check-input" name="rent_size"  value="중형" style="margin-left:10px;">중형 
									<input type="radio" class="form-check-input" name="rent_size"  value="준대형" style="margin-left:10px;">준대형 
									<input type="radio" class="form-check-input" name="rent_size"  value="대형" style="margin-left:10px;">대형 
									<input type="radio" class="form-check-input" name="rent_size"  value="SUV" style="margin-left:10px;">SUV
								</label>
							</div>
						</td>
					</tr>

					<tr>
						<th>연 료</th>
						<td id="fuel">
							<div class="form-check">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="rent_fuel"  value="경유">경유
						 			<input type="radio" class="form-check-input" name="rent_fuel"  value="휘발유" style="margin-left:10px;">휘발유
						 			<input type="radio" class="form-check-input" name="rent_fuel"  value="하이브리드" style="margin-left:10px;">하이브리드
						 		</label>
						 	</div>
						</td>
					</tr>

					<tr>
						<th style="vertical-align: middle;">가 격</th>
						<td>
							<input type="range" id="price" name="rent_price" min="0" step="10000" max="50000" value="0">
							<span id="price_value">0</span>원</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>
							<input type="hidden" name="rent_location" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option>군/구</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>차량이미지</th>
						<td><input type="text" name="rent_img" id="rent_img" readonly="readonly">
							<input type="button" id="imageUpload" class="btn btn-info" value="대표이미지 설정" onclick="popUpImg();"></td>
					</tr>
					<tr>
						<th>차량이름</th>
						<td><input type="text" name="rent_carname" value=""></td>
					</tr>
					<tr>
						<th>차번호</th>
						<td><input type="text" name="rent_carno"></td>
					</tr>
					<tr>
						<th>차량위치설정</th>
						<td>
							<button type="button" class="btn btn-info" onclick="popUp();">좌표설정!</button> 
							<input type="hidden" id="x" name="rent_x_point">
							<input type="hidden" id="y" name="rent_y_point">
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">내용</th>
						<td>
							<textarea id="summernote" name="rent_content" style="width:80%; height:20%;"></textarea>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
						<div id="btn_group">
							<input type="button" class="btn btn-info"	 value="취소" onclick="location.href='doncar.do?command=rentboard_selectlist'" />
							<input type="submit" class="btn btn-info"	 value="확인" /> 
						</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%@ include file="./include/footer.jsp"%>
	<%@ include file="./js/summernote.html"%>
</body>
</html>