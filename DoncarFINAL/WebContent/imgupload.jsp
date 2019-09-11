imgupload.jsp





<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


<%


	String thumbnail = "";
	String orgfilename = "";
	String fileInput = "";

	String uploadPath = request.getRealPath("upload");
	System.out.println(uploadPath);
	File upDir = new File(uploadPath);
	if(!upDir.exists()){
		upDir.mkdirs();
	}
	try{
	MultipartRequest multi = new MultipartRequest(
			request,
			uploadPath,
			10*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	Enumeration formNames=multi.getFileNames();
	
	fileInput = (String)formNames.nextElement();
	
	thumbnail = multi.getFilesystemName(fileInput);
	orgfilename = multi.getOriginalFileName(fileInput);
	
	//thumbnail = multi.getFilesystemName("thumbnail");
	//orgfilename = multi.getOriginalFileName("thumbnail");
	
	//String url = uploadPath+"/"+thumbnail;
	String url = "/Doncar/upload/"+thumbnail;
	System.out.println(url);
	 
	 %>
		$(function(){
			$("#rent_img",opener.document).val("<%=url%>");
			close();
		});
	 <%
	}catch (Exception e){
		e.getStackTrace();
	}
	%>
</script>
</head>
<body>

</body>
</html>