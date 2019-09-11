package com.doncar.biz;

import java.util.List;

import com.doncar.dao.ChatDao;
import com.doncar.dto.ChatDto;

public class ChatBiz {
	
	private ChatDao dao = new ChatDao();
	
	public List<ChatDto> selectlist(){
		List<ChatDto> list = dao.selectlist();
		return list;
	}
	public List<ChatDto> selectlist(String nickname){
		List<ChatDto> list = dao.selectlist(nickname);
		return list;
	}
	public ChatDto selectone(int chat_no) {
		ChatDto dto = dao.selectone(chat_no);
		return dto;
	}
	public int insert(ChatDto dto) {
		int res = dao.insert(dto);
		return res;
	}
	public int update(ChatDto dto) {
		int res = dao.update(dto);
		return res;
	}
	public int delete(int chat_no) {
		int res = dao.delete(chat_no);
		return res;
	}
	

}
