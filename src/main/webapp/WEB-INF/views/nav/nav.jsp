<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="wrapper-header">
	<div id="main-header" class="object">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/home.do">
				<div style="font-size: 15px" class="oldies object">HOME</div>
			</a>
			<c:choose>
			  	<c:when test="${empty user_id }">
			  	<a href="#">
					<div id="modal_trigger_login" href="#modal_login"
						style="font-size: 15px" class="oldies object">LOGIN</div>
				</a>	
				<a href="#">
					<div id="modal_trigger_upload" href="#modal_upload"
						style="font-size: 15px" class="oldies object">UPLOAD</div>
				</a> 		  	
			  	</c:when>
			  	<c:otherwise>
		  		<a href="#">
					<div id="modal_trigger_upload" href="#modal_upload"
						style="font-size: 15px" class="oldies object">UPLOAD</div>
				</a> 
				<a href="javascript:logout()">
					<div id=""
						style="font-size: 15px" class="oldies object">LOGOUT</div>
					<input type="hidden" id="getContextPath" value="${pageContext.request.contextPath }"/>
				</a>
				<a href="#">
					<div id="modal_trigger_login" href="#modal_login"
						style="font-size: 15px" class="oldies object">LOGIN</div>
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
				<div class="top-rated object">Top-rated</div>
				<div id="fleche-nav-1"></div>
			</div>
			<div id="wrapper-title-2">
				<a href="#">
					<div class="recent object">Recent</div>
				</a>
				<div id="fleche-nav-2"></div>
			</div>
			<div id="wrapper-title-3">
				<a href="#">
					<div class="oldies object">Oldies</div>
				</a>
				<div id="fleche-nav-3"></div>
			</div>
		</div>
		<div id="wrapper-bouton-icon" >
			<a href="#wtf" ng-click="activated='wtf'">
				<div class="menus object" ng-class="{'active': activated=='wtf'}">WTF</div>
			</a>
			<a href="#nsfw" ng-click="activated='nsfw'">
				<div class="menus object" ng-class="{'active': activated=='nsfw'}">NSFW</div>
			</a>
			<a href="#animals" ng-click="activated='animals'">
				<div class="menus object" ng-class="{'active': activated=='animals'}">ANIMALS</div>
			</a>
			<a href="#gif" ng-click="activated='gif'">
				<div class="menus object" ng-class="{'active': activated=='gif'}">GIF</div>
			</a>
			<a href="#funny" ng-click="activated='funny'">
				<div class="menus object" ng-class="{'active': activated=='funny'}">FUNNY</div>
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
			<div class="premium-ressource">
				<a href="#">WTF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource">
				<a href="#">NSFW</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource">
				<a href="#">ANIMALS</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource">
				<a href="#">GIF</a>
			</div>
		</div>
		<div id="main-premium-ressource">
			<div class="premium-ressource">
				<a href="#">FUNNY</a>
			</div>
		</div>
	</div>
</div>