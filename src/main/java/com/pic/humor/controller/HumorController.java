package com.pic.humor.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.social.service.SocialService;


@Controller
public class HumorController {
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping("/contents_detail")
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
	public void twCallback(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mView=socialService.twCallbackService(request, response);
		
		
		// 로그인 성공 alert 이동
		/*mView.setViewName("alert");*/
		
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

}
