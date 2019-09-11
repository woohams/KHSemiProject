package com.doncar.dto;

import java.util.Date;
import static common.Util.*;

public class ChatMessageDto {
	
	private int chat_no;
	private String sender;
	private String receiver;
	private String content;
	private Date regdate;
	
	
	public ChatMessageDto() {
		super();
	}


	public ChatMessageDto(int chat_no, String sender, String receiver, String content) {
		super();
		this.chat_no = chat_no;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
	}


	public int getChat_no() {
		return chat_no;
	}


	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRegdate() {
		return dateformat(regdate);
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "ChatMessageDto [chat_no=" + chat_no + ", sender=" + sender + ", receiver=" + receiver + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	
	
	

}
