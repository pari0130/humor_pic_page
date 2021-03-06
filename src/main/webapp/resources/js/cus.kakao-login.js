$(document).ready(function(){
			Kakao.init("15c77a110133705a8c8c22067128f893");
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						// 이름 id image 정보 얻어서 callAjax 요청 정보로 보냄
						console.log("nick : "+ res.properties.nickname);
						console.log("id : "+ res.id);
						console.log("image : "+ res.properties.profile_image);
				    	var id = res.id;
				    	var name = res.properties.nickname;
				    	var image = res.properties.profile_image;
				    	callAjax_kk(id, name, image);
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
			function callAjax_kk(id, name, image){
				   /* 위 구글 로그인 완료 후 ajax로 변수값 넘겨서 session에 저장하기.*/
				   console.log("ajax 요청 시작");
				   console.log("id: " + id);
				   console.log("name: " + name);
				   console.log("image: " + image);
				   
				   // 배열을 만들고 object type 데이터를 담아서
				   var arr = new Array();
				   var obj = new Object();
				   var url;
				   // 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
				   /*if(getQuerystring('cont_id') != '' && getQuerystring('cont_id') != null){*/
				   if(window.location.pathname != "/home.do" && window.location.pathname != "/"){	   
					   /*cont_id = getQuerystring('cont_id');
					   mn = getQuerystring('mn');
					   url = window.location.pathname+"?cont_id="+cont_id+"&mn="+mn;*/
					   url = window.location.pathname+"?cont_id="+getQuerystring('cont_id')+"&mn="+getQuerystring('mn');
				   }else{
					   url = window.location.pathname;   
				   }
				   obj.provider = "kakao";
				   obj.id = id;
				   obj.name = name;
				   obj.image = image;
				   arr.push(obj);
				   
				   // ajax 요청을 보낸뒤 true false return 받기
				   $.ajax({
			            method      : 'POST',
			            url         : '/socialajax.do',
			            // json 형태로 보내기 위해서 JSON.stringify(arr)
			            data        : JSON.stringify(arr),
			            dataType	: "json",
			            contentType	: "application/json; charset=UTF-8",
			            error       : function(request, status, error) {
			                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			            },
			            success     : function(data) {
			            	if(data.canUse){
			            		console.log("성공");
			            		// 성공 후 modal 창 닫기
			            		$(".modal_close").click();
			            		// success alert 창 띄우기. sweetalert 플러그인 사용
			            		// 메세지제목, 내용, success 이미지
			            		swal("Login success!!", name+" 님 환영합니다.", "success", {
			            			  buttons: {
			            			    catch: {
			            			      text: "OK", // 버튼 text
			            			      value: "catch", // 버튼 눌렀을때 value 값
			            			    }
			            			  },
			            			})
			            			.then((value) => {
			            			  switch (value) {
			            			    case "catch": // value값에 대한 연결 내용
			            			      location.href = url; // 기존 url로 돌아가기
			            			      break;
			            			}
			            		});
							}else{
								alert('에러');
								location.href = "/home.do";
							}        
			            }
			         
			        });
			    }
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){				
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});