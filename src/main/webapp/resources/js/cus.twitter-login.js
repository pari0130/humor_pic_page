function twitterlogin() {
	// 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
	var path = window.location.pathname;
	
	// ajax로 현재 url정보를 저장해준다.
	$.ajax({
        method      : 'GET',
        url         : $("#getContextPath").val()+'/saveTwPath.do',
        data        : {path:path},        
        error       : function(request, status, error) {
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        },
        success     : function(data) {
        	if(data.canUse){
        		console.log("성공");
        		/*alert("결과 : "+ data.canUse)*/
        		location.href = $("#twReturnUrl").val();
        	}else{
        		console.log("실패");
        	}    
        }
     
    });
	
	
}
