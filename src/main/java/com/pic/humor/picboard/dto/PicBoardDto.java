package com.pic.humor.picboard.dto;

public class PicBoardDto {
	private int cont_id;
	private String user_id;
	private String user_name;
	private String user_provider;
	private String cont_title;
	private String cont_tag;
	private String cont_image;
	private String cont_image_fill;
	private int cont_view_count;
	private String cont_date;
	private String menu_name;
	
	private int startRowNum; //시작 row 번호
	private int endRowNum; //끝 row 번호
	
	public PicBoardDto(){}

	public PicBoardDto(int cont_id, String user_id, String user_name, String user_provider, String cont_title,
			String cont_tag, String cont_image, String cont_image_fill, int cont_view_count, String cont_date,
			String menu_name, int startRowNum, int endRowNum) {
		super();
		this.cont_id = cont_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_provider = user_provider;
		this.cont_title = cont_title;
		this.cont_tag = cont_tag;
		this.cont_image = cont_image;
		this.cont_image_fill = cont_image_fill;
		this.cont_view_count = cont_view_count;
		this.cont_date = cont_date;
		this.menu_name = menu_name;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getCont_id() {
		return cont_id;
	}

	public void setCont_id(int cont_id) {
		this.cont_id = cont_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_provider() {
		return user_provider;
	}

	public void setUser_provider(String user_provider) {
		this.user_provider = user_provider;
	}

	public String getCont_title() {
		return cont_title;
	}

	public void setCont_title(String cont_title) {
		this.cont_title = cont_title;
	}

	public String getCont_tag() {
		return cont_tag;
	}

	public void setCont_tag(String cont_tag) {
		this.cont_tag = cont_tag;
	}

	public String getCont_image() {
		return cont_image;
	}

	public void setCont_image(String cont_image) {
		this.cont_image = cont_image;
	}

	public String getCont_image_fill() {
		return cont_image_fill;
	}

	public void setCont_image_fill(String cont_image_fill) {
		this.cont_image_fill = cont_image_fill;
	}

	public int getCont_view_count() {
		return cont_view_count;
	}

	public void setCont_view_count(int cont_view_count) {
		this.cont_view_count = cont_view_count;
	}

	public String getCont_date() {
		return cont_date;
	}

	public void setCont_date(String cont_date) {
		this.cont_date = cont_date;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	

	
	
	
	/*private int startRowNum; //시작 row 번호
	private int endRowNum; //끝 row 번호
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	
	*/
	
	
}
