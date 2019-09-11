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
<title>Car Acc Update</title>
<script type="text/javascript">
function popUp(){
	
	window.open("./map.jsp","","left=300px,top=300px,width=1000px,height=500px");
}

</script>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
	<form action="doncar.do" method="get">
	<input type="hidden" name="command" value="caracc_updateres">
	<input type="hidden" name="caracc_no" value="${dto.caracc_no }">
	<table border="1" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>진행도</th>
			<td><input type="text" name="caracc_process" value="${dto.caracc_process }"></td>
		</tr>
		
		<tr>
			<th>좌표 설정</th>
			<td>
				<input type="hidden" id="x" name="caracc_xpoint" value="${dto.caracc_xpoint }">
				<input type="hidden" id="y" name="caracc_ypoint" value="${dto.caracc_ypoint }">
				<button type="button" class="btn btn-info" onclick="popUp();" style="margin-left:1%;">좌표설정</button> 
			</td>
		</tr>
		<tr>
			<th>acc</th>
			<td><input type="text" name="caracc_acc" value="${dto.caracc_acc }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="caracc_nickname" value="${dto.caracc_nickname }" readonly="readonly"></td>
		</tr>
		<tr>
			<th style="vertical-align: middle; width:15%;">코멘트</th>
			<td><textarea name="caracc_coment" placeholder="${dto.caracc_coment }" style="height:35%; width:70%;"></textarea></td>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-info pull-right" value="수정">
					<input type="button" class="btn btn-info pull-right" value="목록" onclick="location.href='doncar.do?command=caracc_selectlist">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<%@ include file="./include/footer.jsp" %>	
	</div>

</body>
</html>