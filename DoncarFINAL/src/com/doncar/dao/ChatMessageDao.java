package com.doncar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.ChatMessageDto;

public class ChatMessageDao extends SqlMapConfig {

	private String namespace = "chatmsg.";
	
	public List<ChatMessageDto> selectList(int chat_no){
		SqlSession session = null;
		List<ChatMessageDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectlist", chat_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	public int insertMsg(ChatMessageDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		return res;
		
	}
}
