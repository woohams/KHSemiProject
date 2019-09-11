payment.jsp




<%@page import="com.doncar.biz.CarBoardBiz"%>
<%@page import="com.doncar.dto.CarBoardDto"%>
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
<title>결제</title>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">


<% 
	MemberDto dto = (MemberDto)session.getAttribute("MemberDto"); 
	
	int amount = 0;
	
	if(request.getParameter("car_board_no") != null){
		
		int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
		CarBoardBiz biz = new CarBoardBiz();
		CarBoardDto carboarddto = biz.selectOne(car_board_no);
		
		amount = carboarddto.getCar_board_price();
	} else {
		amount = Integer.parseInt(request.getParameter("amount"));
	}
%>

	$(function(){
				var IMP = window.IMP;
				IMP.init('imp93078974');
				IMP.request_pay({
				pg: 'html5_inicis', 
				pay_method: 'card',
				merchant_uid: 'merchant_'+new Date().getTime(),
				name: '돈카',
				amount: <%=amount%>,
				buyer_email: '<%=dto.getMember_email()%>',
				buyer_name: '<%=dto.getMember_name()%>',
				buyer_tel: '<%=dto.getMember_phone()%>',
				buyer_addr: '<%=dto.getMember_addr()%>',
				buyer_postcode: '123-456',
				m_redirect_url: 'paymentres.jsp'
			
			}, function (rsp) {
				
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
/* 					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					alert("매출전표	:"+rsp.receipt_url);
					alert("승인시간	:"+rsp.paid_at);
					alert("주문자 이름	:"+rsp.buyer_name);
 */					
					
 				alert("결제 완료");
 
 				$("#pay_price").val(rsp.paid_amount);
 				$("#pay_apply").val(rsp.apply_num);
 				$("#buyer_name").val(rsp.buyer_name);
 				$("#pay_time").val(rsp.paid_at);
				
 				$("#payment").submit();
 				
 				
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				
				alert("결제 실패");
				location.href ='usermain.jsp';
				
				}
			});
	});


	
	</script>
</head>
<body>

<%@ include file="./include/header.jsp" %>
	<div class="container">
	
	<h1>결제 진행 중......</h1>
	
	<form action="paymentres.jsp" method="get" id="payment">
		<input type="hidden" class="btn btn-info" name="pay_price" id="pay_price">
		<input type="hidden" class="btn btn-info" name="pay_apply" id="pay_apply">
		<input type="hidden" class="btn btn-info" name="buyer_name" id="buyer_name">
		<input type="hidden" class="btn btn-info" name="pay_time" id="pay_time">
	</form>

</div>
<%@ include file="./include/footer.jsp" %>	
</body>
</html>