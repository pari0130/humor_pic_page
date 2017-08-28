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
    	  var profile = googleUser.getBasicProfile();
    	  alert("profile:"+profile.getId());
    	  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
          console.log('Full Name: ' + profile.getName());
          console.log('Given Name: ' + profile.getGivenName());
          console.log('Family Name: ' + profile.getFamilyName());
          console.log("Image URL: " + profile.getImageUrl());
          console.log("Email: " + profile.getEmail());
          /* $(".modal_close").click(); */
          /*  */
          /* document.getElementById('name').innerText = "Signed in: " +
                googleUser.getBasicProfile().getName(); */
          /* 페이지가 이동되면 로그는 지워지지만 데이터는 정상적으로 받아옴. 
          alert 창 하나 띄워주던지 설정 필요함 */
          /*location.href = "/home.do";*/
          }, function(error) {
            alert(JSON.stringify(error, undefined, 2));
          }); 
    }
    
    /* 위 구글 로그인 완료 후 ajax로 변수값 넘겨서 session에 저장하기.
    var arr = ['a', 'b', 'c'];
    
    jQuery.ajaxSettings.traditional = true;
     
    $.ajax({
        method      : 'POST',
        url         : 'test.do',
        data        : {
            'test' : arr
        },
        error       : function(request, status, error) {
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        },
        success     : function(msg) {
            alert(msg);        
        }
     
    }); */