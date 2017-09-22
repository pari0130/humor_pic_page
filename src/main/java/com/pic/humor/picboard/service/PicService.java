package com.pic.humor.picboard.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dto.PicBoardDto;

public interface PicService {
	public ModelAndView insertPics(HttpServletRequest request, PicBoardDto dto);

	public ModelAndView getList(HttpServletRequest request, int pageNum);
}
