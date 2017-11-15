package com.pic.humor.picboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.picboard.dao.PicDao;
import com.pic.humor.picboard.dto.PicBoardCmtDto;
import com.pic.humor.picboard.dto.PicBoardDto;

@Service
public class PicServiceImpl implements PicService{
	
	//한페이지에서 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=1;
	
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
	public ModelAndView getContList(HttpServletRequest request, int pageNum) {
		System.out.println("contents list service 진입");
		// detail page 진입시 cont_id + menu 값
		String menu = request.getParameter("mn");
		System.out.println("list menu : " + menu);
		//보여줄 페이지의 번호
		int Num=pageNum;
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(Num-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row의 갯수 구하기
		int totalRow=picDao.getListCount(request);
		System.out.println("page total : " + totalRow);
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
		mView.addObject("startRowNum", startRowNum);
		mView.addObject("endRowNum", endRowNum);
		mView.addObject("totalRow", totalRow);
		// detail page 진입시 cont_id + menu 값
		mView.addObject("menu", menu);
		System.out.println("mView에 담음");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
		
	}
	
	@Override
	public ModelAndView getContJsonList(HttpServletRequest request, int pageNum) {
		System.out.println("contents json list service 진입");
		// detail page 진입시 cont_id + menu 값
		String menu = request.getParameter("mn");
		System.out.println("list menu : " + menu);
		//보여줄 페이지의 번호
		int Num=pageNum;
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(Num-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row의 갯수 구하기
		int totalRow=picDao.getListCount(request);
		System.out.println("total row : " + totalRow);
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
		System.out.println("start row : " + startRowNum);
		System.out.println("end row : " + endRowNum);
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
		mView.addObject("startRowNum", startRowNum);
		mView.addObject("endRowNum", endRowNum);
		mView.addObject("totalRow", totalRow);
		// detail page 진입시 cont_id + menu 값
		/*mView.addObject("menu", menu);*/
		System.out.println("mView에 담음");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
		
	}

	@Override
	public ModelAndView detail(HttpServletRequest request, int cont_id) {
		PicBoardDto dto=picDao.getData(request, cont_id);
		//덛글 목록을 얻어온다.
		List<PicBoardCmtDto> commentList=picDao.getCmtList(request, cont_id);
		//ModelAndView 객체를 생성해서 Model 을 담고
		System.out.println("cmtList : " + commentList);
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto", dto);
		mView.addObject("commentList", commentList);
		//리턴해준다.
		return mView;
	}

	@Override
	public void increaseViewCount(HttpServletRequest request,int cont_id) {
		System.out.println("service dao 요청 앞부분");
		picDao.increaseViewCount(request, cont_id);
		System.out.println("service dao 요청 뒷부분");
		
	}
	
	//새덧글을 입력하는 비즈니스 로직을 처리할 서비스 메소드 
	@Override
	public void commentInsert(HttpServletRequest request, PicBoardCmtDto dto) {
		//1. 저장할 덧글 번호를 미리 읽어온다.
		int seq=picDao.getSequence(request);
		
		dto.setCmt_id(seq);//글번호로 사용한다. 
		//2. 원글의 덧글인지 덧글의 덧글인지 판정해서 다른 처리를 해준다.
		int cmt_in_group=dto.getCmt_in_group();
		if(cmt_in_group == 0){// 0 이면 원글의 덧글 
			//원글의 덧글이면 그룹번호를 저장할 덧글 번호로 지정한다. 
			dto.setCmt_in_group(seq);
		}	
		//3. Dao 를 이용해서 DB 에 저장		
		picDao.commentInsert(request, dto);
	}
	
	@Override
	public List<PicBoardCmtDto> getCmtList(HttpServletRequest request, int cont_id) {
		List<PicBoardCmtDto> commentList=picDao.getCmtList_last(request, cont_id);
		
		return commentList;
	}
	
}





