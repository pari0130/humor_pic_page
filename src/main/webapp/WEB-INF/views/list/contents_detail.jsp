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
    <link href='${pageContext.request.contextPath }/resources/css/detail.css?ver=5' rel='stylesheet' type='text/css'>
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
    <script src="${pageContext.request.contextPath }/resources/js/cus.google-login.js?var=2"></script>
    <!-- 페북 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.facebook-login.js"></script>
    <!-- 트위터 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.twitter-login.js?var=2"></script>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/imgLiquid-min.js"></script>
    
</head>

<body>
	<a name="ancre"></a>
    <!-- CACHE -->
    <div class="cache"></div>
    <!-- HEADER 및 NAVBAR -->
    <%-- <jsp:include page="/WEB-INF/views/nav/nav.jsp" />   --%>
    <div id="wrapper-header">
	<div id="main-header" class="object">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/home.do">
				<div style="font-size: 15px" class="oldies object">HOME</div>		
				<input type="hidden" id="getContextPath" value="${pageContext.request.contextPath }"/>															
			</a> 
			<c:choose>
			  	<c:when test="${empty user_id }">
			  	<a href="javascript:">
					<div id="modal_trigger_login" href="#modal_login"
						style="font-size: 15px" class="oldies object">LOGIN</div>					
				</a>	 	  	
			  	</c:when>
			  	<c:when test="${empty dto.cont_id }">
			  	<a href="javascript:">
					<div id="modal_trigger_upload" href="#modal_upload"
						style="font-size: 15px" class="oldies object">UPLOAD</div>
				</a> 
				<a href="${pageContext.request.contextPath }/logout.do?url=${pageContext.request.contextPath }/">
					<div id=""
						style="font-size: 15px" class="oldies object">LOGOUT</div>					
				</a>			  	
			  	</c:when>
			  	<c:otherwise>
		  		<a href="javascript:">
					<div id="modal_trigger_upload" href="#modal_upload"
						style="font-size: 15px" class="oldies object">UPLOAD</div>
				</a> 
				<%-- <a href="${pageContext.request.contextPath }/logout.do?url=${pageContext.request.contextPath }/list/contents_detail.do&cont_id=${dto.cont_id}&mn=${dto.menu_name}">
					<div id=""
						style="font-size: 15px" class="oldies object">LOGOUT</div>					
				</a> --%>
				<a href="javascript:logout()">
					<div id=""
						style="font-size: 15px" class="oldies object">LOGOUT</div>					
				</a>
		  		</c:otherwise>
	  		</c:choose>				
			<%-- <a href="${pageContext.request.contextPath }/test.do">test.do</a>
			<a href="${pageContext.request.contextPath }/test2.do">test2.do</a> --%>
		</div>
		<div id="main_tip_search">
			<form>
				<input type="text" name="search" id="tip_search_input" list="search"
					autocomplete=off required>
			</form>
		</div>
		<div id="stripes"></div>
	</div>
</div>
<!-- NAVBAR -->
<div id="wrapper-navbar">
	<div class="navbar object" ng-controller="navCtrl">
		<div id="wrapper-sorting">
			<div id="wrapper-title-1">
				<a href="${pageContext.request.contextPath }/home.do#/top" ng-click="activated='top'">
				<div class="top-rated object" id="top" ng-class="{'active': activated=='top'}">Top-rated</div>				
				</a>
				<div id="fleche-nav-1"></div>				
			</div>
			<div id="wrapper-title-2">
				<a href="${pageContext.request.contextPath }/home.do#/recent" ng-click="activated='recent'">
					<div class="recent object" id="recent" ng-class="{'active': activated=='recent'}">Recent</div>
				</a>
				<div id="fleche-nav-2"></div>
			</div>
			<div id="wrapper-title-3">
				<a href="${pageContext.request.contextPath }/home.do#/old" ng-click="activated='old'">
					<div class="oldies object" id="old" ng-class="{'active': activated=='old'}">Oldies</div>
				</a>
				<div id="fleche-nav-3"></div>
			</div>
		</div>
		<div id="wrapper-bouton-icon" >
			<a href="${pageContext.request.contextPath }/home.do#/wtf" ng-click="activated='wtf'">
				<div class="menus object" id="wtf" ng-class="{'active': activated=='wtf'}">WTF</div>
			</a>
			<a href="${pageContext.request.contextPath }/home.do#/nsfw" ng-click="activated='nsfw'">
				<div class="menus object" id="nsfw" ng-class="{'active': activated=='nsfw'}">NSFW</div>
			</a>
			<a href="${pageContext.request.contextPath }/home.do#/animals" ng-click="activated='animals'">
				<div class="menus object" id="animals" ng-class="{'active': activated=='animals'}">ANIMALS</div>
			</a>
			<a href="${pageContext.request.contextPath }/home.do#/gif" ng-click="activated='gif'">
				<div class="menus object" id="gif" ng-class="{'active': activated=='gif'}">GIF</div>
			</a>
			<a href="${pageContext.request.contextPath }/home.do#/funny" ng-click="activated='funny'">
				<div class="menus object" id="funny" ng-class="{'active': activated=='funny'}">FUNNY</div>
			</a>
			<!-- <div id="bouton-ai"><img src="img/icon-ai.svg" alt="illustrator" title="Illustrator" height="28" width="28"></div>
                <div id="bouton-psd"><img src="img/icon-psd.svg" alt="photoshop" title="Photoshop" height="28" width="28"></div>
                <div id="bouton-theme"><img src="img/icon-themes.svg" alt="theme" title="Theme" height="28" width="28"></div>
                <div id="bouton-font"><img src="img/icon-font.svg" alt="font" title="Font" height="28" width="28"></div>
                <div id="bouton-photo"><img src="img/icon-photo.svg" alt="photo" title="Photo" height="28" width="28"></div>
                <div id="bouton-premium"><img src="img/icon-premium.svg" alt="premium" title="Premium" height="28" width="28"></div> -->
		</div>
	</div>
</div>
<!-- FILTER -->
<div id="main-container-menu" class="object">
	<div class="container-menu">
		<div id="main-cross">
			<div id="cross-menu"></div>
		</div>
		<div id="main-small-logo">
			<div class="small-logo"></div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='wtf'}" id="wtf">
				<a href="${pageContext.request.contextPath }/home.do#wtf" ng-click="activated='wtf'">WTF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='nsfw'}" id="nsfw">
				<a href="${pageContext.request.contextPath }/home.do#nsfw" ng-click="activated='nsfw'">NSFW</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='animals'}" id="animals">
				<a href="${pageContext.request.contextPath }/home.do#animals" ng-click="activated='animals'">ANIMALS</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='gif'}" id="gif">
				<a href="${pageContext.request.contextPath }/home.do#gif" ng-click="activated='gif'">GIF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='funny'}" id="funny">
				<a href="${pageContext.request.contextPath }/home.do#funny" ng-click="activated='funny'">FUNNY</a>
			</div>
		</div>
	</div>
</div> 
     <!-- MAIN 컨텐츠 -->
    <!-- <ng-view></ng-view> -->
    <!-- PORTFOLIO -->
    <div id="wrapper-container">
        <div class="container object">
            <div id="main-container-image">
                <div class="title-item">
                    <!-- <div class="title-icon"></div> -->
                    <div class="title-text">${dto.cont_title } </div>
                    <div class="title-text-2">${dto.cont_date }</div>
                </div>
                <div class="work">
                    <figure class="white">
                       <%-- <img src="${pageContext.request.contextPath }/resources/img/psd-4.jpg" alt="" /> --%> 
                        <div id="wrapper-part-info">
                            <!-- <div class="part-info-image-single img-panel"> -->
                                <%-- <img src="${dto.cont_image }" alt="" width="628" height="437" /> --%>
                                <!-- <script>
				       				console.log("slice img 값 : " + "${dto.cont_image}");      				
				       				
				       				var org_url = "${dto.cont_image}";
				       				var slice1 = org_url.slice(0, 48);
				       				var slice2 = org_url.slice(48);
				       				console.log("slice1 : " + slice1);	     		
				       				console.log("slice2 : " + slice2);
				       				var fill_img = slice1 + "w_628,h_437,c_fill/" + slice2;
				       				/* console.log("slice 합 : " + slice1 + "w_243,h_300,c_fill/" + slice2); */		
				       				/* $(".img-panel").prepend('<img class="lazy"' + 'id="' + id + '" ' +  'src="" alt="" />'); */
				       				var src = $(".img-panel img").attr("src");
				       				
				       				/* if (src == org_url){
				       					$(this).attr({
				       						src : fill_img
				       					});
				       				}; */
				       				console.log("src : " + src);
				       				$(".img-panel").find("img").attr({
				       					src: fill_img		       				
				       				});
	       						</script>  -->
                                <%-- <img src="${dto.cont_image }" alt="" width="70%" height="70%" /> --%>
                                <%-- <img src="${pageContext.request.contextPath }/resources/img/mockup-2.jpg" alt="" width="628" height="437" />
                                <img src="${pageContext.request.contextPath }/resources/img/mockup-3.jpg" alt="" width="628" height="437" /> --%>
                            <!-- </div> -->
                        </div>
                    </figure>
                    <div class="wrapper-text-description">
                        <div class="wrapper-view">
                            <div class="icon-view"><img src="${pageContext.request.contextPath }/resources/img/icon-eye.svg" alt="" width="24" height="16" /></div>
                            <div class="text-view">${dto.cont_view_count } views</div>
                        </div>
                        <%-- <div class="wrapper-file">
                            <div class="icon-file"><img src="${pageContext.request.contextPath }/resources/img/icon-psdfile.svg" alt="" width="21" height="21" /></div>
                            <div class="text-file">${dto.menu_name }</div>
                        </div> --%>
                        <div class="wrapper-weight">
                            <div class="icon-weight"><img src="${pageContext.request.contextPath }/resources/img/icon-weight.svg" alt="" width="20" height="23" /></div>
                            <div class="text-weight">${dto.menu_name }</div>
                        </div>
                        <div class="wrapper-desc">
                            <div class="icon-desc"><img src="${pageContext.request.contextPath }/resources/img/icon-desc.svg" alt="" width="24" height="24" /></div>
                            <div class="text-desc">
	                        	<!-- tag 자리 -->

                            </div>
                        </div>
                        
                       <%-- <div class="wrapper-download">
                            <div class="icon-download"><img src="${pageContext.request.contextPath }/resources/img/icon-download.svg" alt="" width="19" height="26" /></div>
                            <div class="text-download"><b>share</b></div>
                        </div>  --%>
                        <div class="wrapper-morefrom">
                            <div class="text-morefrom">More contents.</div>
                            <div class="image-morefrom">
                            <c:if test="${not empty randomList}">
					            <c:forEach var="tmp" items="${randomList }">					      
					              <a href="${pageContext.request.contextPath }/list/contents_detail.do?cont_id=${tmp.cont_id}&mn=${tmp.menu_name}">
                                    <div class="image-morefrom-cont"><img src="${tmp.cont_image_fill }" alt="" width="430" height="330" /></div>
                               	 </a>
					             </c:forEach>
				             </c:if>    
                                <%-- <a href="#">
                                    <div class="image-morefrom-1"><img src="${pageContext.request.contextPath }/resources/img/psd-1.jpg" alt="" width="430" height="330" /></div>
                                </a> 
                                <a href="#">
                                    <div class="image-morefrom-cont"><img src="http://res.cloudinary.com/pari0130/image/upload/w_243,h_300,c_fill/v1511761383/NSFW/trdyrpl0khjwnpjjdeci.jpg" alt="" width="430" height="330" /></div>
                                </a>
                                <a href="#">
                                    <div class="image-morefrom-cont"><img src="http://res.cloudinary.com/pari0130/image/upload/w_243,h_300,c_fill/v1510900117/NSFW/zuyfklrjvkr7lduiggf3.jpg" alt="" width="430" height="330" /></div>
                                </a>
                                <a href="#">
                                    <div class="image-morefrom-cont"><img src="http://res.cloudinary.com/pari0130/image/upload/w_243,h_300,c_fill/v1510900093/NSFW/vkdk5qcqjgfukgaafvyk.jpg" alt="" width="430" height="330" /></div>
                                </a>  --%>                      
                            </div>
                        </div>
                    </div>
                    <%-- <div class="post-reply">
                        <div class="image-reply-post"  style="background-image: URL(${user_image})"></div> <!-- profile image --> 
                        <div class="name-reply-post">Igor vlademir</div> <!-- profile name -->
                        <div class="text-reply-post">Awesome mockup, i like it very much ! It will help me for my website i was looking for since few days. Thank you a lot.</div>
                    </div> --%>
                    <div class="post-reply-main">
	                    <c:forEach var="tmp" items="${commentList }">
	                    <div class="post-reply-2">
	                        <%-- <div class="image-reply-post" style="background-image: URL(${tmp.user_image})"> --%>
	                        <div class="image-reply-post">
	                       	 <img src="${tmp.user_image}" alt="" />	                        
	                        </div>
	                        <div class="name-reply-post">${tmp.user_name }</div>
	                        <div class="text-reply-post">${tmp.cmt_contents } </div>
	                    </div>
	                    </c:forEach>
                    </div>
                    <div class="post-send">
                        <div id="main-post-send">
                            <div id="title-post-send">Add your comment</div>
                            <form id="comment"> <%-- method="post" action="${pageContext.request.contextPath }/list/insertcomment.do?cont_id=${dto.cont_id}&mn=${dto.menu_name}" --%>
                                <fieldset>
                                    <p>
                                        <textarea id="cmt_comments" name="cmt_contents" maxlength="500" placeholder="Comments" tabindex="5" cols="30" rows="4"></textarea>
                                    </p>
                                </fieldset>
                                <div style="text-align:center;">
                                    <input type="button" name="envoi" id="submit" value="INSERT" />
                                    <!-- 사용자 정보 hidden 처리 후 넘김 -->
                                    <input type="hidden" name="cmt_cont_group" id="cmt_cont_group" value="${dto.cont_id }" />									
									<%-- <input type="hidden" name="cmt_in_group" value="${tmp.cmt_in_group }" /> --%>
                                    <input type="hidden" name="user_id" id="user_id" value="${user_id }"> 
									<input type="hidden" name="user_name" id="user_name" value="${user_name }">
									<input type="hidden" name="user_provider" id="user_provider" value="${provider }">
									<input type="hidden" name="user_image" id="user_image" value="${user_image }">
                                </div>
                                <!-- <div style="text-align:center;">
                                    <input type="submit" name="envoi" value="CHECK" />
                                </div> -->
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
    <jsp:include page="/WEB-INF/views/nav/modal.jsp" />     
    <!-- SCRIPT -->
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  -->
    <!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.localScroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-animate-css-rotate-scale.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fastclick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-colors-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-shadow-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js?ver=5"></script>
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
    <!-- ALERT -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.sweetalert.min.js?ver=1"></script>
    <script>
 	// 트위터 로그인 후 로그인 alert 창 띄우기 /* ${alertMsg} */
    if("${twAlertMsg}" != " "){
    	setTimeout(function(){        	
        	${twAlertMsg}        	
        }, 2000);	
    	// alert 띄운후 session에 저장된 twAlertMsg 를 제거함
    	<%session.removeAttribute("twAlertMsg");%>
    }
        
    /* 기본 댓글 */
	/*$("#comment").submit(function(){
		var url = window.location.pathname;
		var content=$(this).find("textarea").val();		
		
		 alert("photo_value2: "+document.getElementById("photo_value2").value) 
		if (${empty user_id}){
			swal("Login error!", "Please confirm your login!", "warning");			
			return false;
		} else if(content==''){
			swal("Empty comments!", "Please confirm the comments!", "warning");
			return false;
		} else {
			return true;
		}
	});*/
    
	// 댓글 ajax 구현
    $("#submit").click(function(){
    	var url = window.location.pathname;
		/* var content=$(this).find("textarea").val(); */		
		var content=$("#cmt_comments").val();
		
		/* alert("photo_value2: "+document.getElementById("photo_value2").value) */
		if (${empty user_id}){
			swal("Login error!", "Please confirm your login!", "warning");			
			return false;
		} else if(content==''){
			swal("Empty comments!", "Please confirm the comments!", "warning");
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
			   
			   /* alert("contents = " + $("#cmt_comments").val()); */
			   
			   obj.cmt_cont_group = $("#cmt_cont_group").val();
			   obj.cmt_comments = $("#cmt_comments").val();
			   obj.user_id = $("#user_id").val();
			   obj.user_name = $("#user_name").val();
			   obj.user_provider = $("#user_provider").val();
			   obj.user_image = $("#user_image").val();
			   arr.push(obj);
			   
			   // ajax 요청을 보낸뒤 true false return 받기	
			   // SyntaxError Unexpected and of JSON input
			   $.ajax({
		            method      : 'POST',
		            url         : '/list/insertcomment.do?cont_id=${dto.cont_id}&mn=${dto.menu_name}',
		            // json 형태로 보내기 위해서 JSON.stringify(arr)
		            data        : JSON.stringify(arr),
		            /* SyntaxError Unexpected end of JSON input 가 발생하여 datatype을 지움
		            dataType	: "json", */
		            contentType	: "application/json; charset=UTF-8",
		            error       : function(request, status, error) {
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            },
		            success     : function() {		            	
	            		console.log("성공");
	            		// 성공 후 
	            		$("#cmt_comments").val(""); 
	            		getCmtList();
		        }
		    });
			
			/* return true; */
		}
    });
	
	// 댓글 리스트 가저오기 ajax
	function getCmtList(){
		   
		$.ajax({
            method      : 'get',
            url         : '/list/getcmtlist.do?cont_id=${dto.cont_id}&mn=${dto.menu_name}',
            // json 형태로 보내기 위해서 JSON.stringify(arr)
            /* data        : JSON.stringify(arr), */
            /* SyntaxError Unexpected end of JSON input 가 발생하여 datatype을 지움
            dataType	: "json", */
            /* contentType	: "application/json; charset=UTF-8", */
            error       : function(request, status, error) {
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            },
            success     : function(result) {		            	
        		console.log("성공");
        		// 성공 후 
        		console.log(result);
        		// for문으로 ajax 댓글 추가 하기
        		for (var i = 0; i < result.length; i++){
        			$(".post-reply-main")
        			.append('<div class="post-reply-2">'
        					+ '<div class="image-reply-post">'
        					+ '<img src="' + result[i].user_image + '" width="65px" height="65px" alt=""></div>'
        					+ '<div class="name-reply-post">' + result[i].user_name + '</div>'
        					+ '<div class="text-reply-post">' + result[i].cmt_contents + '</div>'
        					+ '</div>');
        		}
        }
    });
	}
	
	
	console.log("값 : " + window.location.pathname + "?cont_id="+ getQuerystring('cont_id') +"&mn="+ getQuerystring('mn'));
	console.log("cont_id="+"${dto.cont_id}");
	console.log("menu="+"${dto.menu_name}");
	console.log("url : " + location.href);
	
	/* $(document).ready(function() {	  
	 $(".img-panel").imgLiquid({
		fill : true,
		horizontalAlign : "center",
		verticalAlign : "center"
		}); 
	}); 
	*/
	
	/* $(".img-panel").imgLiquid({
		fill : true,
		horizontalAlign : "50%",
		verticalAlign : "50%"
	}); */
	
	// detail page 에서 상단 포커스 맞추기
	var menu_name = "${sessionMenu}";
	var dto_menu = "${dto.menu_name}";
	
	console.log("session menu name : " + menu_name);
	console.log("dto menu name : " + dto_menu);
	
	// 메뉴이름을 받아와서 active class가 없을 경우에만 active class를 추가하고 형제요소에는 removeclass 수행
	if("wtf" == menu_name){
		$("#wtf").addClass("active");
	}else if("nsfw" == menu_name){
		$("#nsfw").addClass("active");
	}else if("animals" == menu_name){
		$("#animals").addClass("active");
	}else if("gif" == menu_name){
		$("#gif").addClass("active");
	}else if("funny" == menu_name){
		$("#funny").addClass("active");
	}else if("top" == menu_name){
		$("#top").addClass("active");
	}else if("recent" == menu_name){
		$("#recent").addClass("active");
	}else if("old" == menu_name){
		$("#old").addClass("active");
	// 진입한 session menu가 search 일 경우에만 menu명을 dto에 있는 menu로 변경 해 줌
	}else if("search" == menu_name){
		$("#"+dto_menu).addClass("active");
	};
	
	// tag 잘라서 넣기
	var org_tag = "${dto.cont_tag }";
	console.log("dto cont_tag " + org_tag);
	
	if(org_tag.indexOf(",") == -1){
		// ,가 포함되지 않은 하나짜리 일 경우 여기 실행하고
		$("div.text-desc").append('<tag class="cont_tag" id="tag0"></tag>');
		$("tag.cont_tag").append('<span><a href="javascript:ajaxSearch('+ org_tag +')">#' + org_tag + '</a></span>');
				/* + '<div class="cont_tag">'
				+ '<span><a href="javascript:ajaxSearch('+ org_tag +')">' + + org_tag + '</a></span>'
				+ '</div>'); */
	}else{
		// ,가 포함되어 있는 경우 잘라야 한다.
		var tagArray = org_tag.split(',');
		
		for (var i = 0; i < tagArray.length; i++){
			$("div.text-desc").append('<tag class="cont_tag" id="tag' + i + '"></tag>');
			$("tag.cont_tag#tag"+i).append('<span><a href="javascript:ajaxSearch('+  tagArray[i] +')">#' + tagArray[i] + '</a></span>');
			/*  $("div.text-desc").append(					
					+ '<tag class="cont_tag">'
					+ '<a href="javascript:ajaxSearch('+ tagArray[i] +')">'
					+ '<span>' + tagArray[i] + '</span></a>'
					+ '</tag>'); */
		};
	};
	
	// image 잘라서 넣기
    var org_image = "${dto.cont_image}";
    if(org_image.indexOf(",") == -1){
		// ,가 포함되지 않은 하나짜리 일 경우 여기 실행하고
		// <a href="javascript:ajaxSearch()"><b>${dto.cont_tag }</b></a>
		$("div#wrapper-part-info").append('<div class="part-info-image-single img-panel">'
				+ '<img src="' + org_image + '" alt="" width="628" height="437" />'
				+ '</div>');
	}else{
		// ,가 포함되어 있는 경우 잘라야 한다.
		// <div class="part-info-image-single img-panel">
		// wrapper-part-info
		var tagArray = org_image.split(',');
		for (var i = 0; i < tagArray.length; i++){
			$("div#wrapper-part-info").append('<div class="part-info-image-single img-panel">'
					+ '<img src="' + tagArray[i] + '" alt="" width="628" height="437" />'
					+ '</div>');
		};
	}; 
	
	$(".img-panel").imgLiquid();
	$(".image-reply-post").imgLiquid();
    </script>
</body>
</html>