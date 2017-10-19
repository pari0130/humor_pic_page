package com.pic.humor.social.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView twCallbackService(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
			// profile image 
			// https://twitter.com/<screen_name>/profile_image?size=<mini|normal|bigger|original>
			String twImg = "https://twitter.com/" + accessToken.getScreenName() + "/profile_image?size=bigger";
			
			// twitter session 저장
			System.out.println("twitter 데이터 확인");
	    	System.out.println("provider : " + "twitter");
	    	System.out.println("id : " + accessToken.getUserId()); //트위터의 사용자 아이디
	    	System.out.println("name : " + accessToken.getScreenName()); //트워터에 표시되는 사용자명
	    	System.out.println("image : " + twImg); //트워터에 표시되는 프로필이미지 
	    	request.getSession().setAttribute("provider", "twitter");
	    	request.getSession().setAttribute("user_id", accessToken.getUserId());
	    	request.getSession().setAttribute("user_name", accessToken.getScreenName());
	    	request.getSession().setAttribute("user_image", twImg);
	    	/*twitter 로그인 후 home 으로 돌아갔을때 환영팝업이 뜨도록 msg 설정*/
	    	String alertMsg = "swal('Login success!!', " +  "'" + accessToken.getScreenName()+ " 님 환영합니다.', 'success');";
	    	System.out.println("alert Msg : " + alertMsg);
	    	// callback page 이동 후 요청 url로 이동할때 msg를 띄우기 위함
	    	request.getSession().setAttribute("twAlertMsg", alertMsg);
	    	/*mView.addObject("alertMsg", alertMsg);*/
			
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			System.out.println("call 실패");
			e.printStackTrace();
		}					
		return mView;
	}
	
	// google facebook kakao에 대한 ajax 요청 처리 후 session에 담기
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
		boolean canUse=true;
		//리턴해준다. 
		return canUse;
	}
	
	// twitter callback 요청에서 돌아갈 url을 session에 담아줘야 요청한 위치로 돌아감
	@Override
	public boolean saveTwPath(String path, HttpServletRequest request) {
		request.getSession().setAttribute("tw_CallBackUrl", path);
		boolean canUse = true;
		
		//리턴해준다. 
		return canUse;
	}

}
