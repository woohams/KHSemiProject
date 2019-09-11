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
<title>Car Acc Insert</title>
<style type="text/css">
	table,th,td{
		border:1px solid black;
	}
</style>
</head>
<script type="text/javascript">
function popUp(){
	
	window.open("./map.jsp","","left=300px,top=300px,width=1000px,height=500px");
}

</script>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

	<form action="doncar.do" method="post">
	<input type="hidden" name="command" value="caracc_insert">
	<table border="1">
		<tr>
			<th>카풀게시판번호</th>
			<td><input type="text" name="car_board_no" readonly="readonly" value="${param.seq }"></td>
		</tr>
		<tr>
			<th>좌표 설정</th>
			<td>
				<input type="hidden" id="x" name="caracc_xpoint">
				<input type="hidden" id="y" name="caracc_ypoint">
				<button type="button" class="btn btn-default" onclick="popUp();" style="margin-left:1%;">좌표설정</button> 
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="caracc_nickname" readonly="readonly" value="${MemberDto.member_nickname }"></td>
		</tr>
		
		<tr>
			<th>코멘트</th>
	<td><textarea id="summernote" rows="10" cols="50" name="caracc_coment"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-info pull-right" value="취소" onclick="location.href='doncar.do?command=carboard_selectone&car_board_no=${param.seq}'">
				<input type="submit" class="btn btn-info pull-right" value="작성">
			</td>
		</tr>
	</table>
	</form>
<%@ include file="./include/footer.jsp" %>	
<%@ include file="./js/summernote.html" %>
</div>
</body>
</html>