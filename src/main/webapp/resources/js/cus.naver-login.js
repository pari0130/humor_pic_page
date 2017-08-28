var naver_id_login = new naver_id_login("6CsU_o3t470WeS45_Lr3", "http://127.0.0.1:8888");
var state = naver_id_login.getUniqState();
/*naver_id_login.setButton("white", 1, 40);*/
/* naver_id_login.setDomain("http://127.0.0.1:8888"); */
/*naver_id_login.setState(state);*/
/*naver_id_login.setPopup();*/
naver_id_login.init_naver_id_login();

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	// naver_id_login.getProfileData('프로필항목명');
	// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
	console.log("email : " + naver_id_login.getProfileData('email'));
	console.log("nick : " + naver_id_login.getProfileData('nickname'));
	console.log("age : " + naver_id_login.getProfileData('age'));
	console.log('로그인 성공')
	
}
