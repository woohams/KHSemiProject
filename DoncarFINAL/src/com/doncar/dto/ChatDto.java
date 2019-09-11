package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class ChatDto {
	
	private int chat_no;
	private String user1;
	private String user2;
	private String content;
	private int car_board_no;
	private int rent_board_no;
	private Date regdate;
	
	public String getRegdate() {
		return dateformat(regdate);
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public ChatDto() {
		super();
	}
	
	public ChatDto(int chat_no, String user1, String user2, String content, int car_board_no, int rent_board_no, Date regdate) {
		super();
		this.chat_no = chat_no;
		this.user1 = user1;
		this.user2 = user2;
		this.content = content;
		this.car_board_no = car_board_no;
		this.rent_board_no = rent_board_no;
		this.regdate = regdate;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public String getUser2() {
		return user2;
	}

	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCar_board_no() {
		return car_board_no;
	}

	public void setCar_board_no(int car_board_no) {
		this.car_board_no = car_board_no;
	}

	public int getRent_board_no() {
		return rent_board_no;
	}

	public void setRent_board_no(int rent_board_no) {
		this.rent_board_no = rent_board_no;
	}

	@Override
	public String toString() {
		return "ChatDto [chat_no=" + chat_no + ", user1=" + user1 + ", user2=" + user2 + ", content=" + content
				+ ", car_board_no=" + car_board_no + ", rent_board_no=" + rent_board_no + ", regdate=" + regdate + "]";
	}
	
	
	

}
