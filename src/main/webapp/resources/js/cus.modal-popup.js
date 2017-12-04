 /*-- MODAL --*/
    $("#modal_trigger_login").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

    $("#modal_trigger_upload").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });
    
    $("#modal_trigger_alert").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

    /*-- UPLOAD --*/
    var modal_urls = [];
    $("#upload_widget_opener").click(function() {
        var folder = $(".dd-selected-text").eq(0).html();
        cloudinary.openUploadWidget({
            /*업로드 위젯 옵션설정 */
            cloud_name: 'pari0130',
            upload_preset: 'z8pxxf5a',
            sources: ['local', 'url', 'facebook', 'google_photos'],
            multiple: 'true',
            folder: folder,
            theme: 'minimal',
            max_files: '10'
        }, function(error, result) {
            /*성공했을때 result에는 url, thum_url 등 여러 정보가 담겨서 옴*/
            console.log(error, result);
            /*반복문 돌면서 img 만들어주고, img 중에 last에 해당하는 img의 attr src에 thum_url 입력해줌*/
            /*p요소가 없을때만 p요소를 만들어서 안내 문구를 적는다. */
            /*if you want delete, select an images*/
            if (!($('.photo_p').length > 0)) {
                $("#photo_div").append('<p class="photo_p"/></p>')
            }

            /*배열 만들어서 반복문 돌며 hidden value에 담기*/
            /*var urls = [];*/
            for (var i = 0; i < result.length; i++) {
                /*url hidden value에 담기*/
                tmp = result[i].url;
                modal_urls.push(tmp);

                /*썸네일 이미지 생성*/
                var thum_url = result[i].thumbnail_url;
                $(".photo_p").append('<img class="photo_value" src="" alt="" />');
                $(".photo_p").find("img").last().attr({
                    src: thum_url
                });
            };
            console.log("urls " + modal_urls);
            var upload_url = $("#up_image").val(modal_urls);
            console.log("upload_url : " + $("#up_image").val()) 
            
            console.log("modal_urls 배열 " + modal_urls[0]);
			var cont_image = modal_urls[0];
			var slice1 = cont_image.slice(0, 48);
			var slice2 = cont_image.slice(48);
			console.log("slice1 : " + slice1);	     		
			console.log("slice2 : " + slice2);
			var fill_img = slice1 + "w_243,h_300,c_fill/" + slice2;
			console.log("slice 합 : " + slice1 + "w_243,h_300,c_fill/" + slice2);	
			
			var cont_image_fill = $("#up_image_fill").val(fill_img);
			
			console.log("cont_image_fill : " + $("#up_image_fill").val());			
        });
    });

    /*모달 닫았을때는 img src 삭제*/
    $(".modal_close").click(function() {
        /*$("#photo_div").find("img").attr("src", "");*/
        $(".user_upload").find("input").val("");
        /*$('#photo_div img').remove();*/
        $('.photo_p').empty();
        $('.photo_p').remove();
        /*tag 목록 삭제*/
        $('tags tag').remove();
        $('#upload_tag i').remove();
    })
    $("#lean_overlay").click(function() {
        /*$("#photo_div").find("img").attr("src", "");*/
        $(".user_upload").find("input").val("");
        /*$('#photo_div img').remove();*/
        $('.photo_p').empty();
        $('.photo_p').remove();
        /*tag 목록 삭제*/
        $('tags tag').remove();
        $('#upload_tag i').remove();
    })

    $('#demo-htmlselect').ddslick({
        data: ddData,
        width: 300,
        imagePosition: "left",
        selectText: "Select your favorite social network",
        onSelected: function(data) {
            console.log(data);
        }
    });

    //Dropdown plugin data
    var ddData = [{
            text: "Facebook",
            value: 1,
            selected: false,
            description: "Description with Facebook"
            /*imageSrc: "http://i.imgur.com/XkuTj3B.png"*/
        },
        {
            text: "Twitter",
            value: 2,
            selected: false,
            description: "Description with Twitter"
            /*imageSrc: "http://i.imgur.com/8ScLNnk.png"*/
        },
        {
            text: "LinkedIn",
            value: 3,
            selected: true,
            description: "Description with LinkedIn"
            /*imageSrc: "http://i.imgur.com/aDNdibj.png"*/
        },
        {
            text: "Foursquare",
            value: 4,
            selected: false,
            description: "Description with Foursquare"
            /*imageSrc: "http://i.imgur.com/kFAk2DX.png"*/
        }
    ];

    /*TEST*/
    // jQuery
    $('[name=tags]').tagify({ duplicates: false });




    /* submit 이벤트 처리  upload_form*/
    /*$("#submit").click(function() {*/
    /*$("#upload_form").submit(function() {*/
    function uploadForm(){
        /*tag에 있는 값을 배열에 담아서 출력하기 + hidden에 담기*/
        var org_tags = [];
        for (var i = 0; i < $("tags").find("span").length; i++) {
            /*eq를 사용하면 span안에 있는 text 값을 가져온다*/
            tmp = $.trim($("tags").find("span").eq(i).html());
            org_tags.push(tmp);
        }
        var slice_tags = org_tags.slice(0, -1);
        var upload_tags = $("#up_tag").val(slice_tags);
        console.log("uplpad tags 값 : " + $("#up_tag").val());

        /*menu 값 가져오기 와서 hidden에 담기 */
        var org_menu = $(".dd-selected-text").eq(0).html();
        var uplpad_menu = $("#up_menu").val(org_menu);
        
        /*이미지 업로드시 담았던 값 확인*/
        console.log("upload menu 값 : " + $("#up_menu").val());
        console.log("upload tag 값 : " + $("#up_tag").val());
        console.log("cont_image 값 : " + $("#up_image").val());        
        console.log("cont_image 값 : " + $("#up_image_fill").val());
        console.log("cont_title 값 : " + $("#up_title").val());
        console.log("user_id 값 : " + $("#up_id").val());
        console.log("user_name 값 : " + $("#up_name").val());
        console.log("user_provider 값 : " + $("#up_provider").val());

        /*document.getElementById('upload_form').submit();*/
        
        /* alert("photo_value2: "+document.getElementById("photo_value2").value) */
		if ($("#up_title").val() == "" || $("#up_title").val() == null ){
			swal("Empty title!", "Please confirm the title!", "warning");			
			return false;
		} else if($("#up_tag").val() == "" || $("#up_tag").val() == null){
			swal("Empty tag!", "Please confirm the tag!", "warning");
			return false;
		} else if($("#up_image").val() == "" || $("#up_image").val() == null){
			swal("Empty image!", "Please confirm the image!", "warning");
			return false;
		} else {
			/* 위 구글 로그인 완료 후 ajax로 변수값 넘겨서 session에 저장하기.*/
			  /*  console.log("ajax 요청 시작");
			   console.log("id: " + id);
			   console.log("name: " + name);
			   console.log("image: " + image); */
			   
			   // 배열을 만들고 object type 데이터를 담아서
			   var arr = new Array();
			   var obj = new Object();
			   
			   obj.cont_menu = $("#up_menu").val();
			   obj.cont_tag = $("#up_tag").val();
			   obj.cont_image = $("#up_image").val();
			   obj.cont_image_fill = $("#up_image_fill").val();
			   obj.cont_title = $("#up_title").val();
			   obj.user_id = $("#up_id").val();
			   obj.user_name = $("#up_name").val();
			   obj.user_provider = $("#up_provider").val();			   
			   arr.push(obj);
			   
			   // ajax 요청을 보낸뒤 true false return 받기	
			   // SyntaxError Unexpected and of JSON input
			   $.ajax({
		            method      : 'POST',		            
		            url         : '/upload.do?mn=' + $("#up_menu").val(),
		            // json 형태로 보내기 위해서 JSON.stringify(arr)
		            data        : JSON.stringify(arr),
		            /* SyntaxError Unexpected end of JSON input 가 발생하여 datatype을 지움
		            dataType	: "json", */
		            contentType	: "application/json; charset=UTF-8",
		            error       : function(request, status, error) {
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            },
		            success     : function() {            	
		            	swal("Upload success!!", "", "success", {
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
	            			    	window.location.reload(true);       
	            			      break;
	            			}
	            		}); 
	            		/*swal("Upload success!", "", "success");
	            		$(".modal_close").click();*/
	            			
	            		
		        }
		    });
		}
    };