<%@page import="com.doncar.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   
<style type="text/css">
body { 
   padding-left:10%;
   padding-right:10%;
   padding-top: 0; 
   }
   
nav {
	width: 80%;
}

.navbar{
   margin-left: 0.7%;
   margin-right:10%;
   margin-top: 1%;
   padding-left:10px;
   padding-right: 15px;
   padding-bottom: 0%;
   padding-top: 0%;
   
   }

   .nav-item, .nav-justified{
   margin-left: 2%;
   }
.nav:hover, .nav:focus{
   color:#fff;   
   background-color: #fff;
   }
   
.tooltip-viewport-bottom{
   margin-right: 5px;
   margin-bottom: 30px;
   }
   
div>div>div>.tooltip-viewport-bottom2{
   margin-left: 1px;
   
   }

</style>
  <header>
   <a class="navbar-left" href="doncar.do?command=member_main"></a>
     <div class="tooltip-viewport-bottom ">
      <div class="container" style="width:1200px;">
            <c:choose>
               <c:when test="${empty MemberDto }">
               <div>
                  <a class="btn btn-default pull-right btn-info tooltip-viewport-bottom2" href="regist.jsp">회원가입</a>
                  <a class="btn btn-default pull-right btn-info tooltip-viewport-bottom" href="login.jsp">로그인</a>
               </div>
               </c:when>
               <c:otherwise>
                  <a class="btn btn-default pull-right btn-info tooltip-viewport-bottom" href="doncar.do?command=logout">로그아웃</a>
               </c:otherwise>
            </c:choose>
            
            <c:if test="${!empty MemberDto }">
               <c:choose>
                  <c:when test="${MemberDto.member_roll eq 'ADMIN'}">
                     <a class="btn btn-default pull-right btn-info tooltip-viewport-bottom" href="adminmain.jsp">관리자 페이지</a>            
                  </c:when>
               </c:choose>
            </c:if>     
      <nav class="navbar navbar-static-top " role="navigation">
         <a class="navbar-left" href="doncar.do?command=member_main">
            <img  src="image/DonCar.png" style="width:80px; height:50px; ">
         </a>
            <ul class="nav nav-tabs ">
               <li class="nav-item "><a role="presentation" class="nav nav-tabs nav-justified "  href="doncar.do?command=noticeboard_selectlist">공지사항</a></li>
               <li class="nav-item"> <a role="presentation" class="nav nav-tabs nav-justified"  href="doncar.do?command=rentboard_insert">차량등록</a></li>
               <li class="nav-item"><a role="presentation" class="nav nav-tabs nav-justified" href="doncar.do?command=rentboard_selectlist">렌트예약</a></li>
               <li class="nav-item"><a role="presentation" class="nav nav-tabs nav-justified" href="doncar.do?command=carboard_selectlist">카풀예약</a> <c:choose>
                     <c:when test="${empty MemberDto}">
                        <li class="nav-item "><a role="presentation" class="nav nav-tabs nav-justified" href="login.jsp">마이페이지</a></li>
                        <li><a role="presentation" class="nav nav-tabs nav-justified" href="login.jsp">1:1채팅</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="nav-item "><a role="presentation" class="nav nav-tabs nav-justified" href="myinfo.jsp">마이페이지</a></li>
                        <li><a role="presentation" class="nav nav-tabs nav-justified" href="doncar.do?command=chat_selectlist&nickname=${MemberDto.member_nickname }">1:1채팅문의</a></li>
                     </c:otherwise>
                  </c:choose>
               <li><a role="presentation" class="nav nav-tabs nav-justified" href="doncar.do?command=freeboard_selectlist">자유게시판</a></li>
            </ul>
      </nav>
      </div>
   </div>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script src="./bootstrap/dist/js/bootstrap.min.js"></script>
   </header>

