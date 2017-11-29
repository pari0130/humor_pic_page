package com.pic.humor.picboard.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pic.humor.picboard.dto.PicBoardCmtDto;
import com.pic.humor.picboard.dto.PicBoardDto;

public interface PicDao {
	public void insertPics(HttpServletRequest request, PicBoardDto dto);
	public int getListCount(HttpServletRequest request);
	public List<PicBoardDto> getContList(HttpServletRequest request, PicBoardDto dto);
	public PicBoardDto getData(HttpServletRequest request, int cont_id);
	public void increaseViewCount(HttpServletRequest request, int num);
	public int getSequence(HttpServletRequest request);
	public void commentInsert(HttpServletRequest request, PicBoardCmtDto dto);
	public List<PicBoardCmtDto> getCmtList(HttpServletRequest request, int cont_id);
	public List<PicBoardCmtDto> getCmtList_last(HttpServletRequest request, int cont_id);
	public List<PicBoardDto> getRandomCont(HttpServletRequest request, PicBoardDto dto);
}
