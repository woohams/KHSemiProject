package com.doncar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.RentAccDto;

public class RentAccDao extends SqlMapConfig {

	private String namespace = "rentacc.";
	
	public List<RentAccDto> rentacc_selectlist(){
		SqlSession session = null;
		List<RentAccDto> list = new ArrayList<RentAccDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"rentacc_selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	public List<RentAccDto> myacclist(String writer){
		SqlSession session = null;
		List<RentAccDto> list = new ArrayList<RentAccDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"myacclist",writer);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	public List<RentAccDto> selectwriter(String writer){
		SqlSession session = null;
		List<RentAccDto> list = new ArrayList<RentAccDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"rentacc_writer",writer);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
	public RentAccDto rentacc_selectone(int rentacc_no) {
		SqlSession session = null;
		RentAccDto rentacc_dto = new RentAccDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			rentacc_dto = session.selectOne(namespace+"rentacc_selectone",rentacc_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return rentacc_dto;
	}
	
	public int rentacc_insert(RentAccDto rentacc_dto) {
		SqlSession session = null;
		int res = 0;
		System.out.println(rentacc_dto);
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"rentacc_insert",rentacc_dto);
			if(res>0) {
				session.commit();
			}else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int updateacc(RentAccDto rentacc_dto) {
		SqlSession session = null;
		int res = 0;
		System.out.println(rentacc_dto);
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"updateacc",rentacc_dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int rentacc_delete(int rentacc_dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace+"rentacc_delete",rentacc_dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
}
