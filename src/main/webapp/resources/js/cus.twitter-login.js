function twitterlogin() {
	// 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
	var path = window.location.pathname;
	// twReturnUrl에 twitter jstl값을 넣어서 받아오기
	var call_url = $("#twReturnUrl").val() + "&url=" + path;
	console.log("tw url : " + call_url);
	alert("tw url: " + call_url);
	location.href = call_url;
}