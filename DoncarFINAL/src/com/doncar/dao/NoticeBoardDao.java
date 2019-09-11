package com.doncar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.NoticeBoardDto;

public class NoticeBoardDao extends SqlMapConfig {

	private String namespace = "noticeboard.";
	
	public List<NoticeBoardDto> selectlist(NoticeBoardDto dto) {
		SqlSession session = null;
		List<NoticeBoardDto> list = new ArrayList<NoticeBoardDto>();
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectlist", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public NoticeBoardDto selectone(int notice_no) {
		
		SqlSession session = null;
		NoticeBoardDto dto = new NoticeBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "selectone", notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	public int insert(NoticeBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
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
	
	public int update(NoticeBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "update", dto);
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
	
	public int delete(int notice_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "delete", notice_no);
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
