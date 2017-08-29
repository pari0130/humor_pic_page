package com.pic.humor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.social.service.SocialService;

@Controller
public class HumorController {
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping("/wtf_list")
	public String wtf_list(){
		
		return "wtf/wtf_list";
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
	public ModelAndView twCallback(HttpServletRequest request){
		ModelAndView mView=socialService.twitterCallback(request);
		
		// 로그인 성공 alert 이동
		mView.setViewName("alert");
		return mView;
	}
	
	
	/*@RequestMapping("/kkcallback.do") // 로그인 요청 후 callback 처리
	public ModelAndView kkCallback(HttpServletRequest request){
		ModelAndView mView=socialService.twitterCallback(request);
		
		// 로그인 성공 alert 이동
		mView.setViewName("alert");
		return "test";
	}*/

}
