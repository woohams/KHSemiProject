<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<% request.setCharacterEncoding("UTF-8");%>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
		function popUp(){
			
			window.open("calendar.jsp","","left=40px,top=20px,width=800px,height=450px");
		}
	
</script>
</head>
<body>
	
	<input type="text" id="startdate" readonly="readonly" onclick="popUp();" placeholder="start">
	<input type="text" id="enddate" readonly="readonly" onclick="popUp();" placeholder="end">
	
		
	
</body>
</html>