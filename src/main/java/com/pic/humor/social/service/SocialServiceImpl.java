package com.pic.humor.social.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

@Service
public class SocialServiceImpl implements SocialService {

	@Override // 트위터 로그인 처리
	public ModelAndView twSigninService(HttpServletRequest request) {
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
			/*mView.addObject("authUrl", authUrl);*/
			request.getSession().setAttribute("twitterAuthUrl", authUrl);
			mView.addObject("accessToken", accessToken);
			mView.addObject("tokenSecret", tokenSecret);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mView;
	}

	@Override //트위터 로그인 후 callback 처리
	public ModelAndView twCallbackService(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		String consumerKey = "jzHhSZ4DIrdW9OOPmpJ2lduOG";
		String consumerSecret = "kHWmYuoYA3gDwR5tRmfNZh2xRKpmHOXT12Nehc1n9LUJbZpviA";

		Twitter twitter = new TwitterFactory().getInstance();			
		twitter.setOAuthConsumer(consumerKey, consumerSecret); //저장된 consumerKey, consumerSecret
		
		AccessToken accessToken = null;		
		String oauth_verifier = request.getParameter("oauth_verifier");
		//트위터 로그인 연동시 담은 requestToken 의 세션값을 가져온다.
		RequestToken requestToken = (RequestToken )request.getSession().getAttribute("requestToken");			
		try {
			accessToken = twitter.getOAuthAccessToken(requestToken, oauth_verifier);
			twitter.setOAuthAccessToken(accessToken);
			//해당 트위터 사용자의 이름과 아이디를 가져온다.
			System.out.println("id : "+ accessToken.getUserId());    //트위터의 사용자 아이디
			System.out.println("name : "+ accessToken.getScreenName()); //트워터에 표시되는 사용자명 
			// profile image 
			// https://twitter.com/<screen_name>/profile_image?size=<mini|normal|bigger|original>
			String twImg = "https://twitter.com/" + accessToken.getScreenName() + "/profile_image?size=bigger";
			System.out.println("image : "+ twImg); //트워터에 표시되는 사용자명 
			mView.addObject("msg", "성공");
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			System.out.println("call 실패");
			e.printStackTrace();
		}					
		return mView;
	}

	@Override
	public boolean canUse(String paramData, HttpServletRequest request) {
		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
	    resultMap = JSONArray.fromObject(paramData);
	    
	    for (Map<String, Object> map : resultMap) {
	    	System.out.println("ajax 데이터 map 확인");
	    	System.out.println("provider : " + map.get("provider"));
	    	System.out.println("id : " + map.get("id"));
	    	System.out.println("name : " + map.get("name"));
	    	System.out.println("image : " + map.get("image"));
	    	request.getSession().setAttribute("provider", map.get("provider"));
	    	request.getSession().setAttribute("user_id", map.get("id"));
	    	request.getSession().setAttribute("user_name", map.get("name"));
	    	request.getSession().setAttribute("user_image", map.get("image"));
	    	
	    }
		//사용가능한 아이디 인지 여부를 리턴받아서 
		boolean canUse=true;
		//리턴해준다. 
		return canUse;
	}

}
