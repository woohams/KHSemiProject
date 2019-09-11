<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>메인 페이지</title>
<style type="text/css">

.btn{
	background-color: skyblue;
	color: white;
}
.carousel .item {
  height: 700px;
  left:100px;
  right:100px;
  background-color: #777;
}
.carousel-inner > .item > .item-link > img {
  position: absolute;
  top: 20;
  left:0;
  min-width: 100%;
  height: 700px;
  border:0;
  box-shadow: 0 2px 6px 0 hsla(0,0%,0%,0.2);
}
.carousel {
  height: 700px;
  margin-bottom: 60px;
}
.container-fluid{
	background-color:#4ea1d3;
}
span >.main_span {
text-shadow:10px 2px 6px 0 hsla(0,0%,0%,0.2);
}

.col-xs-12> p >.img-responsive{
	margin-top:0px;
	margin-left: 20%;
	border:0;
	box-shadow: 0 2px 6px 0 hsla(0,0%,0%,0.2);
	position: relative;
}
.col-xs-12> p{
	
	margin-bottom: 5%;
}
.col-xs-12 > span{
	margin-top:10%;
	margin-left:2%;
	color: white;
	size: 20px;
	position: absolute;
	font-size: 20px;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
.jumbotron {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
}
.jumbotron > .lead{
	text-align: left;
	margin-left: 23%;

}
#mainsort{
	padding-left: 4%;
	padding-right:3%;
	padding-bottom: 2%;
}
</style>
<title>메인페이지</title>
</head>
<body>
<div class="container">
	<%@ include file="./include/header.jsp" %>
	<br><br>
	<div id="mainsort">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
	  <div class="carousel-inner" role="listbox">
        <div class="item active">
          <a class="item-link" href="doncar.do?command=rentboard_selectlist"><img src="./image/first.png" alt="First slide"></a>
        </div>
	    <div class="item">
          <a class="item-link" href="doncar.do?command=rentboard_selectlist"><img src="./image/second.png" alt="Second slide"></a>
        </div>
	    <div class="item">
          <a class="item-link" href="doncar.do?command=carboard_selectlist"><img src="./image/three.png" alt="Third slide"></a>
        </div>
      </div>
	  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
    <!-- /.main -->
	
	<div class="container-fluid">
		<div class="row " >
			<div class="col-xs-12 ">
			<span>
				<br><font class="main_span" color="#E9EBEE"> <b><font id="rent_t" size="5px">안타는 차!</font><br> 유지비 내지만 말고 <br>돈 벌러 가자!</b></font><br>
			</span>
			<span><button onclick="location.href='doncar.do?command=rentboard_insert'" class="btn btn--car" style="margin-top: 140px;">차량 등록</button></span>
				<p>
					<img class="img-responsive" src="./image/main_first.jpg" class="img-fluid" style="left: 50px;">
				</p>
				
				<span>
					<br><font class="main_span" color="#E9EBEE"> <b><font size="5x">차가 필요할 때!</font><br><font>돈 카로 차 빌려서</font><br>여행 가자!</b></font><br>
				</span>
				<span><button onclick="location.href='doncar.do?command=rentboard_selectlist'" class="btn btn--rent" style="margin-top: 140px;">렌트 예약</button></span>
				<p>
					<img class="img-responsive" src="./image/main_second.jpg" class="img-fluid" style="left: 50px;">
				</p>
				
				<span>
					<br> <font class="main_span" color="#E9EBEE"> <b><font size="5px">이동이 필요할 때!</font><br> 쉽고 간편하게 <br>카풀하자!</b></font><br>
				</span>
				<span><button onclick="location.href='doncar.do?command=carboard_selectlist'" class="btn btn--carpool btn-info" style="margin-top: 140px;">카풀 에약</button></span>
				<p>
					<img class="img-responsive" src="./image/main_third.jpg" class="img-fluid" style="left: 50px;">
				</p>
			</div>
		</div>
	</div>
	
	<!-- jumbotron -->
	<div class="jumbotron"  style="background-color: #E9EBEE">
        <h1>유의사항</h1>
    	    <p class="lead"><br><br><br><br>

       		 - 돈카는 만 21세 이상, 면허 취득 1년 이상 시 이용 가능합니다.<br><br><br>
       		 
			 - 이용 일자 및 차종, 예약존 특성에 따라 가격에 편차가 있을 수 있습니다.<br><br><br>

       		 - 돈카는 만 21세 이상, 면허 취득 1년 이상 시 이용 가능합니다.<br><br><br>

			 - 이용 일자 및 차종, 예약존 특성에 따라 가격에 편차가 있을 수 있습니다.<br><br><br>
        
       	     - 저희는 불법인 걸 알고도 묵인하며 프로젝트를 진행했습니다.<br><br><br>
       	     
       	     - 모든 법적인 책임은 강사님에게 있습니다.<br><br><br>
       	     </p>
       	     </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="./bootstrap/dist/js/bootstrap.min.js"></script>
    </div>
</body>
</html>