<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- <html ng-app="myApp"> -->
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>test</title>
    <!-- Behavioral Meta Data -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/img/small-logo-01.png">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath }/resources/css/style.css?ver=7' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
    <!-- MODAL -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css?ver=2" /> 
    <!-- UPLOAD > TAG -->
    <link href="${pageContext.request.contextPath }/resources/css/tagify.css?ver=1" rel="stylesheet">
    <!-- LOADING PROGRESS -->
    <link href="${pageContext.request.contextPath }/resources/css/gspinner.min.css?ver=1" rel="stylesheet">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/imgLiquid-min.js"></script>
    
    <!-- 구글 로그인 연동 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="221557223102-0gp35bn76pkch9bn8ru3k463oghpoqbq.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/api.js"></script>  
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/cus.google-login.js?var=4"></script>
    <!-- 페북 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.facebook-login.js?var=1"></script>
    <!-- 트위터 로그인 연동 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.twitter-login.js?var=1"></script>
    <!-- single page 이동을 위한 angularjs -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-animate.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.js"></script>
	<script>
	var myApp=angular.module("myApp",["ngRoute","ngAnimate"]);
	// single page 라우터 설정 
	myApp.config(function($routeProvider){
		$routeProvider
		.when("/", {templateUrl:"/list/contents_list.do?mn=top"})
		.when("/home", {templateUrl:"/list/contents_list.do?mn=top"})
		.when("/top", {templateUrl:"/list/contents_list.do?mn=top"})
		.when("/recent", {templateUrl:"/list/contents_list.do?mn=recent"})
		.when("/old", {templateUrl:"/list/contents_list.do?mn=old"})
		/* .when("/", {templateUrl:"/list/contents_list.do?mn=wtf"})
		.when("/home", {templateUrl:"/list/contents_list.do?mn=wtf"}) */
		.when("/wtf", {templateUrl:"/list/contents_list.do?mn=wtf"})
		.when("/nsfw", {templateUrl:"/list/contents_list.do?mn=nsfw"})
		.when("/animals", {templateUrl:"/list/contents_list.do?mn=animals"})
		.when("/gif", {templateUrl:"/list/contents_list.do?mn=gif"})
		.when("/funny", {templateUrl:"/list/contents_list.do?mn=funny"})
		// 검색
		.when("/search", {templateUrl:"/list/contents_list.do?mn=search"})
		.otherwise({rediredTo:"/"});
	});
	myApp.controller("navCtrl", function($scope){
		$scope.activated="top";
	});
	
	/*  $(document).ready(function() {	  
			 $(".imgLiquid").imgLiquid({
				fill : true,
				horizontalAlign : "center",
				verticalAlign : "center"
			}); 
	   }); */
	</script>	
	<!-- <style>
		figure.img-panel { display:none; }
	</style>  -->
</head>
<body>
	<a name="ancre"></a>
    <!-- CACHE -->
    <div class="cache"></div>
    <!-- HEADER 및 NAVBAR -->
    <jsp:include page="/WEB-INF/views/nav/nav.jsp" />   
     
    <!-- MAIN 컨텐츠 -->
    <ng-view></ng-view>
    <!-- <div ng-view></div> -->
    <%-- <jsp:include page="/WEB-INF/views/list/contents_list.jsp" /> --%>
    
    <!-- modal 팝업창 -->
    <jsp:include page="/WEB-INF/views/nav/modal.jsp" /> 
    <!-- SCRIPT -->
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  -->
    <!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js?ver=3"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.localScroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-animate-css-rotate-scale.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fastclick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-colors-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.animate-shadow-min.js"></script>
    <!-- MODAL -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.leanModal.min.js"></script>
    <!-- UPLOAD > cloudinary -->
    <script src="http://widget.cloudinary.com/global/all.js" type="text/javascript"></script>
    <!-- UPLOAD > MENU -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.ddslick.min.js"></script>
    <!-- UPLOAD > TAG -->
    <script src="${pageContext.request.contextPath }/resources/js/jQuery.tagify.js?ver=2"></script>
    <!-- MODAL 관련 이것저것 js에 담음 -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.modal-popup.js?var=2 "></script>
    <!-- jquery.lazyload -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery.lazyload.js"></script>
   	<!-- 카톡 로그인 연동 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/cus.kakao-login.js?ver=1"></script>
    <!-- ALERT -->
    <script src="${pageContext.request.contextPath }/resources/js/cus.sweetalert.min.js?ver=1"></script>
    <!-- LOADING PROGRESS -->
    <script src="${pageContext.request.contextPath }/resources/js/g-spinner.min.js?ver=1"></script>
    	
    <script>   	
 	// 트위터 로그인 후 로그인 alert 창 띄우기 /* ${alertMsg} */
    if("${twAlertMsg}" != " "){
    	setTimeout(function(){        	
        	${twAlertMsg}        	
        }, 2000);	
    	// alert 띄운후 session에 저장된 twAlertMsg 를 제거함
    	<%session.removeAttribute("twAlertMsg");%>
    }
    
    /* ${twAlert} */   
    
   /* lazyload 처리 */
   $(function() {
        $("img.lazy").lazyload({
            effect: "fadeIn",
            effectTime: 500
        });
    });   
    
   // image 비율 조정
   $(document).ready(function() {	  
	 $(".img-panel").imgLiquid({
		fill : true,
		horizontalAlign : "center",
		verticalAlign : "center"
		}); 
	}); 
   
   // LoadMore 처리 부분
 /*   var pageNum = "${pageNum}"; 
   var startPgNum = "${startPageNum}";
   console.log("pageNum : " + pageNum);
   console.log("startPgNum : " + startPgNum); */
   // 메뉴를 클릭했을때 pageNum 을 1로 초기화 한다.
   // 현재 진입한 메뉴가 active 상태에서는 1로 초기화 하지않는다.
   // pagenum이 1이나 1이상이고 진입한 메뉴가 active 일때는  초기화 하지 않는다.
   // 클릭했을때 siblings()를 이용해서 다른 형제 요소에 inactive를 넣고 active 상태일때만 동작
   /*$(".menus").click(function(){
	  if($(this).hasClass("active") === true ){
		  return;  
	  }else{
		  pageNum = 1;
	  } 
	  var menu = $("#getMenuName").val();
	  if($("#menus_wtf").hasClass("active") === true){
		  
	  } 
   }); */
   
  
    </script>
</body>
</html>