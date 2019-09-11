<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<% request.setCharacterEncoding("UTF-8");%>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 회원가입</title>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">




function nickChk(){
	var id = $("#nick").val();
	var chk = $("#nick_check");
	if(id==null || id==""){
		chk.prop('title','n');
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
					chk.prop('title','y');
					chk.html('중복체크완료');
					chk.css('color','black');
				}else{
					chk.prop('title','n');
					chk.html('부적합한 닉네임입니다');
					chk.css('color','red');
				}
			},error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
}

function check(){
		var chk = $('* [title=n]').size();
		if(chk==0){
			return true;
		}else{
			alert('유효성검사에 실패했습니다 다시확인해주세요');
			return false;
		}

}

$(function(){
	nickChk();
})
</script>

<style type="text/css">
#snslogin{
	padding-left: 200px;
	width: 600px;
}
h3 > img{
	height: 100px;
	width: 100px;
	text-align: center;
}


</style>
</head>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="snslogin">
	<h3>
		<img src="image\regist.jfif"/>	
		회 원 가 입
	</h3>

	<form action="doncar.do" method="post" id="kakaoForm" onsubmit="return check()">
		<input type="hidden" name="command" value="member_regist" />
		<input type="hidden" name="member_id" id="member_id" value="${member_id }"/>
		<input type="hidden" name="member_pw" id="member_pw" value="${member_id }" />

		<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="member_nickname" id="nick" onchange="nickChk();" required="required" value="${member_nickname }"/>
					<span id="nick_check" title="n" style="color:red; font-size: 3px;"></span>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="member_name" required="required"/>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-default" value="가입" style="background-color:black; color:white;"/> 
					<input type="button" class="btn btn-default" value="취소" onclick="location.href='index.jsp'" /> 
				</td>
			</tr>
		</tbody>
		</table>
	</form>
</div>

<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>