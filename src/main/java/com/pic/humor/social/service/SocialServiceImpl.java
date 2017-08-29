package com.pic.humor.social.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;

@Service
public class SocialServiceImpl implements SocialService {

	@Override
	public ModelAndView twitterSignin(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		String consumerKey = "jzHhSZ4DIrdW9OOPmpJ2lduOG";
		String consumerSecret = "kHWmYuoYA3gDwR5tRmfNZh2xRKpmHOXT12Nehc1n9LUJbZpviA";
		Twitter twitter = new TwitterFactory().getInstance();
		//twitter로 접근한다.
		twitter.setOAuthConsumer(consumerKey, consumerSecret);
		
		//성공시 requestToken에 해당정보를 담겨져온다.
		RequestToken requestToken;
		try {
			requestToken = twitter.getOAuthRequestToken();
			//requestToken 을 반드시 세션에 담아주어야 한다.
			request.getSession().setAttribute("requestToken", requestToken);
			String authUrl = requestToken.getAuthorizationURL();  //접속할 url값이 넘어온다.
			String accessToken = requestToken.getToken(); //token값을 가져온다.
			String tokenSecret = requestToken.getTokenSecret(); //token Secret값을 가져온다.
			mView.addObject("authUrl", authUrl);
			mView.addObject("accessToken", accessToken);
			mView.addObject("tokenSecret", tokenSecret);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mView;
	}

}
