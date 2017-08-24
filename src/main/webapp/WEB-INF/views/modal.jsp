<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- MODAL -->
<!-- MODAL_LOGIN -->
<div id="modal_login" class="popupContainer_login"
	style="display: none;">
	<header class="popupHeader">
		<span class="header_title">Login</span>
		<span class="modal_close">
			<i class="fa fa-times"></i>
		</span>
	</header>
	<section class="popupBody">
		<!-- Social Login -->
		<div class="modal_popup">
			<div class="">
				<a href="#" class="social_box fb">
					<span class="icon">
						<i class="fa fa-facebook"></i>
					</span>
					<span class="icon_title">Connect with Facebook</span>
				</a>
				<div style="cursor:pointer" class="social_box gg" id="customBtn">
					<span class="icon">
						<i class="fa fa-google-plus"></i>
					</span>
					<span class="icon_title">Connect with Google</span>
					<script>startApp();</script>
				</div>
				<a href="${google_url}" class="social_box gg">
					<span class="icon">
						<i class="fa fa-google-plus"></i>
					</span>
					<span class="icon_title">Connect with Google</span>
				</a>
				<a href="#" class="social_box kk">
					<span class="icon">
						<i class="fa"></i>
					</span>
					<span class="icon_title">Connect with Kakao</span>
				</a>
				<a href="${naver_url}" class="social_box nv">
					<span class="icon">
						<i class="fa"></i>
					</span>
					<span class="icon_title">Connect with Naver</span>
				</a>
				<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
			</div>
			<div class="centeredText">
				<span>WE CAN ONLY DO SOCIAL LOGIN</span>
			</div>
		</div>
	</section>
</div>
<!-- MODAL_UPLOAD -->
<div id="modal_upload" class="popupContainer_upload"
	style="display: none;">
	<header class="popupHeader">
		<span class="header_title">Upload</span>
		<span class="modal_close">
			<i class="fa fa-times"></i>
		</span>
	</header>
	<section class="popupBody">
		<!-- Username & Password Login form -->
		<div class="modal_popup">
			<div class="user_upload">
				<form id="upload_form">
					<label>Title</label>
					<input type="text" name="title" id="title" />
					<br />
					<label id="upload_tag">Tag</label>
					<!-- <input id="input-tag" type="text" data-role="tagsinput"/> -->
					<input name="tags" placeholder="write some tags">
					<br />
					<!-- MODAL_UPLOAD > MENUS -->
					<label>Select the upload menu</label>
					<select id="demo-htmlselect" style="width: 100%">
						<!-- http://i.imgur.com/XkuTj3B.png -->
						<option value="0" selected="selected"
							data-imagesrc="${pageContext.request.contextPath }/resources/img/icons/001-funny-skull.png"
							data-description="Description with LinkedIn">WTF</option>
						<option value="1"
							data-imagesrc="${pageContext.request.contextPath }/resources/img/icons/012-clown-1.png"
							data-description="Description with Facebook">NSFW</option>
						<option value="2"
							data-imagesrc="${pageContext.request.contextPath }/resources/img/icons/003-clown-8.png"
							data-description="Description with Twitter">ANIMALS</option>
						<option value="3"
							data-imagesrc="${pageContext.request.contextPath }/resources/img/icons/002-goofy-face.png"
							data-description="Description with Foursquare">GIF</option>
						<option value="4"
							data-imagesrc="${pageContext.request.contextPath }/resources/img/icons/009-clown-3.png"
							data-description="Description with Foursquare">FUNNY</option>
					</select>
					<!--  <div style="text-align: center">
                       <p>Up to 10 images can be added.</p>
                   </div> -->
					<div id="photo_div" style="text-align: center">
						<p>Up to 10 images can be added.</p>
					</div>
					<input type="hidden" name="upload_tag" id="upload_tag" value="">
					<input type="hidden" name="upload_menu" id="upload_menu" value="">
					<input type="hidden" name="upload_image" id="upload_image" value="">
					<div class="action_btns">
						<div class="one_half">
							<a href="#" id="upload_widget_opener" class="btn back_btn">
								<i class="fa fa-angle-double-left"></i>Choose image
							</a>
						</div>
						<div class="one_half last">
							<a href="#" id="submit" class="btn btn_red">
								Upload<i class="fa fa-angle-double-up"></i>
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>