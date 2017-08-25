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
			/*img 얻어오는 방법*/
			var img = ("http://graph.facebook.com/" + response.id + "/picture?type=normal");
			console.log('Successful login name: ' + response.name);
			console.log('Successful login id: ' + response.id);
			console.log('Successful login img: ' + img);
			
			/*alert("자동로그인 됨");*/
			/*location.href = "/home.do";*/
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