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
			function createKakaotalkLogin(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							Kakao.API.request({
								url: '/v1/user/me',
								success: function(res) {
									console.log("nick :" + res.properties.nickname);
									console.log("image :" + res.properties.profile_image);									
									console.log("id :" + res.id);									
								},
								fail: function(error) {
									console.log(error);
								}
							});
							
						},
						fail: function(err) {
							console.log(err);
					}
				});
			}
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
	<div id="kakao-login" onclick="javascript:createKakaotalkLogin()" >login</div>
	<!-- <div id="kakao-logged-group"></div> -->
	<div id="kakao-profile"></div>
</body>
</html>