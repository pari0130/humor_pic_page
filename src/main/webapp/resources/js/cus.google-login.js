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
	    	  callAjax_gg(id, name, image);   	  
          }, function(error) {
            alert(JSON.stringify(error, undefined, 2));
          }); 
    }
    
   function callAjax_gg(id, name, image){
	   /* 위 구글 로그인 완료 후 ajax로 변수값 넘겨서 session에 저장하기.*/
	   console.log("ajax 요청 시작");
	   console.log("id: " + id);
	   console.log("name: " + name);
	   console.log("image: " + image);
	   console.log("url: " + window.location.pathname);
	   console.log("----------------------------------------------");
	   
	   // 배열을 만들고 object type 데이터를 담아서
	   var arr = new Array();
	   var obj = new Object();
	   /*var url = window.location.pathname; */
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

	   obj.provider = "google";
	   obj.id = id;
	   obj.name = name;
	   obj.image = image;
	   arr.push(obj);
	   
	   
	   // ajax 요청을 보낸뒤 true false return 받기
	   $.ajax({
            method      : 'POST',
            url         : $("#getContextPath").val()+'/socialajax.do',
            // json 형태로 보내기 위해서 JSON.stringify(arr)
            data        : JSON.stringify(arr),
            dataType	: "json",
            contentType	: "application/json; charset=UTF-8",
            error       : function(request, status, error) {
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            },
            success     : function(data) {
            	if(data.canUse){
            		console.log("google 성공");   
            		console.log("수정url : " + url);            		
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
            		// 팝업확인창 밖을 클릭했을때도 url 이동되게 if문으로 집어 넣어야함.
				}else{
					alert('error 0001');
					location.href = "/home.do";
				}     
            	
            }
         
        });
    }
    
   


   
    