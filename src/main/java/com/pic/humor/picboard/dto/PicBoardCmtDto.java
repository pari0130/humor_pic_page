package com.pic.humor.picboard.dto;

public class PicBoardCmtDto {
	private int cmt_id;
	private String user_id;
	private String user_name;
	private String user_provider;
	private String user_image;
	private String cmt_contents;
	private int cmt_cont_group;
	private int cmt_in_group;
	private String cont_date;
	
	PicBoardCmtDto(){}

	public PicBoardCmtDto(int cmt_id, String user_id, String user_name, String user_provider, String user_image,
			String cmt_contents, int cmt_cont_group, int cmt_in_group, String cont_date) {
		super();
		this.cmt_id = cmt_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_provider = user_provider;
		this.user_image = user_image;
		this.cmt_contents = cmt_contents;
		this.cmt_cont_group = cmt_cont_group;
		this.cmt_in_group = cmt_in_group;
		this.cont_date = cont_date;
	}

	public int getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
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

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getCmt_contents() {
		return cmt_contents;
	}

	public void setCmt_contents(String cmt_contents) {
		this.cmt_contents = cmt_contents;
	}

	public int getCmt_cont_group() {
		return cmt_cont_group;
	}

	public void setCmt_cont_group(int cmt_cont_group) {
		this.cmt_cont_group = cmt_cont_group;
	}

	public int getCmt_in_group() {
		return cmt_in_group;
	}

	public void setCmt_in_group(int cmt_in_group) {
		this.cmt_in_group = cmt_in_group;
	}

	public String getCont_date() {
		return cont_date;
	}

	public void setCont_date(String cont_date) {
		this.cont_date = cont_date;
	}
	
	
}
