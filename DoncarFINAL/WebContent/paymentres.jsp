
<%@page import="com.doncar.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<% request.setCharacterEncoding("UTF-8");%>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
    <% 
    	MemberDto dto = (MemberDto)session.getAttribute("MemberDto");
    	int member_no = dto.getMember_no();
    
    	String pay_price = request.getParameter("pay_price"); 
    	String pay_apply = request.getParameter("pay_apply");
    	String buyer_name = request.getParameter("buyer_name");
    	String pay_time = request.getParameter("pay_time");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-top: 10%;
}

</style>
</head>
<body>
<div class="container">
	<table border="1" class="table table-striped table-hover">
		<tr>
			<th>구매자</th>
			<td><%=buyer_name %></td>
		</tr>
		<tr>
			<th>결제 금액</th>
			<td><%=pay_price %></td>
		</tr>
		<tr>
			<th>카드 승인번호</th>
			<td><%=pay_apply %></td>
		</tr>
	</table>
		
	<input type="button" class="btn btn-info" onclick="location.href='main.jsp'" value="메인">
	<input type="button" class="btn btn-info" onclick="location.href='doncar.do?command=member_selectone&member_no=<%=member_no %>'" value="마이 페이지">
	
</div>
</body>
</html>