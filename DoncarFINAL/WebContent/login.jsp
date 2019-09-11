<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login</title>
<style type="text/css">
div {
   padding-bottom: 10px;
   padding-top: 10px;
   padding-left: 10px;
}


.container>div>div>div {
   margin-right: 30px;
}

h1>img {
   height: 50px;
   width: 70px;
}

a>img {
   size: cover;
   margin-left: 27%;
   padding-top: 3%;
}
</style>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   function findid(){
          window.open("./findid.jsp", "", "width=430, height=360, resizable=no, scrollbars=no, status=no");
      }
   function findpw(){
       window.open("./findpw.jsp", "", "width=430, height=360, resizable=no, scrollbars=no, status=no");
   }


</script>
</head>
<body>

	<%@ include file="./include/header.jsp"%>
	<div>
		<h1 class="text-center" style="margin-right: 5%;">
			<img src="image\login.jfif" /> LOGIN PAGE
		</h1>
		<div class="container">
			<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-2">
				<div class="panel panel-success" >
					<div class="panel-heading" style="margin-left: 3%; margin-top: 3%; margin-bottom: 3%;background-color:#5BC0DE;">
						<div class="panel-title text-center" style="color: white;  ">환영합니다 !</div>
					</div>
					<div class="panel-body">
						<form id="login-form" action="doncar.do" method="post">
							<input type="hidden" name="command" value="login" />
							<div>
								<input type="text" class="form-control" name="id"
									placeholder="Username" autofocus>
							</div>
							<div>
								<input type="password" class="form-control" name="pw"
									placeholder="Password">
							</div>
							<div>
								<button type="submit" class="form-control btn btn-info" >로그인</button>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div style="padding-left:6%; margin-bottom: 2%;">
							<input type="button" style="margin-right: 4%;" class="btn btn-info" value="회원가입" onclick="location.href='regist.jsp'" />
							<input type="button" style="margin-right: 4%;" class="btn btn-info" value="아이디 찾기" onclick="findid();" />
							<input type="button" style="margin-right: 4%;"class="btn btn-info" value="비밀번호 찾기" onclick="findpw();" />
							<input type="button" style="margin-right: 4%;"class="btn btn-info" value="메인" onclick="location.href='doncar.do?command=member_main'" />
							</div>
							<a id="kakao-login-btn">
								<img src="image/kakao_account_login_btn_medium_narrow.png" onclick="klogin();" />
							</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'>
		function klogin() {
         Kakao.init('2b731013681fcc6d66dd529c2df1358b');
         Kakao.Auth
               .loginForm({
                  success : function(authObj) {
                     Kakao.API
                           .request({
                              url : '/v2/user/me',
                              success : function(res) {


                                 var kakaoId = res.id;
                                 var kakaoEmail = res.kakao_account.email;
                                 var kakaoNickname = res.properties.nickname;

                                 location.href = "doncar.do?command=member_kakao_login&member_id="
                                       + kakaoId
                                       + "&member_email="
                                       + kakaoEmail
                                       + "&member_nickname="
                                       + kakaoNickname;
                                 createKakaotalkLogout();
                              },
                              fail : function(error) {
                                 alert(JSON.stringify(error));
                              }
                           });
                  },
                  fail : function(err) {
                     alert(JSON.stringify(err));
                  }
               });

         function kakaoLogout() {
            Kakao.Auth
                  .logout(function() {
                     alert("성공적으로 로그아웃하였습니다.");
                     setTimeout(
                           function() {
                              location.href = "http://localhost:8080/Doncar/login.jsp"
                              alert("장기간 입력이 없어서 자동으로 로그아웃하였습니다.");
                           }, 1000 * 60 * 10);
                  });
         }
         //        Kakao.Auth.setAccessToken(accessTokenFromServer);
         //        alert(accessTokenFromServer);
      }
      /*
       function kakaoLogout(){
       Kakao.Auth.logout(function (){
       alert("성공적으로 로그아웃하였습니다.");
       setTimeout(function(){
       location.href="http://localhost:8080/Doncar/login.jsp"
       alert("장기간 입력이 없어서 자동으로 로그아웃하였습니다.");
       }, 1000*60*10);
       });
       }
       */
   </script>
   <%@ include file="./include/footer.jsp"%>
</body>
</html>