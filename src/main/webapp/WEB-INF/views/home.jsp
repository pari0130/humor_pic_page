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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/img/small-logo-01.png">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath }/resources/css/style.css?ver=2' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
    <!-- MODAL -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css?ver=1" />
    <!-- UPLOAD > TAG -->
    <!-- <link type="text/css" rel="stylesheet" href="css/tags.css" /> -->
    <!-- TEST -->
    <link href="${pageContext.request.contextPath }/resources/css/tagify.css?ver=1" rel="stylesheet">
    
    <!-- 구글 로그인 연동 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="221557223102-0gp35bn76pkch9bn8ru3k463oghpoqbq.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/api.js"></script>  
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/cus.google-login.js?var=1"></script>
    <!-- 페북 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.facebook-login.js?var=1"></script>
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
                <section class="work">
                <% for(int i=0; i < 20; i++){ %>
                    <figure class="white showthis">
                        <a href="${pageContext.request.contextPath }/list/contents_detail.do">
                           <img  data-original="${pageContext.request.contextPath }/resources/img/psd-4.jpg" class="lazy" alt="" />
                           <dl>
                            <dt>Wordpress theme</dt>
                            <dd>Symphony is a responsive one page website template designed with sketches and coded with html5 and php. Freebie released by Lacoste Xavier.</dd>    
                        </dl>
                    </a>
                        <div id="wrapper-part-info">
                            <%-- <div class="part-info-image"><img src="${pageContext.request.contextPath }/resources/img/icon-psd.svg" alt="" width="28" height="28" /></div> --%>
                            <div id="part-info">${user_id }</div>
                        </div>
                    </figure>  
                 <%} %>                
                </section>
            </div>
        </div>
        <div id="wrapper-oldnew">
            <div class="oldnew">
                <div class="wrapper-oldnew-prev">
                    <div id="oldnew-prev"></div>
                </div>
                <div class="wrapper-oldnew-next">
                    <div id="oldnew-next"></div>
                </div>
            </div>
        </div>
        <div id="wrapper-thank">
            <div class="thank">
                <div class="thank-text">Pic<span style="letter-spacing:-5px;">h</span>umor</div>
            </div>
        </div>
        <div id="main-container-footer">
            <div class="container-footer">
                <div id="row-1f">
                    <div class="text-row-1f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">What is Platz</span>
                        <br>Platz is a blog showcasing hand-picked free themes, design stuff, free fonts and other resources for web designers.</div>
                </div>
                <div id="row-2f">
                    <div class="text-row-2f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">How does it work</span>
                        <br>Platz offers you all the latest freebies found all over the fourth corners without to pay.</div>
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
                <div class="copy-text object">Copyright © 2016. Template by <a style="color:#D0D1D4;" href="https://dcrazed.com/">Dcrazed</a></div>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js?ver=1"></script>
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
    <script src="${pageContext.request.contextPath }/resources/js/cus.kakao-login.js?ver=1"></script>
    <script>
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