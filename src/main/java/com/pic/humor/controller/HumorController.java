package com.pic.humor.controller;

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
public class HumorController {
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping("/list/contents_detail")
	public String wtf_list(){
		
		return "list/contents_detail";
	}
	
	@RequestMapping("/test")
	public String test(){
		
		return "test";
	}
	
	@RequestMapping("/test2")
	public String test2(){
		
		return "test2";
	}
	
	@RequestMapping("/twcallback.do") // 로그인 요청 후 callback 처리
	public ModelAndView twCallback(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mView=socialService.twCallbackService(request, response);
		
		
		// 로그인 성공 alert 이동
		mView.setViewName("alert");
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
		mView.addObject("msg", "로그 아웃 되었습니다.");
		mView.addObject("url", url);				
		System.out.println("url : " + url);
		mView.setViewName("alert");
		
		return mView;
	}

}
