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
		/*System.out.println("con list pageNum " + pageNum);
		//view 페이지 설정하고 
		System.out.println("contents list controller");*/
		mView.setViewName("list/contents_list");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	// 더보기에 사용할 json list 요청
	@RequestMapping("/list/contents_jsonList")
	public ModelAndView contentsJsonList(HttpServletRequest request,int pageNum){			
		ModelAndView mView=picService.getContJsonList(request, pageNum);
		//view 페이지 설정하고 
		/*System.out.println("contents json list controller");
		System.out.println("pagenum : " + pageNum);*/
		mView.setViewName("jsonView");
		String menu = (String) request.getSession().getAttribute("sessionMenu");
		/*System.out.println("session menu : " + menu);*/
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	@RequestMapping({"/list/contents_detail", "/WEB-INF/views/list/contents_detail" })
	public ModelAndView contentsDetail(HttpServletRequest request, HttpSession session, @RequestParam int cont_id){
		/*System.out.println("detail : " + cont_id);*/
		
		ModelAndView mView = picService.detail(request, cont_id);
		
		//조회수 증가 시키기
		picService.increaseViewCount(request, cont_id);
		/*System.out.println("조회수 증가 뒷부분");*/
		mView.setViewName("list/contents_detail");
		return mView;
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public void picUpload(@RequestBody String paramData, HttpServletRequest request, @ModelAttribute PicBoardDto dto){
		/*ModelAndView mView = new ModelAndView();*/
		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
	    resultMap = JSONArray.fromObject(paramData);
	    
	    for (Map<String, Object> map : resultMap) {
	    	
	    	/*System.out.println("======================================");
	    	System.out.println("Upload ajax 데이터 map 확인");
	    	System.out.println("upload menu : " + map.get("cont_menu"));
	    	System.out.println("upload tag : " + map.get("cont_tag"));
	    	System.out.println("upload image : " + map.get("cont_image"));
	    	System.out.println("upload image fill : " + map.get("cont_image_fill"));
	    	System.out.println("id : " + map.get("user_id"));
	    	System.out.println("name : " + map.get("user_name"));
	    	System.out.println("provider : " + map.get("user_provider"));
	    	System.out.println("======================================");*/
	    	
	    	dto.setCont_tag((String) map.get("cont_tag"));//글번호로 사용한다. 
	    	dto.setCont_image((String) map.get("cont_image"));//글번호로 사용한다. 
	    	dto.setCont_image_fill((String) map.get("cont_image_fill"));//글번호로 사용한다. 
	    	dto.setCont_title((String) map.get("cont_title"));//글번호로 사용한다. 	    	
	    	dto.setUser_id((String) map.get("user_id"));//글번호로 사용한다.
	    	dto.setUser_name((String) map.get("user_name"));//글번호로 사용한다. 
	    	dto.setUser_provider((String) map.get("user_provider"));//글번호로 사용한다.	    	
	    	
	    }
		
		/*mView=picService.insertPics(request, dto);*/
		picService.insertPics(request, dto);

	}
	
	
	@RequestMapping("/list/insertcomment")
	@ResponseBody
	public void commentInsert(@RequestBody String paramData, HttpSession session, HttpServletRequest request, @ModelAttribute PicBoardCmtDto dto){
		
		
		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
	    resultMap = JSONArray.fromObject(paramData);
	    
	    for (Map<String, Object> map : resultMap) {
	    	
	    	/*System.out.println("댓글 ajax 데이터 map 확인");
	    	System.out.println("provider : " + map.get("user_provider"));
	    	System.out.println("id : " + map.get("user_id"));
	    	System.out.println("name : " + map.get("user_name"));
	    	System.out.println("image : " + map.get("user_image"));
	    	System.out.println("cmt : " + map.get("cmt_comments"));
	    	System.out.println("cmt_group : " + map.get("cmt_cont_group"));	  */  
	    	
	    	dto.setUser_id((String) map.get("user_id"));//글번호로 사용한다.
	    	dto.setUser_name((String) map.get("user_name"));//글번호로 사용한다. 
	    	dto.setUser_provider((String) map.get("user_provider"));//글번호로 사용한다. 
	    	dto.setUser_image((String) map.get("user_image"));//글번호로 사용한다.
	    	dto.setCmt_contents((String) map.get("cmt_comments"));//글번호로 사용한다.
	    	dto.setCmt_cont_group(Integer.parseInt((String) map.get("cmt_cont_group")));//글번호로 사용한다.
	    }
	    
	   /* System.out.println("댓글 contents : " + dto.getCmt_contents());
		//서비스 객체를 이용해서 덧글이 저장될수 있도록 한다. 
		System.out.println("댓글  cont_id = " + request.getParameter("cont_id"));
		System.out.println("댓글  mn = " + request.getParameter("mn"));*/
		 
	    picService.commentInsert(request, dto);
	}
	
	
	@RequestMapping("/list/getcmtlist.do")
	@ResponseBody
	public List<PicBoardCmtDto> getCmtlist(HttpServletRequest request, @RequestParam int cont_id){
  		List<PicBoardCmtDto> commentList = picService.getCmtList(request, cont_id);
		
  		return commentList;
	}
	
	// 검색 키워드 session에 저장
	@RequestMapping("/list/ajaxSearch.do")
	@ResponseBody
	public void ajaxSearch(@RequestBody String keyword, HttpServletRequest request){			
		/*@RequestParam String*/
		System.out.println("전달받은 검색값 : " + keyword);		
		request.getSession().setAttribute("sessionKeyword", keyword);
		System.out.println("세션 저장값 : " + request.getSession().getAttribute("sessionKeyword"));
	}
	
}
