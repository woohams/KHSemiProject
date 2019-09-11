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
<title>회원정보 수정</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function goPopup(){

    var pop = window.open("jusopopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
 
}

function sendmail(){
	  window.open("./mailupdate.jsp", "", "left=550px, top=250px, width=400, height=150, resizable=no, scrollbars=no, status=no");
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo, juso){

	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
	var space = ", ";
	var juso = roadAddrPart1 + space + addrDetail + roadAddrPart2;
	document.form.juso.value = juso;
}


function nicknameConfirm(bool){	
	if(bool="true"){
		opener.document.getElementsByName("member_nickname")[0].title="y";
	}
	self.close();
}

$(function(){
	
	var gender = '${MemberDto.member_gender}';
	if(gender=='M'){
		$("#M").prop("checked",true);
	}else{
		$("#F").prop("checked",false);
	}
})


</script>
<style type="text/css">
#memberupdate {
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;

}
.btn {
	background-color: skyblue;
	color: white;
}
#btn_group {
margin-left: 75%;
}
</style>
</head>

<body>
<div class="container">
<%@ include file="./include/header.jsp" %>
<div id="memberupdate">
	<h3>
		<img src="image\memberupdate.jfif" style="width:50px; height:50px;"/>	
		회원정보 수정
	</h3>
	<form action="doncar.do" method="post" id="form" name="form">
		<input type="hidden" name="command" value="member_updateres"/>
		<input type="hidden" name="member_no" value="${MemberDto.member_no }"/>
		<table border="1" class="table table-striped table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<td>${MemberDto.member_no}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${MemberDto.member_id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${MemberDto.member_name}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="member_nickname" value="${MemberDto.member_nickname }" title="n"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" id="M" name="member_gender" value="M">남자
					<input type="radio" id="F" name="member_gender" value="F">여자
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="member_birth" value="${MemberDto.member_birth }"/></td>
			</tr>
			<tr>
				<th style="vertical-align:middle;">주소</th>
				<td>
					<table>
					
						<colgroup>
							<col style="width:20%"><col>
						</colgroup>
						<tbody>
							<tr>
							
								<th>우편번호</th>
							<td>
					   			<input type="hidden" id="confmKey" name="confmKey" value=""  >
								<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
								<input type="button"  class="btn btn-info" value="주소검색" onclick="goPopup();">
							</td>
							</tr>
							<tr>
								<th><label>도로명주소</label></th>
								<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
							</tr>
							<tr>
								<th>상세주소</th>
							<td>
								<input type="text" id="addrDetail" style="width:40%" value="">
								<input type="text" id="roadAddrPart2"  style="width:40%" value="">
							</td>
							</tr>
						</tbody>
							<tr>
								<th>등록 주소</th>
								<td>
									<input type="text" name="member_addr" id="juso" value="" style="width:700px;" placeholder="${MemberDto.member_addr }" readonly="readonly"/>
								</td>
							</tr>
					</table>
					
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_email" readonly="readonly" value="${MemberDto.member_email }"/>
					<c:if test="${empty MemberDto.member_email }">
						<button type="button" class="btn btn-info" onclick="sendmail();">인증하기</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>${MemberDto.member_regdate}</td>
			</tr>
			<thead>
			<tbody>
			<tr>
				<td colspan="10">
				<div id="btn_group">
					<input type="submit" class="btn btn-info "  value="변경완료"/>
					<input type="button" class="btn btn-info "	 value="메인" onclick="location.href='doncar.do?command=member_main'"/>
					<input type="button" class="btn btn-info "	 value="비밀번호 변경" onclick="location.href='doncar.do?command=member_pwupdate&member_no=${MemberDto.member_no}'"/>
				</div>
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




