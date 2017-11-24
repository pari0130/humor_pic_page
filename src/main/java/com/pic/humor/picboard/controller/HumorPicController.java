package com.pic.humor.picboard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dto.PicBoardCmtDto;
import com.pic.humor.picboard.dto.PicBoardDto;
import com.pic.humor.picboard.service.PicService;
import com.pic.humor.social.service.SocialService;

import net.sf.json.JSONArray;

@Controller
public class HumorPicController {
	
	@Autowired
	private PicService picService;
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping("/list/contents_list")
	public ModelAndView contentsList(HttpServletRequest request,@RequestParam(defaultValue="1") int pageNum){			
		ModelAndView mView=picService.getContList(request, pageNum);
		System.out.println("con list pageNum " + pageNum);
		//view 페이지 설정하고 
		System.out.println("contents list controller");
		mView.setViewName("list/contents_list");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	// 더보기에 사용할 json list 요청
	@RequestMapping("/list/contents_jsonList")
	public ModelAndView contentsJsonList(HttpServletRequest request,int pageNum){			
		ModelAndView mView=picService.getContJsonList(request, pageNum);
		//view 페이지 설정하고 
		System.out.println("contents json list controller");
		System.out.println("pagenum : " + pageNum);
		mView.setViewName("jsonView");
		String menu = (String) request.getSession().getAttribute("sessionMenu");
		System.out.println("session menu : " + menu);
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	@RequestMapping("/list/contents_detail")
	public ModelAndView contentsDetail(HttpServletRequest request, HttpSession session, @RequestParam int cont_id){
		System.out.println("detail : " + cont_id);
		
		ModelAndView mView = picService.detail(request, cont_id);
		
		//조회수 증가 시키기
		picService.increaseViewCount(request, cont_id);
		System.out.println("조회수 증가 뒷부분");
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
		System.out.println("image_fill : " + dto.getCont_image_fill());
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
	
	/*
	//덧글 입력 요청 처리
	@RequestMapping("/list/insertcomment")
	public String commentInsert(HttpSession session, HttpServletRequest request, @ModelAttribute PicBoardCmtDto dto){
		// @ModelAttribute 어노테이션을 이용해서 덧글 정보를 얻어온다.
		
		System.out.println("contents : " + dto.getCmt_contents());
		//서비스 객체를 이용해서 덧글이 저장될수 있도록 한다. 
		picService.commentInsert(request, dto);
		
		System.out.println("댓글 cont_id = " + request.getParameter("cont_id"));
		System.out.println("댓글 mn = " + request.getParameter("mn"));
		
		//원글의 글번호를 읽어와서		
		String cont_id = request.getParameter("cont_id");
		String mn = request.getParameter("mn");
				
		
		//리다일렉트 응답할때 사용한다. 
		return "redirect:/list/contents_detail.do?cont_id="+cont_id+"&mn="+mn;
	}*/
	
	@RequestMapping("/list/insertcomment")
	@ResponseBody
	public void commentInsert(@RequestBody String paramData, HttpSession session, HttpServletRequest request, @ModelAttribute PicBoardCmtDto dto){
		
		
		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
	    resultMap = JSONArray.fromObject(paramData);
	    
	    for (Map<String, Object> map : resultMap) {
	    	
	    	System.out.println("댓글 ajax 데이터 map 확인");
	    	System.out.println("provider : " + map.get("user_provider"));
	    	System.out.println("id : " + map.get("user_id"));
	    	System.out.println("name : " + map.get("user_name"));
	    	System.out.println("image : " + map.get("user_image"));
	    	System.out.println("cmt : " + map.get("cmt_comments"));
	    	System.out.println("cmt_group : " + map.get("cmt_cont_group"));	    
	    	
	    	dto.setUser_id((String) map.get("user_id"));//글번호로 사용한다.
	    	dto.setUser_name((String) map.get("user_name"));//글번호로 사용한다. 
	    	dto.setUser_provider((String) map.get("user_provider"));//글번호로 사용한다. 
	    	dto.setUser_image((String) map.get("user_image"));//글번호로 사용한다.
	    	dto.setCmt_contents((String) map.get("cmt_comments"));//글번호로 사용한다.
	    	dto.setCmt_cont_group(Integer.parseInt((String) map.get("cmt_cont_group")));//글번호로 사용한다.
	    }
	    
	    System.out.println("댓글 contents : " + dto.getCmt_contents());
		//서비스 객체를 이용해서 덧글이 저장될수 있도록 한다. 
		System.out.println("댓글  cont_id = " + request.getParameter("cont_id"));
		System.out.println("댓글  mn = " + request.getParameter("mn"));
		 
	    picService.commentInsert(request, dto);
	}
	
	
	@RequestMapping("/list/getcmtlist.do")
	@ResponseBody
	public List<PicBoardCmtDto> getCmtlist(HttpServletRequest request, @RequestParam int cont_id){
  		List<PicBoardCmtDto> commentList = picService.getCmtList(request, cont_id);
		
  		return commentList;
	}
}
