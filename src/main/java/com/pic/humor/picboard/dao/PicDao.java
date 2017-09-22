package com.pic.humor.picboard.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pic.humor.picboard.dto.PicBoardDto;

public interface PicDao {
	public void insertPics(HttpServletRequest request, PicBoardDto dto);
	public int getListCount(HttpServletRequest request);
	public List<PicBoardDto> getContList(HttpServletRequest request, PicBoardDto dto);
}
