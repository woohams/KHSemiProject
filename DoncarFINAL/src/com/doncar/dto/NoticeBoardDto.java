package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class NoticeBoardDto {
	
	private int notice_no;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private Date notice_regdate;
	private String notice_delflag;
	
	public NoticeBoardDto() {}

	public NoticeBoardDto(String notice_title, String notice_writer, String notice_content) {
		this.notice_title = notice_title;
		this.notice_writer = notice_writer;
		this.notice_content = notice_content;
	}
	
	public NoticeBoardDto(int notice_no, String notice_title, String notice_content) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}

	public NoticeBoardDto(int notice_no, String notice_title, String notice_writer, String notice_content,
			Date notice_regdate, String notice_delflag) {
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_writer = notice_writer;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.notice_delflag = notice_delflag;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_regdate() {
		return dateformat(notice_regdate);
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public String getNotice_delflag() {
		return notice_delflag;
	}

	public void setNotice_delflag(String notice_delflag) {
		this.notice_delflag = notice_delflag;
	}
}
