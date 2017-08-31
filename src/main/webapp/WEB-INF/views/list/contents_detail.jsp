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
    <!-- 구글 로그인 연동 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="221557223102-0gp35bn76pkch9bn8ru3k463oghpoqbq.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/api.js"></script>  
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/cus.google-login.js"></script>
    <!-- 페북 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.facebook-login.js"></script>
    <!-- 트위터 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.twitter-login.js?var=1"></script> 
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
    <!-- MODAL 관련 이것저것 js에 담음 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.modal-popup.js"></script>
    <!-- jquery.lazyload -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery.lazyload.js"></script>
    <!-- 카톡 로그인 연동 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/cus.kakao-login.js"></script>
</body>
</html>