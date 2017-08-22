<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>test</title>
    <!-- Behavioral Meta Data -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="img/small-logo-01.png">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath }/resources/css/detail.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
    <!-- MODAL -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />
    <!-- UPLOAD > TAG -->
    <!-- <link type="text/css" rel="stylesheet" href="css/tags.css" /> -->
    <!-- TEST -->
    <link href="${pageContext.request.contextPath }/resources/css/tagify.css" rel="stylesheet">
</head>

<body>
	<a name="ancre"></a>
    <!-- CACHE -->
    <div class="cache"></div>
    <!-- HEADER 및 NAVBAR -->
    <jsp:include page="/WEB-INF/views/nav.jsp" />   
     
    <!-- PORTFOLIO -->
    <div id="wrapper-container">
        <div class="container object">
            <div id="main-container-image">
                <div class="title-item">
                    <div class="title-icon"></div>
                    <div class="title-text">Ipad Pro Mockup </div>
                    <div class="title-text-2">Sept 25, 2015 by Onuur</div>
                </div>
                <div class="work">
                    <figure class="white">
                        <img src="${pageContext.request.contextPath }/resources/img/psd-4.jpg" alt="" />
                        <div id="wrapper-part-info">
                            <div class="part-info-image-single">
                                <img src="${pageContext.request.contextPath }/resources/img/mockup-1.jpg" alt="" width="628" height="437" />
                                <img src="${pageContext.request.contextPath }/resources/img/mockup-2.jpg" alt="" width="628" height="437" />
                                <img src="${pageContext.request.contextPath }/resources/img/mockup-3.jpg" alt="" width="628" height="437" />
                            </div>
                        </div>
                    </figure>
                    <div class="wrapper-text-description">
                        <div class="wrapper-view">
                            <div class="icon-view"><img src="${pageContext.request.contextPath }/resources/img/icon-eye.svg" alt="" width="24" height="16" /></div>
                            <div class="text-view">2,451 views</div>
                        </div>
                        <div class="wrapper-file">
                            <div class="icon-file"><img src="${pageContext.request.contextPath }/resources/img/icon-psdfile.svg" alt="" width="21" height="21" /></div>
                            <div class="text-file">Photoshop</div>
                        </div>
                        <div class="wrapper-weight">
                            <div class="icon-weight"><img src="${pageContext.request.contextPath }/resources/img/icon-weight.svg" alt="" width="20" height="23" /></div>
                            <div class="text-weight">23 Mo</div>
                        </div>
                        <div class="wrapper-desc">
                            <div class="icon-desc"><img src="${pageContext.request.contextPath }/resources/img/icon-desc.svg" alt="" width="24" height="24" /></div>
                            <div class="text-desc">TAG TAG TAG TAG TAG TAG TAG TAG TAG TAG TAG  </div>
                        </div>
                        <div class="wrapper-download">
                            <div class="icon-download"><img src="${pageContext.request.contextPath }/resources/img/icon-download.svg" alt="" width="19" height="26" /></div>
                            <div class="text-download"><a href="#"><b>Download</b></a></div>
                        </div>
                        <div class="wrapper-morefrom">
                            <div class="text-morefrom">More from .psd</div>
                            <div class="image-morefrom">
                                <a href="#">
                                    <div class="image-morefrom-1"><img src="${pageContext.request.contextPath }/resources/img/psd-1.jpg" alt="" width="430" height="330" /></div>
                                </a>
                                <a href="#">
                                    <div class="image-morefrom-2"><img src="${pageContext.request.contextPath }/resources/img/psd-2.jpg" alt="" width="430" height="330" /></div>
                                </a>
                                <a href="#">
                                    <div class="image-morefrom-3"><img src="${pageContext.request.contextPath }/resources/img/psd-3.jpg" alt="" width="430" height="330" /></div>
                                </a>
                                <a href="#">
                                    <div class="image-morefrom-4"><img src="${pageContext.request.contextPath }/resources/img/psd-6.jpg" alt="" width="430" height="330" /></div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="post-reply">
                        <div class="image-reply-post"></div>
                        <div class="name-reply-post">Igor vlademir</div>
                        <div class="text-reply-post">Awesome mockup, i like it very much ! It will help me for my website i was looking for since few days. Thank you a lot.</div>
                    </div>
                    <div class="post-reply-2">
                        <div class="image-reply-post-2"></div>
                        <div class="name-reply-post-2">Nathan Shaw</div>
                        <div class="text-reply-post-2">Well done ! I like the way you did it. Awesome ! </div>
                    </div>
                    <div class="post-send">
                        <div id="main-post-send">
                            <div id="title-post-send">Add your comment</div>
                            <form id="contact" method="post" action="/onclickprod/formsubmit_op.asp">
                                <fieldset>
                                    <p>
                                        <textarea id="message" name="message" maxlength="500" placeholder="Votre Message" tabindex="5" cols="30" rows="4"></textarea>
                                    </p>
                                </fieldset>
                                <div style="text-align:center;">
                                    <input type="submit" name="envoi" value="Envoyer" />
                                </div>
                                <div style="text-align:center;">
                                    <input type="submit" name="envoi" value="CHECK" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="wrapper-thank">
            <div class="thank">
                <div class="thank-text">bu<span style="letter-spacing:-5px;">rs</span>tfly</div>
            </div>
        </div>
        <div id="main-container-footer">
            <div class="container-footer">
                <div id="row-1f">
                    <div class="text-row-1f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">What is Burstfly</span>
                        <br>Burstfly is just a blog showcasing hand-picked free themes, design stuff, free fonts and other resources for web designers.</div>
                </div>
                <div id="row-2f">
                    <div class="text-row-2f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">How does it work</span>
                        <br>Burstfly offers you all the latest freebies found all over the fourth corners without to pay.</div>
                </div>
                <div id="row-3f">
                    <div class="text-row-3f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Get in touch!</span>
                        <br>Subscribe our RSS or follow us on Facebook, Google+, Pinterest or Dribbble to keep updated.</div>
                </div>
                <div id="row-4f">
                    <div class="text-row-4f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Newsletter</span>
                        <br>You will be informed monthly about the latest content avalaible.</div>
                    <div id="main_tip_newsletter">
                        <form>
                            <input type="text" name="newsletter" id="tip_newsletter_input" list="newsletter" autocomplete=off required>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="wrapper-copyright">
            <div class="copyright">
                <div class="copy-text object">Copyright © 2016. Template by <a style="color:#D0D1D4;" href="http://designscrazed.org/">Dcrazed</a></div>
                <div class="wrapper-navbouton">
                    <div class="google object">g</div>
                    <div class="facebook object">f</div>
                    <div class="linkin object">i</div>
                    <div class="dribbble object">d</div>
                </div>
            </div>
        </div>
    </div>
    <!-- modal 팝업창 -->
    <jsp:include page="/WEB-INF/views/modal.jsp" /> 
    
    <!-- SCRIPT -->
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  -->
    <!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.localScroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-animate-css-rotate-scale.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fastclick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-colors-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-shadow-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    <!-- MODAL -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.leanModal.min.js"></script>
    <!-- UPLOAD > cloudinary -->
    <script src="http://widget.cloudinary.com/global/all.js" type="text/javascript"></script>
    <!-- UPLOAD > MENU -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.ddslick.min.js"></script>
    <!-- UPLOAD > TAG -->
    <script src="${pageContext.request.contextPath }/resources/js/jQuery.tagify.js"></script>
    <!-- jquery.lazyload -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery.lazyload.js"></script>
    <script>
    /*$('.work').infiniteScroll({
                  // options
                  path: '.pagination__next',
                  append: '.white',
                  history: false,
                });*/
    /*$(window).scroll(function() {
        if($(window).scrollTop() >= $(window).height() - $(document).height() - 300){
            $(".work").append('<figure class="white"><a href="#"><img src="img/theme-2.jpg" class="lazy" alt="" /><dl><dt>Html theme</dt><dd>Symphony is a responsive one page website template designed with sketches and coded with html5 and php. Freebie released by Lacoste Xavier.</dd></dl></a><div id="wrapper-part-info"><div class="part-info-image"><img src="img/icon-themes.svg" alt="" width="28" height="28" /></div><div id="part-info">Html theme</div></div></figure>');
            $(".white").fadeIn(); 
        }
    });*/




    /* PRELOADER */
    /* function preloader() {
        if (document.images) {
            var img1 = new Image();
            var img2 = new Image();
            var img3 = new Image();
            var img4 = new Image();
            var img5 = new Image();
            var img6 = new Image();
            var img7 = new Image();
            var img8 = new Image();
            var img9 = new Image();
            var img10 = new Image();
            var img11 = new Image();
            var img12 = new Image();
            var img13 = new Image();
            var img14 = new Image();
            var img15 = new Image();
            var img16 = new Image();
            var img17 = new Image();
            var img18 = new Image();
            var img19 = new Image();
            var img20 = new Image();

            img1.src = "img/psd-4.jpg";
            img2.src = "img/font-1.jpg";
            img3.src = "img/psd-1.jpg";
            img4.src = "img/psd-2.jpg";
            img5.src = "img/ai-1.jpg";
            img6.src = "img/theme-2.jpg";
            img7.src = "img/psd-3.jpg";
            img8.src = "img/font-2.jpg";
            img9.src = "img/font-3.jpg";
            img10.src = "img/ai-2.jpg";
            img11.src = "img/icons-1.jpg";
            img12.src = "img/ui-1.jpg";
            img13.src = "img/font-5.jpg";
            img14.src = "img/theme-2.jpg";
            img15.src = "img/psd-5.jpg";
            img16.src = "img/icons-3.jpg";
            img17.src = "img/font-4.jpg";
            img18.src = "img/theme-3.jpg";
            img19.src = "img/font-6.jpg";
            img20.src = "img/theme-4.jpg";
        }
    }
    */
    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        } else {
            window.onload = function() {
                if (oldonload) {
                    oldonload();
                }
                func();
            }
        }
    }
    /*addLoadEvent(preloader);*/

    /*-- MODAL --*/
    $("#modal_trigger_login").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

    $("#modal_trigger_upload").leanModal({ top: 200, overlay: 0.6, closeButton: ".modal_close" });

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
    })

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

    /* lazyload 처리 */
    $(function() {
        $("img.lazy").lazyload({
            effect: "fadeIn",
            effectTime: 500
        });
    });
    </script>
</body>
</html>