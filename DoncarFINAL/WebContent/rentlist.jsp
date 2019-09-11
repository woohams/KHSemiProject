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
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>RENTLIST</title>
<%@include file="./include/paging.jsp" %>
<script type="text/javascript" src="./js/mapselect.js"></script>
<script type="text/javascript">
		function popUp(self){
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
			});
			
		});

</script>

<style type="text/css">
#rentinsert{

	padding-left: 50px;
	padding-top: 25px;
	padding-bottom: 50px;
}
#page{

	background:skyblue; 
	text-align:center
}
.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 23px;
  height: 24px;
  border: 0;
  background: url('contrasticon.png');
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 23px;
  height: 25px;
  border: 0;
  background: url('contrasticon.png');
  cursor: pointer;
}

</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container">
	<h3>검색 설정 칸 입니다</h3>
	
<form action="doncar.do" method="get">
	<input type="hidden" name="command" value="rentboard_selectlist">
	<table border="1" class="table table-striped table-hover">
		<col width="200px">
		<col width="600px">
		<col width="400px">
		<col width="400px">
		<thead>
		<tr>
			<th>제조사</th>
			<td id="rent_company">
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="rent_company" value="">전체
						<input type="radio" class="form-check-input" name="rent_company" value="KIA" style="margin-left:10px;">KIA
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
			<td id="rent_size">
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="rent_size" value="">전체
						<input type="radio" class="form-check-input" name="rent_size" value="경차" style="margin-left:10px;">경차
						<input type="radio" class="form-check-input" name="rent_size" value="소형" style="margin-left:10px;">소형
						<input type="radio" class="form-check-input" name="rent_size" value="준중형" style="margin-left:10px;">준중형
						<input type="radio" class="form-check-input" name="rent_size" value="중형" style="margin-left:10px;">중형
						<input type="radio" class="form-check-input" name="rent_size" value="준대형" style="margin-left:10px;">준대형
						<input type="radio" class="form-check-input" name="rent_size" value="대형" style="margin-left:10px;">대형
						<input type="radio" class="form-check-input" name="rent_size" value="SUV" style="margin-left:10px;">SUV
					</label>
				</div>
			</td>
		</tr>
		
		<tr>
			<th>연 료</th>
			<td id="rent_fuel">
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="rent_fuel" value="">전체
						<input type="radio" class="form-check-input" name="rent_fuel" value="경유" style="margin-left:10px;">경유
						<input type="radio" class="form-check-input" name="rent_fuel" value="휘발유" style="margin-left:10px;">휘발유
						<input type="radio" class="form-check-input" name="rent_fuel" value="하이브리드" style="margin-left:10px;">하이브리드
					</label>
				</div>
			</td>
		</tr>
		
		<tr>
			<th>가 격</th>
			<td>
				<div class="slidecontainer">
					<input type="range" class="slider" id="rent_price" name="rent_price" min="0" step="10000" max="50000" value="0">
					<span id="rent_price_value">0</span>원
				</div>
			</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>
				<input type="text" id="startdate" placeholder="시작일" readonly="readonly" onclick="popUp(this);">
				<input type="text" id="enddate" placeholder="종료일" readonly="readonly" onclick="popUp(this);">
			</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>
				<input type="hidden" readonly="readonly" name="rent_location" value="">
				<select class="cd_list">
					<option>시</option>
				</select> 
				<select class="addr_list">
					<option>군/구</option>
				</select>
			</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-info" value="검색">
			</td>
		</tr>
		</tbody>
	</table>
	</form>
</div>
	<hr/>
<div id="rentinsert">
	<h3>
	
		<img src="image\car4.jpeg" style="width:50px; height:50px;"/>	
		
		렌트차량 목록
	</h3>
	<input type="button" style="margin-bottom: 1%;" value="글쓰기" class="btn btn-info pull-right" onclick="location.href='doncar.do?command=rentboard_insert'">
	<%@ include file="./include/searchform.jsp" %>
	
	<table border="1" class="table table-striped table-hover">

	<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan="12">---------------------------------등록된 글이 없습니다.-----------------------------------</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list }" var="dto">
		<tr class="dto">
		<td>
		<div class="row">
        	<div class="col-md-4">
        	<img style="width: 250px;height: 250px;" alt="${dto.rent_img }" src="${dto.rent_img }">
        	</div>
        	<div class="col-md-1">
        	진행도
        	</div>
        	<div class="col-md-7">
        		${dto.rent_process }
        	</div>
        	 <div class="clearfix visible-xs-block"></div>

        	<div class="col-md-1">
        		제목
        	</div>
        	<div class="col-md-7">
        		<a href="doncar.do?command=rentboard_selectone&rent_board_no=${dto.rent_board_no }">${dto.rent_title }</a>
        	</div>
        	 <div class="clearfix visible-xs-block"></div>
        	<div class="col-md-1">
        		작성자
        	</div>
        	<div class="col-md-7">
        		${dto.rent_writer }
        	</div>
        	 <div class="clearfix visible-xs-block"></div>
        	 <div class="col-md-7">
        		 ${dto.rent_company } / ${dto.rent_size } / ${dto.rent_fuel } / ${dto.rent_carname } / ${dto.rent_content } /    ${dto.rent_price }원 /   ${dto.rent_location } /	 ${dto.rent_regdate }  
        	 </div>
   		</div>
   		</td>
   		</tr>
	
		</c:forEach>
	</c:otherwise>
	</c:choose>
	<tr>
		<td>
			<span id="page"></span>
		</td>
	</tr>
	</table>
</div>
<%@ include file="./include/footer.jsp" %>	
</body>
</html>