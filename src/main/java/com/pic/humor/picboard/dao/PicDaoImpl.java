package com.pic.humor.picboard.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pic.humor.picboard.dto.PicBoardCmtDto;
import com.pic.humor.picboard.dto.PicBoardDto;

@Repository
public class PicDaoImpl implements PicDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertPics(HttpServletRequest request, PicBoardDto dto) {
		// TODO Auto-generated method stub
		System.out.println("insert pics dao 진입완료  DB 전");
		String cont_menu = request.getParameter("cont_menu");
		System.out.println("cont_menu : " + cont_menu);
		// TODO Auto-generated method stub
		if(cont_menu.equals("WTF")){
			session.insert("picUpdate.insert_wtf", dto);
			System.out.println("insert_wtf DB 완료");
		}else if(cont_menu.equals("NSFW")){
			session.insert("picUpdate.insert_nsfw", dto);
			System.out.println("insert_nsfw DB 완료");
		}else if(cont_menu.equals("ANIMALS")){
			session.insert("picUpdate.insert_animals", dto);
			System.out.println("insert_animals DB 완료");
		}else if(cont_menu.equals("GIF")){
			session.insert("picUpdate.insert_gif", dto);
			System.out.println("insert_gif DB 완료");
		}else if(cont_menu.equals("FUNNY")){
			session.insert("picUpdate.insert_funny", dto);
			System.out.println("insert_funny DB 완료");
		}
		
	}

	@Override
	public int getListCount(HttpServletRequest request) {
		// TODO Auto-generated method stub
		/*int count = 0;*/
		
		System.out.println("get list count dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("get list count 요청 menu : " + menu);
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("getCount DB 완료");
			System.out.println("getCount : " + session.selectOne("picSelect.getListCount_wtf"));
			return session.selectOne("picSelect.getListCount_wtf");
			
		}else if(menu.equals("nsfw")){
			System.out.println("getCount DB 완료");
			return session.selectOne("picSelect.getListCount_nsfw");
			
		}else if(menu.equals("animals")){
			System.out.println("getCount DB 완료");
			return session.selectOne("picSelect.getListCount_animals");
			
		}else if(menu.equals("gif")){
			System.out.println("getCount DB 완료");
			return session.selectOne("picSelect.getListCount_gif");
			
		}else if(menu.equals("funny")){
			System.out.println("getCount DB 완료");
			return session.selectOne("picSelect.getListCount_funny");
			
		}
		return 0;
	}

	@Override
	public List<PicBoardDto> getContList(HttpServletRequest request, PicBoardDto dto) {
		
		System.out.println("get cont list dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("get list 요청 menu : " + menu);
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("getContents DB 완료");
			return session.selectList("picSelect.getContList_wtf", dto);
			
		}else if(menu.equals("nsfw")){
			System.out.println("getContents DB 완료");
			return session.selectList("picSelect.getContList_nsfw", dto);
			
		}else if(menu.equals("animals")){
			System.out.println("getContents DB 완료");
			return session.selectList("picSelect.getContList_animals", dto);
			
		}else if(menu.equals("gif")){
			System.out.println("getContents DB 완료");
			return session.selectList("picSelect.getContList_gif", dto);
			
		}else if(menu.equals("funny")){
			System.out.println("getContents DB 완료");
			return session.selectList("picSelect.getContList_funny", dto);

		}
		return null;
	}

	@Override
	public PicBoardDto getData(HttpServletRequest request, int cont_id) {
		
		System.out.println("getData dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("getData 요청 menu : " + menu);
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("getData DB 완료");
			return session.selectOne("picSelect.getData_wtf", cont_id);
			
		}else if(menu.equals("nsfw")){
			System.out.println("getData DB 완료");
			return session.selectOne("picSelect.getData_nsfw", cont_id);
			
		}else if(menu.equals("animals")){
			System.out.println("getData DB 완료");
			return session.selectOne("picSelect.getData_animals", cont_id);
			
		}else if(menu.equals("gif")){
			System.out.println("getData DB 완료");
			return session.selectOne("picSelect.getData_gif", cont_id);
			
		}else if(menu.equals("funny")){
			System.out.println("getData DB 완료");
			return session.selectOne("picSelect.getData_funny", cont_id);

		}
		
		return null;
	}

	@Override
	public void increaseViewCount(HttpServletRequest request, int cont_id) {
		
		System.out.println("ViewCount dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("viewCount 요청 menu : " + menu);
		System.out.println("view cont_id : " + cont_id);
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("ViewCount DB 완료");
			session.update("picUpdate.increaseViewCount_wtf", cont_id);
			
		}else if(menu.equals("nsfw")){
			System.out.println("ViewCount DB 완료");
			session.update("picUpdate.increaseViewCount_nsfw", cont_id);
			
		}else if(menu.equals("animals")){
			System.out.println("ViewCount DB 완료");
			session.update("picUpdate.increaseViewCount_animals", cont_id);
			
		}else if(menu.equals("gif")){
			System.out.println("ViewCount DB 완료");
			session.update("picUpdate.increaseViewCount_gif", cont_id);
			
		}else if(menu.equals("funny")){
			System.out.println("ViewCount DB 완료");
			session.update("picUpdate.increaseViewCount_funny", cont_id);

		}
		
	}
	
	/*덧글 ===================================================================================*/
	@Override
	public int getSequence(HttpServletRequest request) {
		
		System.out.println("getSeq dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("getSeq 요청 menu : " + menu);		
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("getSeq DB 완료");
			int seq=session.selectOne("picUpdate.getSequence_wtf");
			return seq;
			
		}else if(menu.equals("nsfw")){
			System.out.println("ViewCount DB 완료");
			int seq=session.selectOne("picUpdate.getSequence_nsfw");
			return seq;
			
		}else if(menu.equals("animals")){
			System.out.println("ViewCount DB 완료");
			int seq=session.selectOne("picUpdate.getSequence_animals");
			return seq;
			
		}else if(menu.equals("gif")){
			System.out.println("ViewCount DB 완료");
			int seq=session.selectOne("picUpdate.getSequence_gif");
			return seq;
			
		}else if(menu.equals("funny")){
			System.out.println("ViewCount DB 완료");
			int seq=session.selectOne("picUpdate.getSequence_funny");
			return seq;

		}
		return 0;
	}

	@Override
	public void commentInsert(HttpServletRequest request, PicBoardCmtDto dto) {
		System.out.println("commentInsert dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("commentInsert 요청 menu : " + menu);		
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("commentInsert DB 완료");
			session.update("picUpdate.commentInsert_wtf", dto);
			
		}else if(menu.equals("nsfw")){
			System.out.println("commentInsert DB 완료");
			session.update("picUpdate.commentInsert_nsfw", dto);
			
		}else if(menu.equals("animals")){
			System.out.println("commentInsert DB 완료");
			session.update("picUpdate.commentInsert_animals", dto);
			
		}else if(menu.equals("gif")){
			System.out.println("commentInsert DB 완료");
			session.update("picUpdate.commentInsert_gif", dto);
			
		}else if(menu.equals("funny")){
			System.out.println("commentInsert DB 완료");
			session.update("picUpdate.commentInsert_funny", dto);

		}
		
	}

	@Override
	public List<PicBoardCmtDto> getCmtList(HttpServletRequest request, int cont_id) {
		System.out.println("commentGetList dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("commentGetList 요청 menu : " + menu);		
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_wtf", cont_id);
			
		}else if(menu.equals("nsfw")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_nsfw", cont_id);
			
		}else if(menu.equals("animals")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_animals", cont_id);
			
		}else if(menu.equals("gif")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_gif", cont_id);
			
		}else if(menu.equals("funny")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_funny", cont_id);

		}
		return null;
	}
	
	@Override
	public List<PicBoardCmtDto> getCmtList_last(HttpServletRequest request, int cont_id) {
		System.out.println("commentGetList dao 진입완료  DB 전");
		String menu = request.getParameter("mn");
		System.out.println("commentGetList 요청 menu : " + menu);		
		// TODO Auto-generated method stub
		if(menu.equals("wtf")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_last_wtf", cont_id);
			
		}else if(menu.equals("nsfw")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_last_nsfw", cont_id);
			
		}else if(menu.equals("animals")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_last_animals", cont_id);
			
		}else if(menu.equals("gif")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_last_gif", cont_id);
			
		}else if(menu.equals("funny")){
			System.out.println("commentGetList DB 완료");
			return session.selectList("picSelect.getCmtList_last_funny", cont_id);

		}
		return null;
	}

}
