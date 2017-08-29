<%@ page contentType="text/html;charset=utf-8" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="twitter4j.Twitter" %>
<%@ page import="twitter4j.TwitterFactory" %>
<%@ page import="twitter4j.auth.RequestToken" %>
<%@ page import="twitter4j.auth.AccessToken" %>
<%
String consumerKey = "jzHhSZ4DIrdW9OOPmpJ2lduOG";
String consumerSecret = "kHWmYuoYA3gDwR5tRmfNZh2xRKpmHOXT12Nehc1n9LUJbZpviA";

Twitter twitter = new TwitterFactory().getInstance();			
twitter.setOAuthConsumer(consumerKey, consumerSecret); //저장된 consumerKey, consumerSecret
AccessToken accessToken = null;		

String oauth_verifier = request.getParameter("oauth_verifier");

//트위터 로그인 연동시 담은 requestToken 의 세션값을 가져온다.
RequestToken requestToken = (RequestToken )request.getSession().getAttribute("requestToken");			
accessToken = twitter.getOAuthAccessToken(requestToken, oauth_verifier);			
twitter.setOAuthAccessToken(accessToken);

//해당 트위터 사용자의 이름과 아이디를 가져온다.
System.out.println(accessToken.getUserId());    //트위터의 사용자 아이디
System.out.println(accessToken.getScreenName()); //트워터에 표시되는 사용자명 		
String userId = accessToken.getUserId();
userId = accessToken.getUserId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("getUserId :"+ <%=accessToken.getUserId()%>);
	alert("getScreenName :"+ <%=accessToken.getScreenName()%>);
	location.href = "${pageContext.request.contextPath }/home.do";
</script>
</body>
</html>
