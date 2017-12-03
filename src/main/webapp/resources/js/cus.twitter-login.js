function twitterlogin() {
	// 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
	/*var path = window.location.pathname;*/
	var path;
    // 현재 요청한 위치 의 pathname을 저장함 ~~~ /home.do 등
    /*if(getQuerystring('cont_id') != '' && getQuerystring('cont_id') != null){*/
    if(window.location.pathname != "/home.do" && window.location.pathname != "/"){	   
	   /*cont_id = getQuerystring('cont_id');
	   mn = getQuerystring('mn');
	   url = window.location.pathname+"?cont_id="+cont_id+"&mn="+mn;*/
	   path = window.location.pathname+"?cont_id="+getQuerystring('cont_id')+"&mn="+getQuerystring('mn');
    }else{
	   path = window.location.pathname;   
    }	
    /*alert("tw path : " + path);*/
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
        		/*alert("twreturn : " + $("#twReturnUrl").val());*/
        		location.href = $("#twReturnUrl").val();
        	}else{
        		alert("실패 : "+ data.canUse)
        		console.log("실패");
        	}    
        }
     
    });
	
	
}
