<%@page import="twitter4j.User"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="twitter4j.Twitter" %>
<%@ page import="twitter4j.TwitterFactory" %>
<%@ page import="twitter4j.auth.RequestToken" %>
<%
String consumerKey = "jzHhSZ4DIrdW9OOPmpJ2lduOG";
String consumerSecret = "kHWmYuoYA3gDwR5tRmfNZh2xRKpmHOXT12Nehc1n9LUJbZpviA";
Twitter twitter = new TwitterFactory().getInstance();
//twitter로 접근한다.
twitter.setOAuthConsumer(consumerKey, consumerSecret);

//성공시 requestToken에 해당정보를 담겨져온다.
RequestToken requestToken =  twitter.getOAuthRequestToken();

//requestToken 을 반드시 세션에 담아주어야 한다.
request.getSession().setAttribute("requestToken", requestToken);
String authUrl = requestToken.getAuthorizationURL();  //접속할 url값이 넘어온다.
String accessToken = requestToken.getToken(); //token값을 가져온다.
String tokenSecret = requestToken.getTokenSecret(); //token Secret값을 가져온다.

%>
authUrl: <%=authUrl%><br/>
accessToken: <%=accessToken%><br/>
tokenSecret: <%=tokenSecret%><br/>

<a href="<%=authUrl%>">[로그인]</a>