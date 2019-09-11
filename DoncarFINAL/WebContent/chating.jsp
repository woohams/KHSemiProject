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
<title>Insert title here</title>
<style type="text/css">
legend{
	 display: block;
    padding-left: 2px;
    padding-right: 2px;
    border: none;
}
</style>

</head>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container">
<input type="hidden" id="chatno" value="${dto.chat_no }">
<input type="hidden" id="user1" value="${dto.user1 }"  >
<input type="hidden" id="user2" value="${dto.user2 }">
<input type="hidden" id="nickname" value="${MemberDto.member_nickname }">
	<fieldset style="margin-left: 25%;">
		<h1>임시채팅방</h1>
		<textarea id="messageWindow" cols="50" rows="20" style="background-color: #5BC0DE; color: white;"><c:choose><c:when test="${empty list }"></c:when><c:otherwise><c:forEach items="${list }" var="msgdto">${msgdto.sender } : ${msgdto.content }
</c:forEach></c:otherwise></c:choose></textarea>
		<br>
		<input type="text" id="inputMessage" style="width:46%;">
		<input type="submit" class="btn btn-info" value="send" onclick="send();">
	</fieldset>
	</div>
<%@ include file="./include/footer.jsp" %>	
</body>
<script type="text/javascript" src="./js/chat.js"></script>
</html>