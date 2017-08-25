package com.pic.humor.social;

import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/facebookSignin.do")
	public String getfacebookSigninCode(HttpSession session) {
		logger.debug("facebookSignin");

		String facebookUrl = "https://www.facebook.com/v2.8/dialog/oauth?"+
						"client_id="+"308579496284145"+
						"&redirect_uri=http://localhost:8888/facebookAccessToken.do"+
						"&scope=public_profile,email";

		return "redirect:"+facebookUrl;
	}
	
	@RequestMapping(value = "/facebookAccessToken.do")
	public String getFacebookSignIn(String code, HttpSession session, String state) throws Exception {
		logger.debug("facebookAccessToken / code : "+code);
		
		String accessToken = requesFaceBooktAccesToken(session, code);
		facebookUserDataLoadAndSave(accessToken, session);
		
		return "redirect:home.do";
	}
	
	private String requesFaceBooktAccesToken(HttpSession session, String code) throws Exception {
		String facebookUrl = "https://graph.facebook.com/v2.8/oauth/access_token?"+
							"client_id="+"308579496284145"+
							"&redirect_uri=http://localhost:8888/home.do"+
						 	"&client_secret="+"fa3d69a63220b926556154991aed9c6a"+
						 	"&code="+code;
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet getRequest = new HttpGet(facebookUrl);
		String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
		logger.debug("facebookAccessToken / raw json : "+rawJsonString);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
		String faceBookAccessToken = (String) jsonObject.get("access_token");
		logger.debug("facebookAccessToken / accessToken : "+faceBookAccessToken);
		
		session.setAttribute("faceBookAccessToken", faceBookAccessToken);
		
		return faceBookAccessToken;
	}
	
	private void facebookUserDataLoadAndSave(String accessToken, HttpSession session) throws Exception {
	    String facebookUrl = "https://graph.facebook.com/me?"+
	            "access_token="+accessToken+
	            "&fields=id,name,email,picture";

	    HttpClient client = HttpClientBuilder.create().build();
	    HttpGet getRequest = new HttpGet(facebookUrl);
	    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
	    logger.debug("facebookAccessToken / rawJson!  : "+rawJsonString);

	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
	    logger.debug("facebookUserDataLoadAndSave / raw json : "+jsonObject);


	}
}
