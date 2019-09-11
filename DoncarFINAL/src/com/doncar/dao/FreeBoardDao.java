package com.doncar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.FreeBoardDto;

public class FreeBoardDao extends SqlMapConfig {

	private String namespace = "freeboard.";
	
	public List<FreeBoardDto> selectlist(FreeBoardDto dto) {
		SqlSession session = null;
		List<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectlist",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List<FreeBoardDto> myboard(String writer) {
		SqlSession session = null;
		List<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "myboard",writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public FreeBoardDto selectone(int free_board_no) {
		SqlSession session = null;
		FreeBoardDto dto = new FreeBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectone", free_board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	public int insert(FreeBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int update(FreeBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int delete(int free_board_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", free_board_no);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}