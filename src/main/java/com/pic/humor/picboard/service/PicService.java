package com.pic.humor.picboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dto.PicBoardCmtDto;
import com.pic.humor.picboard.dto.PicBoardDto;

public interface PicService {
	public ModelAndView insertPics(HttpServletRequest request, PicBoardDto dto);
	public ModelAndView getContList(HttpServletRequest request, int pageNum);
	public ModelAndView getContJsonList(HttpServletRequest request, int pageNum);
	public ModelAndView detail(HttpServletRequest request, int cont_id);
	public void increaseViewCount(HttpServletRequest request, int cont_id);
	public void commentInsert(HttpServletRequest request, PicBoardCmtDto dto);
	public List<PicBoardCmtDto> getCmtList(HttpServletRequest request, int cont_id);
	
}
