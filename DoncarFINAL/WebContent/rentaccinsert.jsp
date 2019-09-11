<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>렌트 승인신청</title>
</head>
<script type="text/javascript">
		function popUp(self){
			var id = $(self).prop('id');
			window.open("./calendar/calendar.jsp?id="+id,"","left=600px,top=300px,width=600px,height=300px");
		}
</script>
<body>
<%@ include file="./include/header.jsp" %>
	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="rentacc_insertres">
	<h3>
		<img src="image\car4.jpeg" style="width:50px; height:50px;"/>	
		렌트 승인신청
	</h3>
	<table border="1" class="table table-striped table-hover">
		<thead>
		<tr>
			<th>신청글번호</th>
			<td><input type="text" name="rent_board_no" readonly="readonly" value="${param.seq }"> </td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="rentacc_nickname" value="${MemberDto.member_nickname }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>날짜선택</th>
			<td>
				<input type="text" id="startdate" name="rentacc_start_date" readonly="readonly" value="시작일" onclick="popUp(this);">
				<input type="text" id="enddate" name="rentacc_end_date" readonly="readonly" value="종료일" onclick="popUp(this);">
			</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;">남길말</th>
			<td><textarea rows="10" cols="60" name="rentacc_comment" class="noresize"></textarea></td>
		</tr>	
		</thead>
		<tbody>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-default pull-right"	 value="확인">
				<input type="button" class="btn btn-default pull-right"	 value="취소" onclick="location.href='doncar.do?command=rentboard_selectone&rent_board_no=${param.seq}'">
			</td>
		</tr>
		</tbody>
	</table>
	</form>
<%@ include file="./include/footer.jsp" %>	

</body>
</html>