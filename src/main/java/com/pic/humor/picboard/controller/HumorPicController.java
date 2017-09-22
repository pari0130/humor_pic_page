package com.pic.humor.picboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dto.PicBoardDto;
import com.pic.humor.picboard.service.PicService;
import com.pic.humor.social.service.SocialService;

@Controller
public class HumorPicController {
	
	@Autowired
	private PicService picService;
	
	@Autowired
	private SocialService socialService;
	
	
	@RequestMapping("/list/contents_list")
	public ModelAndView contentsList(HttpServletRequest request,@RequestParam(defaultValue="1") int pageNum){			
		ModelAndView mView=picService.getContList(request, pageNum);
		//view 페이지 설정하고 
		System.out.println("contents list controller");
		mView.setViewName("list/contents_list");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	@RequestMapping("/list/contents_detail")
	public ModelAndView contentsDetail(HttpServletRequest request, HttpSession session){
		ModelAndView mView = new ModelAndView();
		String twUrl = (String) session.getAttribute("twitterAuthUrl");
		System.out.println("detail_twAuthUrl :" + twUrl);
		// detail 페이지에서 로그아웃 했을때 invalidata 되므로 세션에 새로 twurl을 넣어주기 위해 null 체크 후 service 수행 
		if(session.getAttribute("twitterAuthUrl") == null){
			mView=socialService.twSigninService(request);
		}
		
		mView.setViewName("list/contents_detail");
		return mView;
	}
	
	@RequestMapping("/upload")
	public ModelAndView picUpload(HttpSession session, HttpServletRequest request, @ModelAttribute PicBoardDto dto){
		ModelAndView mView = new ModelAndView();
		
		String url = request.getParameter("url");
		System.out.println("url 주소 : " + url);
		System.out.println("callback url : " + url);
		
		System.out.println("========upload controller 구간 start======");
		System.out.println("menu : " + request.getParameter("cont_menu"));
		System.out.println("title : " + dto.getCont_title());
		System.out.println("tag : " + dto.getCont_tag());
		System.out.println("image : " + dto.getCont_image());
		System.out.println("user_id : " + dto.getUser_id());
		System.out.println("user_name : " + dto.getUser_name());
		System.out.println("user_provider : " + dto.getUser_provider());
		System.out.println("========upload controller 구간 end======");
		
		// 사진이 여러장일 경우 대표 이미지만 저장하기 위함
		String orgImg = dto.getCont_image();
		int idx = orgImg.indexOf(",");
		System.out.println("idx값 : " + idx);
		// , 문자가 없는 1장의 사진일때는 idx값이 -1이 된다. 0이상일때만 처음 사진을 잘라서 저장한다.
		if(idx > 0){
			// 0번째 문자부터 .이 되는 부분까지 잘라서 url에 저장
			String saveImg = orgImg.substring(0, idx);
			System.out.println("saveImg : " + saveImg);
			dto.setCont_image(saveImg);
		}
				
		mView=picService.insertPics(request, dto);
		
		mView.setViewName("redirect:/home.do");
		return mView;
	}
}
