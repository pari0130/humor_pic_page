 /*-- MODAL --*/
    $("#modal_trigger_login").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

    $("#modal_trigger_upload").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });
    
    $("#modal_trigger_alert").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

    /*-- UPLOAD --*/
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
            var urls = [];
            for (var i = 0; i < result.length; i++) {
                /*url hidden value에 담기*/
                tmp = result[i].url;
                urls.push(tmp);

                /*썸네일 이미지 생성*/
                var thum_url = result[i].thumbnail_url;
                $(".photo_p").append('<img class="photo_value" src="" alt="" />');
                $(".photo_p").find("img").last().attr({
                    src: thum_url
                });
            }
            var upload_url = $("#upload_image").val(urls);
            /*console.log("upload_url : " + $("#upload_image").val())              */
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




    /* submit 이벤트 처리 */
    $("#submit").click(function(event) {

        /*tag에 있는 값을 배열에 담아서 출력하기 + hidden에 담기*/
        var org_tags = [];
        for (var i = 0; i < $("tags").find("span").length; i++) {
            /*eq를 사용하면 span안에 있는 text 값을 가져온다*/
            tmp = $.trim($("tags").find("span").eq(i).html());
            org_tags.push(tmp);
        }
        var slice_tags = org_tags.slice(0, -1);
        var upload_tags = $("#upload_tag").val(slice_tags);
        console.log("uplpad tags 값 : " + $("#upload_tag").val());

        /*menu 값 가져오기 와서 hidden에 담기 */
        var org_menu = $(".dd-selected-text").eq(0).html();
        var uplpad_menu = $("#upload_menu").val(org_menu);
        console.log("upload menu 값 : " + $("#upload_menu").val());

        /*이미지 업로드시 담았던 값 확인*/
        console.log("upload_image 값 : " + $("#upload_image").val())

        /*if(true){
          $("#upload_form").submit();
          document.getElementById("yourFormId").submit();
        }*/
    });