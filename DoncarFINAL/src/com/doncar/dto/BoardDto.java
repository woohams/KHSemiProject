package com.doncar.dto;

import java.util.Date;
import static common.Util.*;

public class BoardDto {
	
	int no;
	String process;
	int title;
	Date regdate;
	
	public BoardDto(int no, String process, int title, Date regdate) {
		super();
		this.no = no;
		this.process = process;
		this.title = title;
		this.regdate = regdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public int getTitle() {
		return title;
	}
	public void setTitle(int title) {
		this.title = title;
	}
	public String getRegdate() {
		return dateformat(regdate);
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	

	
}
