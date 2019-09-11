package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class FreeBoardDto {
	
	private int free_board_no;
	private String free_title;
	private String free_writer;
	private String free_content;
	private Date free_regdate;
	
	public FreeBoardDto() {}

	public FreeBoardDto(String free_title, String free_writer, String free_content) {
		super();
		this.free_title = free_title;
		this.free_writer = free_writer;
		this.free_content = free_content;
	}
	
	public FreeBoardDto(int free_board_no, String free_title, String free_content) {
		super();
		this.free_board_no = free_board_no;
		this.free_title = free_title;
		this.free_content = free_content;
	}

	public FreeBoardDto(int free_board_no, String free_title, String free_writer, String free_content,
			Date free_regdate) {
		
		this.free_board_no = free_board_no;
		this.free_title = free_title;
		this.free_writer = free_writer;
		this.free_content = free_content;
		this.free_regdate = free_regdate;
	}

	public int getFree_board_no() {
		return free_board_no;
	}

	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
	}

	public String getFree_title() {
		return free_title;
	}

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}

	public String getFree_writer() {
		return free_writer;
	}

	public void setFree_writer(String free_writer) {
		this.free_writer = free_writer;
	}

	public String getFree_content() {
		return free_content;
	}

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}

	public String getFree_regdate() {
		return dateformat(free_regdate);
	}

	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}
}
