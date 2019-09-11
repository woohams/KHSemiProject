
<%@page import="com.doncar.dto.RentAccDto"%>
<%@page import="com.doncar.biz.RentBoardBiz"%>
<%@page import="com.doncar.biz.RentAccBiz"%>
<%@page import="com.doncar.dto.RentBoardDto"%>
<%@page import="com.doncar.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<% request.setCharacterEncoding("UTF-8");%>
	<% response.setContentType("text/html; charset=UTF-8"); %>

<% 

	int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
	int rentacc_no = Integer.parseInt(request.getParameter("rentacc_no"));

	RentAccBiz accbiz = new RentAccBiz();
	RentAccDto accdto = accbiz.rentacc_selectone(rentacc_no);
	
	RentBoardBiz biz = new RentBoardBiz();
	RentBoardDto dto = biz.rentboard_selectone(rent_board_no);
	
	String carno = dto.getRent_carno();
	if(carno == null){
		carno = "";
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>계약서</title>



<style type="text/css">

	#table1{
		witdh: 400px;
		height: 400px;
	}
	#table2{
		height: 100px;
		witdh: 300px;
	}
</style>

<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function pay(){
		$("#constract").attr("action","payment.jsp");
		
		$("#constract").submit();
	}
	
	function constractres(){
		$("#constract").attr("action","constractres.jsp");
		
		$("#constract").submit();
	}
	
	
	
</script>
</head>
<body>

<h1 style="text-align: center;">차량 임대차 계약서</h1>
<br/>	
 
<h3>대여조건 [렌트계약]</h3> 
“임차인”과 “임대인”이 합의한 대여조건은 다음과 같다. <br/><br/>
[대여요금표]   

<form method="post" id="constract">
<table border="1" id="table1" class="table table-striped table-hover">
 	<tr>
 		<th style="background-color:skyblue;">no</th>
 		<th style="background-color:skyblue;">대여차종</th>
 		<th colspan="4" style="background-color:skyblue; text-align:center;">상세 계약 내용</th>
 	</tr>
 	<tr>
 		<th rowspan="10"><%=dto.getRent_board_no() %></th>
 			<th rowspan="6"></th>
 			<th style="background-color:skyblue; width: 18%;">차량가격</th>
 			<td style="text-align:right; width: 22%;">원</td>
 			<th style="background-color:skyblue; width: 18%;">대여료</th>
 			<td style="text-align:right; width: 22%;"><input type="text" name="amount" value="<%=dto.getRent_price() %>" readonly="readonly">원</td>
 	</tr>
 	<tr>
 			<th style="background-color:skyblue;">차량번호</th>
 			<td><input type="text" value="<%=carno %>" readonly="readonly"></td>
 			<th style="background-color:skyblue;">계약기간</th>
 			<td><textarea  cols="25px" readonly="readonly"><%=accdto.getRentacc_start_date() %> ~ <%=accdto.getRentacc_end_date()%></textarea></td>
 	</tr>
 	<tr>
 			<th style="background-color:skyblue;">Maker 옵션</th>
 			<td></td>
 			<th style="background-color:skyblue;">추가옵션(별도)</th>
 			<td></td>
 	</tr>
 	<tr>
 			<th style="background-color:skyblue;">보증보험</th>
 			<td></td>
 			<th style="background-color:skyblue;">보증금</th>
 			<td style="text-align: right;">원</td>
 	</tr>
 	<tr>		
 			<th style="background-color:skyblue;">운행약정거리</th>
 			<td style="text-align:right;">Km 이하</td>
 			<th style="background-color:skyblue;">정비 서비스</th>
 			<td></td>
 	</tr>		
 	<tr>
 			<th style="background-color:skyblue;">위약금요율</th>
 			<td style="text-align:right;">%</td>
 			<th style="background-color:skyblue;">사고면책금</th>
 			<td style="text-align:right;">원</td>
 	</tr>	
 	<tr>
 		<th rowspan="3" style="background-color:skyblue; vertical-align:middle;">보험조건</th>
 			<th style="background-color:skyblue;">운전자 제한연령(만 나이 기준)</th>
 			<td style="text-align:right;">세 이상</td>
 			<th style="background-color:skyblue;">대인배상 / 무보험차상해</th>
 			<td style="text-align:right;">/ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
 			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 원</td>
 	</tr>
 	<tr>
 			<th style="background-color:skyblue;">대물배상한도 </th>
 			<td style="text-align:right;">원</td>
 			<th style="background-color:skyblue;">자손보상한도 </th>
 			<td style="text-align:right;">원</td>
 	</tr>
 	<tr>
 			<th style="background-color:skyblue;">임직원 한정운전 특약가입 </th>
 			<!-- <td colspan="3" style="text-align:center;">가입 &nbsp&nbsp□&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp미가입&nbsp&nbsp□&nbsp&nbsp</td> -->
 			<td colspan="3" style="text-align:center;">
 				<input type="radio" name="accChk" value="가입">가입&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
 				<input type="radio" name="accChk" value="미가입">미가입
 			</td>
 	</tr>
 	<tr>
 		<th style="background-color:skyblue;">기타</th>
 		<td colspan="4"></td>
 	</tr>
 </table><br/>
가. 위의 추가옵션(별도) 품목에 대한 품질보증기간 이후의 A/S 및 NAVI Up-Grade 등으로 인한 비용은 “임차인”의 부담입니다. <br/>
나. 월 대여료에는 정비료 및 종합보험료 (대인, 대물, 자손), 각종 공과금이 포함되어 있습니다. <br/>
다. 동절기용품은 계약기간 중 1회 지급(고객보관) / 정비서비스(Premium Service)는 월/격월/분기 1회 방문점검 서비스를 말함 <br/>
라. 중도해지 위약금 산출식 : 잔여 계약기간 대여료 총액 * 위약금요율 <br/>
마. 법인은 임직원 한정운전 특약 가입 時 업무용승용차 관련 비용 손금 산입이 가능하며, 특약 미가입 경우 업무용승용차 비용 손금 산입이 불가능함      <br/>
&nbsp&nbsp&nbsp&nbsp단, 특약을 가입하는 경우 임직원 또는 임차 법인과 계약관계에 있는 업체의 임직원이 운전자인 경우에 한정하여 사고 보상 가능함  <br/><hr/>

<table border="1" id="table2" class="table table-striped table-hover">
	<tr>
		<th style="background-color:skyblue; vertical-align:middle; width: 15%;">임대인</th>
		<td style="text-align:right; vertical-align:middle; width: 15%;">(인)</td>
		<th style="background-color:skyblue; vertical-align:middle; width: 15%;">임차인</th>
		<td style="text-align:right; vertical-align:middle; width: 15%;">(인)</td>
		<th style="background-color:skyblue; vertical-align:middle;">관리자 번호</th>
		<td style="text-align:center; vertical-align:middle;">1588-8851</td>
	</tr>
</table>

<br/>
“임차인”과  “임대인”은 차량(이하 차량)의 임대차계약을 체결함에 있어 다음과 같이 합의하고 이행키로 한다. 
<br/><br/><br/>
<div style="margin-left: 80%;margin-bottom: 5%;">
<input type="button" class="btn btn-info" value="PDF 저장(미구현)" onclick="constractres();">
<input type="button" class="btn btn-info" value="결제" onclick="pay();">
</div>
</form>


</body>
</html>