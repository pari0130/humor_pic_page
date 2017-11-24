<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<a href="#/top" ng-click="activated='top'">
				<div class="top-rated object" id="menus_top" ng-class="{'active': activated=='top'}">Top-rated</div>				
				</a>
				<div id="fleche-nav-1"></div>				
			</div>
			<div id="wrapper-title-2">
				<a href="#/recent" ng-click="activated='recent'">
					<div class="recent object" id="menus_recent" ng-class="{'active': activated=='recent'}">Recent</div>
				</a>
				<div id="fleche-nav-2"></div>
			</div>
			<div id="wrapper-title-3">
				<a href="#/old" ng-click="activated='old'">
					<div class="oldies object" id="menus_old" ng-class="{'active': activated=='old'}">Oldies</div>
				</a>
				<div id="fleche-nav-3"></div>
			</div>
		</div>
		<div id="wrapper-bouton-icon" >
			<a href="#/wtf" ng-click="activated='wtf'">
				<div class="menus object" id="menus_wtf" ng-class="{'active': activated=='wtf'}">WTF</div>
			</a>
			<a href="#/nsfw" ng-click="activated='nsfw'">
				<div class="menus object" id="menus_nsfw" ng-class="{'active': activated=='nsfw'}">NSFW</div>
			</a>
			<a href="#/animals" ng-click="activated='animals'">
				<div class="menus object" id="menus_animals" ng-class="{'active': activated=='animals'}">ANIMALS</div>
			</a>
			<a href="#/gif" ng-click="activated='gif'">
				<div class="menus object" id="menus_gif" ng-class="{'active': activated=='gif'}">GIF</div>
			</a>
			<a href="#/funny" ng-click="activated='funny'">
				<div class="menus object" id="menus_funny" ng-class="{'active': activated=='funny'}">FUNNY</div>
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
			<div class="premium-ressource" ng-class="{'active': activated=='wtf'}">
				<a href="#wtf" ng-click="activated='wtf'">WTF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='nsfw'}">
				<a href="#nsfw" ng-click="activated='nsfw'">NSFW</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='animals'}">
				<a href="#animals" ng-click="activated='animals'">ANIMALS</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='gif'}">
				<a href="#gif" ng-click="activated='gif'">GIF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource" ng-class="{'active': activated=='funny'}">
				<a href="#funny" ng-click="activated='funny'">FUNNY</a>
			</div>
		</div>
	</div>
</div>