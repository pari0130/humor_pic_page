package com.pic.humor.picboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dao.PicDao;
import com.pic.humor.picboard.dto.PicBoardDto;

@Service
public class PicServiceImpl implements PicService{
	
	//한페이지에서 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=30;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private PicDao picDao;
	
	@Override
	public ModelAndView insertPics(HttpServletRequest request, PicBoardDto dto) {
		System.out.println("service 진입  dao 전");
		picDao.insertPics(request, dto);
		
		ModelAndView mView = new ModelAndView();
		/*twitter 로그인 후 home 으로 돌아갔을때 환영팝업이 뜨도록 msg 설정*/
    	/*String alertMsg = "swal('upload success!!', " +  "'정상적으로 업로드 되었습니다.', 'success');";
    	System.out.println("insert alert Msg : " + alertMsg);	    	
    	mView.addObject("alertMsg", alertMsg);*/
    	
		return mView;
		
	}

	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		//보여줄 페이지의 번호
		int Num=pageNum;
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(Num-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row의 갯수 구하기
		int totalRow=picDao.getListCount(request);
		System.out.println(totalRow);
		//전체페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
				1+((Num-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝페이지 보정
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}
		PicBoardDto dto=new PicBoardDto();
		
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//Dao 를 이용해서 글목록을 얻어온다.
		List<PicBoardDto> list=picDao.getContList(request, dto);
		//ModelAndView 객체를 생성해서 
		ModelAndView mView=new ModelAndView();
		//request 영역에 담는 대신 ModelAndView 객체에 담고 
		mView.addObject("list", list);
		mView.addObject("pageNum", Num);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalRow", totalRow);
		
		//ModelAndView 객체를 리턴해준다. 
		return mView;
		
	}}
