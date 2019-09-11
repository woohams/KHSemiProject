
<%@page import="com.doncar.dto.CarAccDto"%>
<%@page import="com.doncar.biz.CarAccBiz"%>
<%@page import="com.doncar.biz.RentAccBiz"%>
<%@page import="com.doncar.dto.RentAccDto"%>
<%@page import="com.doncar.dto.FreeBoardDto"%>
<%@page import="com.doncar.biz.FreeBoardBiz"%>
<%@page import="com.doncar.dto.CarBoardDto"%>
<%@page import="com.doncar.biz.CarBoardBiz"%>
<%@page import="com.doncar.dto.RentBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.doncar.biz.RentBoardBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
#mypage_enroll{
	padding-left: 8%;
	padding-top: 2%;
	padding-bottom: 10%;
}

</style>

<title>유저 메인</title>
</head>
<%

if(session.getAttribute("MemberDto")==null){
	response.sendRedirect("login.jsp");
}

String writer = ((MemberDto)session.getAttribute("MemberDto")).getMember_nickname();

RentBoardBiz rentbiz = new RentBoardBiz();
List<RentBoardDto> rentlist = rentbiz.myboard(writer);
pageContext.setAttribute("rentlist", rentlist);

CarBoardBiz carbiz = new CarBoardBiz();
List<CarBoardDto> carlist = carbiz.myboard(writer);
pageContext.setAttribute("carlist", carlist);

FreeBoardBiz freebiz = new FreeBoardBiz();
List<FreeBoardDto> freelist = freebiz.myboard(writer);
pageContext.setAttribute("freelist", freelist);


RentAccBiz rentaccbiz = new RentAccBiz();
List<RentAccDto> rentacclist = rentaccbiz.myacclist(writer);
pageContext.setAttribute("rentacclist", rentacclist);
rentacclist = rentaccbiz.selectwriter(writer);
pageContext.setAttribute("rentaccwriter", rentacclist);

CarAccBiz caraccbiz = new CarAccBiz();
List<CarAccDto> caracclist = caraccbiz.myacclist(writer);
pageContext.setAttribute("caracclist", caracclist);
caracclist = caraccbiz.selectwriter(writer);
pageContext.setAttribute("caraccwriter", caracclist);


%>
<body>
<div class="container">
<%@ include file="./include/header.jsp" %>

<div id="mypage_enroll" class="table-responsive">
<h3 style="text-align:center"><img src="image\car3.jpeg" style="width:50px; height:50px;"/>렌트등록글</h3>
<table border="1" class="table table-hover" >
	<thead>
	<tr class="bg-info">
		<th>글번호</th><th>제목</th><th>등록일</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>	
		<c:when test="${empty rentlist}">
			<tr>
				<td colspan="3" style="text-align:center;">=====================================
				등록된글이 없습니다=====================================
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${rentlist }" var="dto">
				<tr>
					<td scope="col">${dto.rent_board_no }</td>
					<td scope="col"><a href="doncar.do?command=rentboard_selectone&rent_board_no=${dto.rent_board_no }">${dto.rent_title }</a></td>
					<td scope="col">${dto.rent_regdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<br/><br/><hr/>


<h3 style="text-align:center"><img src="image\car7.jpeg" style="width:50px; height:50px;"/>카풀등록글</h3>
<table border="1" class="table table-hover">
	<thead>
	<tr class="bg-info">
		<th>글번호</th><th>제목</th><th>등록일</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty carlist}">
			<tr>
				<td colspan="3" style="text-align:center;">=====================================
				등록된글이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${carlist }" var="dto">
				<tr>
					<td scope="col">${dto.car_board_no }</td>
					<td scope="col"><a href="doncar.do?command=carboard_selectone&car_board_no=${dto.car_board_no }">${dto.car_board_title }</a></td>
					<td scope="col">${dto.car_board_regdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<br/><br/><hr/>

<h3 style="text-align:center"><img src="image\car4.jpeg" style="width:50px; height:50px;"/>렌트 신청 대기 내역</h3>
<table border="1" class="table table-hover">
	<thead>
	<tr class="bg-info">
		<th>글번호</th><th>진행도</th> <th>시작일</th> <th>종료일</th> <th>남긴말</th> <th>신청글바로가기</th> <th>요청처리</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty rentacclist}">
			<tr>
				<td colspan="7" style="text-align:center;">=====================================
				등록된 신청이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${rentacclist }" var="dto">
			<%  %>
				<tr>
					<td scope="col">${dto.rentacc_no }</td>
					<td scope="col">${dto.rentacc_process }</td>
					<td scope="col">${dto.rentacc_start_date }</td>
					<td scope="col">${dto.rentacc_end_date }</td>
					<td scope="col"><a href="doncar.do?command=rentacc_selectone&rentacc_no=${dto.rentacc_no }">${dto.rentacc_comment }</a></td>
					<td scope="col"><a href="doncar.do?command=rentboard_selectone&rent_board_no=${dto.rent_board_no }">${dto.rentacc_nickname }</a></td>
					<td>
						<c:if test="${dto.rentacc_process eq '대기' }">
								<img src="image/ok.png" style="height:50px; width:50px;" onclick="location.href='doncar.do?command=rentacc_updateacc&acc=Y&rentacc_no=${dto.rentacc_no}'"/>
								<img src="image/no.jpg" style="height:50px; width:50px;" onclick="location.href='doncar.do?command=rentacc_updateacc&acc=N&rentacc_no=${dto.rentacc_no}'"/>							
						</c:if>
						<c:if test="${dto.rentacc_process eq '결제대기' }">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<br/><br/><hr/>

<h3 style="text-align:center"><img src="image\car1.jpeg" style="width:50px; height:50px;"/>카풀 신청 대기 내역</h3>
<table border="1" class="table table-hover">
	<thead>
	<tr class="bg-info">
		<th>글번호</th><th>진행도</th> <th>남긴말</th> <th>신청글바로가기</th> <th>요청처리</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty caracclist}">
			<tr>
				<td colspan="5" style="text-align:center;">=====================================
				등록된 신청이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${caracclist }" var="dto">
				<tr>
					<td scope="col">${dto.caracc_no }</td>
					<td scope="col">${dto.caracc_process }</td>
					<td scope="col"><a href="doncar.do?command=caracc_selectone&caracc_no=${dto.caracc_no }">${dto.caracc_coment }</a></td>
					<td scope="col"><a href="doncar.do?command=carboard_selectone&car_board_no=${dto.car_board_no }">${dto.caracc_nickname }</a></td>
					<td>
						<c:if test="${dto.caracc_process eq '대기' }">
							<a><img src="image/ok.png" style="height:50px; width:50px;" onclick="location.href='doncar.do?command=caracc_updateacc&acc=Y&caracc_no=${dto.caracc_no}'"/></a>
							<a><img src="image/no.png" style="height:50px; width:50px;" onclick="location.href='doncar.do?command=caracc_updateacc&acc=N&caracc_no=${dto.caracc_no}'"/></a>				
						</c:if>
						<c:if test="${dto.caracc_process eq '결제대기' }">
						</c:if>
					</td>
				</tr>
				
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<br/><br/><hr/>

<h3 style="text-align:center"><img src="image\car5.jpeg" style="width:50px; height:50px;"/>나의 렌트 신청목록</h3>
<table border="1" class="table table-hover">
<thead>
	<tr class="bg-info">
		<th width="10%">글번호</th><th width="10%">진행도</th> <th width="10%">시작일</th> <th width="10%">종료일</th> <th style="text-align:center;">남긴말</th> <th  width="13%">신청글 바로가기</th><th width="5%">비고</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty rentaccwriter}">
			<tr>
				<td colspan="7" style="text-align:center;">=====================================
				등록된 신청이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${rentaccwriter }" var="dto">
				<tr>
					<td scope="col">${dto.rentacc_no }</td>
					<td scope="col">${dto.rentacc_process }</td>
					<td scope="col">${dto.rentacc_start_date }</td>
					<td scope="col">${dto.rentacc_end_date }</td>
					<td scope="col"><a href="doncar.do?command=rentacc_selectone&rentacc_no=${dto.rentacc_no }">${dto.rentacc_comment }</a></td>
					<td scope="col"><a href="doncar.do?command=rentboard_selectone&rent_board_no=${dto.rent_board_no }">${dto.rentacc_nickname }</a></td>
					<td>
						<c:if test="${dto.rentacc_process eq '결제대기' }">
							<a><img src="image/contract.png" style="height:50px; width:50px;" onclick="location.href='constract.jsp?rent_board_no=${dto.rent_board_no }&rentacc_no=${dto.rentacc_no }'"/></a>	
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>
<br/><br/><hr/>

<h3 style="text-align:center"><img src="image\car8.jpeg" style="width:50px; height:50px;"/>나의 카풀 신청목록</h3>
<table border="1" class="table table-hover">
<thead>
	<tr class="bg-info">
		<th width="10%;">글번호</th><th width="10%;">진행도</th> <th>남긴말</th> <th width="14%;">신청글바로가기</th> <th width="5%;">비고</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty caraccwriter}">
			<tr>
				<td colspan="5" style="text-align:center;">=====================================
				등록된 신청이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${caraccwriter }" var="dto">
				<tr>
					<td scope="col">${dto.caracc_no }</td>
					<td scope="col">${dto.caracc_process }</td>
					<td scope="col"><a href="doncar.do?command=caracc_selectone&caracc_no=${dto.caracc_no }">${dto.caracc_coment }</a></td>
					<td scope="col"><a href="doncar.do?command=carboard_selectone&car_board_no=${dto.car_board_no }"></a></td>
					<td scope="col">	
						<c:if test="${dto.caracc_process eq '결제대기' }">
							<a><img src="image/pay.jpg" style="height:50px; width:50px;" onclick="location.href='payment.jsp?car_board_no=${dto.car_board_no}'"/></a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>
<br/><br/><hr/>

<h3 style="text-align:center"><img src="image\free5.png" style="width:50px; height:50px;"/>자유게시글</h3>

<table border="1" class="table table-hover">
<thead>
	<tr class="bg-info">
		<th width="15%;">글번호</th><th>제목</th><th width="30%;">등록일</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty freelist}">
			<tr>
				<td colspan="3" style="text-align:center;">=====================================
				등록된글이 없습니다=====================================</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${freelist }" var="dto">
				<tr>
					<td>${dto.free_board_no }</td>
					<td><a href="doncar.do?command=freeboard_selectone&free_board_no=${dto.free_board_no }">${dto.free_title }</a></td>
					<td>${dto.free_regdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>


</div>

<%@ include file="./include/footer.jsp" %>
</div>


</body>
</html>