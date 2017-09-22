package com.pic.humor.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.social.service.SocialService;


@Controller
public class HumorMainController {
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping("/test")
	public String test(){
		
		return "test";
	}
	
	@RequestMapping("/twcallback.do") // 로그인 요청 후 callback 처리
	public ModelAndView twCallback(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mView=socialService.twCallbackService(request, response);
		// 돌아갈 url값을 session에서 받는다.
		String orgUrl = (String) session.getAttribute("tw_CallBackUrl");
		// .do로 끝나므로 . 으로 구분하여 저장
		int idx = orgUrl.indexOf(".");
		// 0번째 문자부터 .이 되는 부분까지 잘라서 url에 저장
		String url = orgUrl.substring(0, idx);	
		System.out.println("callback url : " + url);
		mView.setViewName(url);
		return mView;
	}
	
	// 로그인 요청 후 callback 처리 google, facebook, kakao
	@RequestMapping("/socialajax")
	@ResponseBody
	public Map<String, Object> socialAjax(@RequestBody String paramData, HttpServletRequest request){
	    boolean canUse=socialService.canUse(paramData, request);
  		Map<String, Object> map=new HashMap<>();
  		map.put("canUse", canUse);
  		return map;
	}
	
	// ajax 요청 처리 
	@RequestMapping("/saveTwPath")
	@ResponseBody // json 문자열 응답하기 위해 
	public Map<String, Object> saveTwPath(@RequestParam String path, HttpServletRequest request){
		//서비스를 이용해서 아이디 사용가능 여부를 얻어내서 
		boolean canUse=socialService.saveTwPath(path, request);
		// jackson 라이브러리를 통해서 json 문자열이 출력되도록 
		// Map 에 담아서 
		Map<String, Object> map=new HashMap<>();
		map.put("canUse", canUse);
		// 리턴해준다. 
		return map;
	}
		
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, HttpServletRequest request){
		//로그 아웃 처리
		session.invalidate();
		ModelAndView mView=new ModelAndView();
		String url = request.getParameter("url");
		System.out.println("넘어온  url : " + url);
		mView.addObject("msg", "로그 아웃 되었습니다.");
		// 트위터 로그인 후 주소창에 twcallback.do가 찍히므로 logout시 되돌아갈 주소가 잘못될수 있음.
		if(url.equals("/twcallback.do")){
			url = "/home.do";
		}
		mView.addObject("url", url);				
		System.out.println("넘기는 url : " + url);
		mView.setViewName("nav/callback");
		
		return mView;
	}

}
