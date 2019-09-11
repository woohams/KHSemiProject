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
<title>비밀번호 변경</title>


<script type="text/javascript">
function pwChk() {
	var pw = document.getElementById("member_pw").value;
	var pwCk = document.getElementById("pwCk").value;
	$('#pwChk').css('color','red');
	if(pw != pwCk){
		$("#pwChk").html('입력하신 비밀번호가 서로 다릅니다')
		return;
	}
	
	pw_passed = true;
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@\#$%<>^&*]/; 	// 특수문자 제거
	var pw_msg = "입력하신 패스워드 사용이 가능합니다.";
	if (pw.length == 0) {
		$('#pwChk').html("비밀번호를 입력해주세요");
		return false;
	} else {
		if (pw != pwCk) {
			$('#pwChk').html("비밀번호가 일치하지 않습니다.");
			return;
		}
	}
	if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)
			|| pw.length<8||pw.length>50) {
		$('#pwChk').html("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
		return ;
	}
	var SamePass_0 = 0;
	var SamePass_1 = 0; 
	var SamePass_2 = 0; 
	
	for (var i = 0; i < pw.length; i++) {
		var chr_pass_0;
		var chr_pass_1;
		var chr_pass_2;
		if (i >= 2) {
			chr_pass_0 = pw.charCodeAt(i - 2);
			chr_pass_1 = pw.charCodeAt(i - 1);
			chr_pass_2 = pw.charCodeAt(i);
			if ((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
				SamePass_0++;
			}
			else {
				SamePass_0 = 0;
			}
			if (chr_pass_0 - chr_pass_1 == 1
					&& chr_pass_1 - chr_pass_2 == 1) {
				SamePass_1++;
			}
			else {
				SamePass_1 = 0;
			}
			if (chr_pass_0 - chr_pass_1 == -1
					&& chr_pass_1 - chr_pass_2 == -1) {
				SamePass_2++;
			}
			else {
				SamePass_2 = 0;
			}
		}
		if (SamePass_0 > 0) {
			$('#pwChk').html("동일문자를 3자 이상 연속 입력할 수 없습니다.");
			return;
		}
		if (SamePass_1 > 0 || SamePass_2 > 0) {
			$('#pwChk').html("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
			return;
		}
		$('#pwChk').html(pw_msg);
		$('#pwChk').css('color','black');
		$('#pwChk').attr('title','y');
		return;
			
		
	}
	
}

</script>

<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

	<h3>
		<img src="image\pw.jpg" style="width:50px; height:50px;"/>	
		비밀번호 변경
	</h3>
	
	<form action="doncar.do" method="post">
		<input type="hidden" name="command" value="member_pwupdateres">
		<input type="hidden" name="member_no" value="${MemberDto.member_no }">
		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<td>${MemberDto.member_no}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" id="member_id" value="${MemberDto.member_id }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pw" id="member_pw" required="required" placeholder="변경할 비밀번호를 입력해 주세요" style="width:400px;" onchange="pwChk();"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pwCk" placeholder="한번 더 입력해 주세요." required="required" style="width:400px;" onchange="pwChk();"/> 
					<span id="pwChk" style="color:red; font-size: 5px;" title="n"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${MemberDto.member_name}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${MemberDto.member_nickname}</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="5">
					<input type="submit" class="btn btn-default pull-right" value="변경완료"/>
					<input type="button" class="btn btn-default pull-right" value="메인" onclick="location.href='doncar.do?command=member_main'"/>
				</td>
			</tr>
			</tbody>
		</table>
	</form>

<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>