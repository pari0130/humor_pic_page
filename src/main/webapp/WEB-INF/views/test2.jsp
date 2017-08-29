<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!docType html>
<html lang="ko">
<head>
	<title>카카오톡 로그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		$(document).ready(function(){
			Kakao.init("15c77a110133705a8c8c22067128f893");
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						console.log("nick : "+ res.properties.nickname);
						console.log("id : "+ res.id);
						console.log("image : "+ res.properties.profile_image);						
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				/* $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"}); */
				$("#kakao-login").click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							/* createKakaotalkLogout(); */
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				/* $("#kakao-logged-group").prepend(loginBtn) */
			}
			/* function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			} */
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				/* createKakaotalkLogout(); */
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
</head>
<body>
	<div id="kakao-login">login</div>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>