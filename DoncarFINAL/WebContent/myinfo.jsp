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

<style type="text/css">
#usermain{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
#btn_group{
margin-left: 77%;
}
</style>
<title>유저 메인</title>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

<div id="usermain">
		<h1>${MemberDto.member_id }님의 정보</h1>
		<table border="1" class="table table-striped table-hover">
		<thead> 
			<tr>
				<th width="20%;">번호</th>
				<td>${MemberDto.member_no }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${MemberDto.member_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${MemberDto.member_name }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${MemberDto.member_nickname }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${MemberDto.member_gender }</td>
			</tr>
			<tr>
				<th>보유머니</th>
				<td>${MemberDto.member_money }</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>${MemberDto.member_birth }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${MemberDto.member_addr }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${MemberDto.member_email }</td>
			</tr>
			<tr>
				<th>연락쳐</th>
				<td>${MemberDto.member_phone }</td>
			</tr>	
			<tr>
				<th>면허인증여부</th>
				<td>${MemberDto.member_driveacc }</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>${MemberDto.member_regdate }</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">
				<div id="btn_group">
					<input type="button" class="btn btn-info" value="탈퇴" style="background-color:red; color:white;" onclick="location.href='doncar.do?command=member_delete&member_no=${MemberDto.member_no}'"/>
					<input type="button" class="btn btn-info" value="수정" onclick="location.href='doncar.do?command=member_update&member_no=${MemberDto.member_no}'"/>
					<input type="button" class="btn btn-info" value="내글 모아보기" onclick="location.href='doncar.do?command=usermain'"/>
				</div>
				</td>
			</tr>
			</tbody>
		</table>
</div>	

<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>