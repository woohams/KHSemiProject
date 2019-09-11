<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>회원가입</title>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function idChk() {
	var id = $("#id").val();
	var chk = $("#id_check");
	if(id==null || id==""){
		chk.attr('title','n');
		chk.html('부적합한 아이디입니다');
		chk.css('color','red');
		return;
	}else{
		var command = 'command=member_idchk'
		id = "&id="+id;
		$.ajax({
			url : "doncar.do",
			data : command+id,
			dataType : "json",
			success : function(obj){
				if(obj.res == true){
					chk.attr('title','y');
					chk.html('중복체크완료');
					chk.css('color','black');
				}else{
					chk.attr('title','n');
					chk.html('부적합한 아이디입니다');
					chk.css('color','red');
				}
			},error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	}
	
	function nickChk(){
		var id = $("#nick").val();
		var chk = $("#nick_check");
		if(id==null || id==""){
			chk.attr('title','n');
			chk.html('부적합한 닉네임입니다');
			chk.css('color','red');
			return;
		}else{
			var command = 'command=member_nicknamechk'
			id = "&nick="+id;
			$.ajax({
				url : "doncar.do",
				data : command+id,
				dataType : "json",
				success : function(obj){
					if(obj.res == true){
						chk.attr('title','y');
						chk.html('중복체크완료');
						chk.css('color','black');
					}else{
						chk.attr('title','n');
						chk.html('부적합한 닉네임입니다');
						chk.css('color','red');
					}
				},error : function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
	}
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
	
	function check(){
		setTimeout(function() {
			var chk = $('* [title=n]').size();
			if(chk==0){
				return true;
			}
			alert('유효성검사에 실패했습니다 다시확인해주세요');
			
			return false;
			}, 2000);
	}
</script>
<style type="text/css">
#regist{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
h3 > img{
	width:50px;
	height:50px;
}
</style>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="regist">
	<h3>
		<img src="image\regist.jfif"/>	
		회 원 가 입
	</h3>

	<form action="doncar.do" method="post" onsubmit="return check()">
		<input type="hidden" name="command" value="member_regist" />

		<table border="1" class="table table-striped table-hover">
		<col width="200px">
		<thead>
			<tr>
				<th>아이디</th>
				<td>	
					<input type="text" name="member_id"  id="id" onchange="idChk();" required="required" />
					<span id="id_check"  title="n" style="color:red; font-size: 5px;">부적합한 아이디입니다</span>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="member_nickname" id="nick" onchange="nickChk();" required="required"  /> 
					<span id="nick_check" title="n" style="color:red; font-size: 5px;">부적합한 닉네임입니다</span>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="member_name" required="required" onclick="idChkConfirm();nicknameChkConfirm();" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="member_pw" id="member_pw" required="required" onchange="pwChk();"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pwCk" required="required" onchange="pwChk();" />
					<span id="pwChk" style="color:red; font-size: 5px;" title="n"></span>
				</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">
					<input type="reset" class="btn btn-default pull-right" value="초기화" />
					<input type="button" class="btn btn-default pull-right" value="취소" onclick="location.href='index.jsp'" /> 
					<input type="submit" class="btn btn-default pull-right" value="가입" /> 
				</td>
			</tr>
			</tbody>
		</table>

	</form>
</div>

</div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>
