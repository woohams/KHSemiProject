<%@page import="com.doncar.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">

#left{
	width: 40%; 
	height: 50%; 
	float: left;
}
#right{
	width: 5%; 
	height: 50%; 
	float: right;
}
	
.container{
	position: inherit;
	margin-top: 30px;
	padding-top: 15px;
}
 
#social-fb:hover {
	color: #3B5998;
}

#social-tw:hover {
	color: #4099FF;
}
#social-yt:hover {
	color: #d34836;
}
#social-em:hover {
	olor: #f39c12;
}

#footerinfo {
	padding-top:0px;
}

#footerinfo li {
	list-style-type: none;
 	float: left;
 	margin-left: 20px; 
}
.footer-item{
	padding-top: 15px;
}



</style>
<title>Footer</title>
</head>

<footer class="page-footer font-small">

	<div class="text-center mt-5 mb-0">
    	
    	<div class="container" style="width:1200px;"> <hr/>
    	
    		
				<div class="col-xs-12 col-sm-6 col-md-16">
					<ul class="list-unstyled quick-links footer-tab" id="footerinfo">
						<li><a href="main.jsp"><img  src="image/DonCar.png" style="width:80px; height:50px; "></a></li>
						<li class="footer-item"><a href="doncar.do?command=noticeboard_selectlist"><i class="fa fa-angle-double-right"></i>공지사항</a></li>
						<li class="footer-item"><a href=""><i class="fa fa-angle-double-right"></i>1:1 채팅 문의</a></li>
						<li class="footer-item"><a href="termsofservice.jsp"><i class="fa fa-angle-double-right"></i>이용약관</a></li>
						<li class="footer-item"><a href="privacypolicy.jsp"><i class="fa fa-angle-double-right"></i>개인정보처리방침</a></li>
					</ul>
				</div>
			
    	
			<div class="center-block">
			<p class="txt-railway">
				<a href="https://www.facebook.com/woohams"><i class="fa fa-facebook-square fa-3x social"></i></a>
				<a href="https://twitter.com"><i class="fa fa-twitter-square fa-3x social"></i></a>
				<a href="https://youtu.be/wn9K-aMKC7U"><i class="fa fa-youtube-square fa-3x social"></i></a>
				<a href="mailto:qkqejd@gmail.com"><i class="fa fa-envelope-square fa-3x social"></i></a>	
			<p>	
			</div> <hr/>
			
		</div>
		
    	<h3 class="text-secondary">DONCAR</h3>
    	<p>
    		COPYRIGHT &copy; 2019 <span class="text-primary">DONCAR</span> All rights reserved. <br/>
    	</p>
    		KH Q-CLASS 오후반  김용범 진우현 홍준화 정신형 고현우<br/>
    </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	    
<script src="./bootstrap/dist/js/bootstrap.min.js"></script>
