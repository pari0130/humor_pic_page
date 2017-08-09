<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h3>공지사항 입니다.</h3>
	<ul>
		<c:forEach var="tmp" items="${list }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>

	<button id="upload_widget_opener">upload</button>
	<div>
		<img id="photo_value" src="" alt="" />
	</div>
	<script src="//widget.cloudinary.com/global/all.js" type="text/javascript" ></script>
	<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js" ></script>	
	<script type="text/javascript">
		$("#upload_widget_opener").click(function() {
			cloudinary.openUploadWidget({
				cloud_name : 'pari0130',
				upload_preset : 'z8pxxf5a',
				sources : [ 'local', 'url', 'image_search' ],
				google_api_key : 'AIzaSyD3Q7pUTjE3HygTtkUdFhL8QVXKYHlhbmw',
				search_by_sites : [ "https://www.google.co.kr" ],
				search_by_rights : true
			}, function(error, result) {
				console.log(error, result);
				console.log(result[0].url);
				console.log(result[0].thumbnail_url)
				var url = result[0].thumbnail_url;
				$("#photo_value").attr("src", url);
			});
		})
	</script>
</body>
</html>