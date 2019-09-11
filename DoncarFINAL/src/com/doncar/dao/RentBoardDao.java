package com.doncar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.doncar.dto.RentBoardDto;

public class RentBoardDao extends SqlMapConfig {

	private String namespace = "rentboard.";

	public List<RentBoardDto> rentboard_selectlist(RentBoardDto dto) {
		SqlSession session = null;
		List<RentBoardDto> list = new ArrayList<RentBoardDto>();
		try {
			System.out.println(dto);
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "rentboard_selectlist",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public RentBoardDto rentboard_selectone(int rent_board_no) {
		SqlSession session = null;
		RentBoardDto rent_dto = new RentBoardDto();

		try {
			session = getSqlSessionFactory().openSession();
			rent_dto = session.selectOne(namespace + "rentboard_selectone", rent_board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rent_dto;
	}

	public int rentboard_insert(RentBoardDto rent_dto) {
		SqlSession session = null;
		int res = 0;
		
		if(rent_dto.getRent_company()==null) {
			rent_dto.setRent_company("");
		}
		System.out.println(rent_dto);
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "rentboard_insert", rent_dto);
			System.out.println(res);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int rentboard_update(RentBoardDto rent_dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "rentboard_update", rent_dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int rentboard_delete(int rent_dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "rentboard_delete", rent_dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		// Y로update로 해줄 것
		return res;
	}
	
	public List<RentBoardDto> rentboard_search(String writer) {
		SqlSession session = null;
		List<RentBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "rentboard_search", writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	

	
	public List<RentBoardDto> myboard(String writer) {
		SqlSession session = null;
		List<RentBoardDto> list = null;
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"rentboard_myboard",writer);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}
