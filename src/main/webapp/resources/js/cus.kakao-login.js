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
			//
			function createKakaotalkLogin(){		
				$("#customBtn_kk").click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();							
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});				
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){				
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});