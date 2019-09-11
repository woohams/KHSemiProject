<%@page import="common.Util"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<% request.setCharacterEncoding("UTF-8");%>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 선택</title>
<style type="text/css">

	table,th,td{
		border:1px solid black;
	}
	
	a{
		text-decoration: none;
	}
	
	#calendar{
	
	}
	
	#calendar th{
		width: 80px;
		border: 1px solid gray;
	}
	
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

 
	$(function(){
			
			
		$(".countview").click(function(){
			
			var checkDate = null;
			var aCountView = $(this).children().html();
			var year = $(".y").html();
			var month = $(".m").html();
			
			if(checkDate == null){
				
				 checkDate = year+"-"+month+"-"+aCountView;
				 
				 $("#checkdate").val(checkDate);
			} 
		});
		
		$("#datesend").click(function(){
			
			var date = $("#checkdate").val();
			var id = '#'+'${param.id}';
			if(id=='#startdate'){
				$(id,opener.document).val(date);
				close();
			}else if(id=='#enddate' && $("#startdate",opener.document).val() < date){
				$(id,opener.document).val(date);
				close();
			} else {
					alert("날짜를 확인 해주세요");
					$("#checkdate").val("");
			}
		});
	});

</script>
</head>
<%
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null){
		year = Integer.parseInt(paramYear);
	}
	
	if(paramMonth != null){
		month = Integer.parseInt(paramMonth);
	}
	
	if(month > 12){
		month = 1;
		year++;
	}
	
	if(month < 1){
		month = 12;
		year--;
	}
	
	cal.set(year, month-1, 1);
	
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	int lastDay = cal.getActualMaximum(Calendar.DATE);
	
	Util util = new Util();
	String monthTwo = util.isTwo(Integer.toString(month));
	
	
	
	
%>
<body>
	<table id="calendar">
		<caption>
			<a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◀◀</a>
			<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◁</a>
			
				<span class="y"><%=year %></span>년
				<span class="m"><%=monthTwo %></span>월
				
			<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▷</a>
			<a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▶▶</a>
		</caption>
	
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		
		<tr>
		<%
			for(int i = 0; i < dayOfWeek-1; i++){
				out.print("<td>&nbsp;</td>");
			}
			
			for(int i = 1; i <= lastDay; i++){
		%>
			<td class="countview">
				<span><%=util.isTwo(Integer.toString(i)) %></span>
			</td>
		<%
			if((dayOfWeek-1+i)%7==0){
				out.print("</tr><tr>");
				}
			}
			
			for(int i = 0; i < (7-(dayOfWeek+lastDay-1)%7)%7; i++){
				out.print("<td>&nbsp;</td>");
			}
		%>
		</tr>
		<tr>
			<td colspan = "2">날짜 확인
				<input type="text" id="checkdate" name="checkdate" readonly="readonly">
			</td>
			<td>
				<input type="button" id="datesend" value="선택">
			</td>
	</tr>
	</table>

</body>
</html>