//페이스북 SDK 초기화   
window.fbAsyncInit = function() {
	FB.init({
		appId : '308579496284145',
		status : true,
		cookie : true,
		xfbml : true
	});
};

(function(d) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/en_US/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

function facebooklogin() {
	// 페이스북 로그인 버튼을 눌렀을 때의 루틴.
	FB.login(function(response) {
		var fbname;
		var accessToken = response.authResponse.accessToken;
		FB.api('/me', function(response) {
			// 이름 id image 정보 얻어서 callAjax 요청 정보로 보냄
	    	var id = response.id;
	    	var name = response.name;
	    	/*img 얻어오는 방법*/
	    	var image = ("http://graph.facebook.com/" + response.id + "/picture?type=normal"); 
	    	console.log('Successful login name: ' + response.name);
			console.log('Successful login id: ' + response.id);
			console.log('Successful login img: ' + image);
			callAjax(id, name, image); 
		});
		
	}, {
		scope : 'public_profile,email'
	});
	
}

function facebooklogout() {
	FB.logout(function(response) {
		// Person is now logged out
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
	   obj.provider = "facebook";
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
         // 요청시 이름이 한글일 경우 깨지는것 방지 utf-8
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