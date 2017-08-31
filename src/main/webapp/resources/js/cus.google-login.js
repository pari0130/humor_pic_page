/* 구글 로그인 연동  */
    var googleUser = {};
    var startApp = function() {
      gapi.load('auth2', function(){
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
          client_id: '221557223102-0gp35bn76pkch9bn8ru3k463oghpoqbq.apps.googleusercontent.com',
          cookiepolicy: 'single_host_origin',
          // Request scopes in addition to 'profile' and 'email'
          //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('customBtn_gg'));
      });
    };

    function attachSignin(element) {
      console.log(element.id);
      auth2.attachClickHandler(element, {},
          function(googleUser) {
	    	  // 이름 id image 정보 얻어서 callAjax 요청 정보로 보냄
	    	  var profile = googleUser.getBasicProfile();
	    	  var id = profile.getId();
	    	  var name = profile.getName();
	    	  var image = profile.getImageUrl();
	    	  callAjax(id, name, image);   	  
          }, function(error) {
            alert(JSON.stringify(error, undefined, 2));
          }); 
    }
    
   function callAjax(id, name, image){
	   /* 위 구글 로그인 완료 후 ajax로 변수값 넘겨서 session에 저장하기.*/
	   console.log("ajax 요청 시작");
	   console.log("id: " + id);
	   console.log("name: " + name);
	   console.log("image: " + image);
	   
	   // 배열을 만들고 object type 데이터를 담아서
	   var arr = new Array();
	   var obj = new Object();
	   // 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
	   var url = window.location.pathname;
	   obj.provider = "google";
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
            		// 성공 할 경우 저장했던 url 위치로 다시 돌아 가도록 함
            		location.href = url;
				}else{
					alert('에러');
					location.href = "/home.do";
				}        
            }
         
        });
    }
    
    