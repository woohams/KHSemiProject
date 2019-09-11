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
<style type="text/css">
body{
background-color: #00B8FF;
}
.form-group{
	margin-left: 15%;
	margin-right: 15%;
}
</style>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<div><img id="thumbpreview" alt="" src=""></div>
 	<form name="fileupload"  method="post" action="imgupload.jsp" enctype="multipart/form-data" >
 	<div>파일 첨부 :
 	<div class="form-group">
    	 <input type="file" class="form-control btn-info" name="file" id="thumbnail" size="40"/>
    	 <input type="submit" class="form-control btn-info" value="업로드" style="margin-top: 5%;">
   	  </div>
     </div>
</form>
</body>

 <script type="text/javascript">
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            $('#thumbpreview').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
 	document.getElementById("thumbnail").onchange = function(){
 		var str = document.getElementById("thumbnail").value;
 		readURL(this);
	}
</script>
</html>