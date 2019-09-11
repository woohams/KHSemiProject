package com.doncar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.CarBoardDto;

public class CarBoardDao extends SqlMapConfig {

	private String namespace = "carboard.";
	
	public List<CarBoardDto> selectList(CarBoardDto dto){
		
		SqlSession session = null;
		List<CarBoardDto> list = null;
		System.out.println(dto);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectlist", dto);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	public CarBoardDto selectOne(int car_board_no) {
		
		SqlSession session = null;
		CarBoardDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectone",car_board_no);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert(CarBoardDto dto) {
		
		SqlSession session = null;
		int res = 0;
		System.out.println(dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
			
			if(res > 0) {
				
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
	public int update(CarBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update",dto);
			
			if(res > 0) {
				
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public int delete(int car_board_no) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"delete" , car_board_no);
			
			if(res > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public List<CarBoardDto> myboard(String writer){
		SqlSession session = null;
		List<CarBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"myboard", writer);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	
}
