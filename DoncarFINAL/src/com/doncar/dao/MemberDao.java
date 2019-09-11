package com.doncar.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.FreeBoardDto;
import com.doncar.dto.MemberDto;

public class MemberDao extends SqlMapConfig {

	private String namespace = "member.";

	public MemberDto login(String id, String pw) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		SqlSession session = null;
		MemberDto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;

	}
	

	
	public String idChk(String id) {
		
		SqlSession session = null;
		String res = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace + "idChk", id);
			
			if(res != null) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
			
		return res;
	
	}
	
	public String nicknameChk(String nickname) {
		
		SqlSession session = null;
		System.out.println(nickname);
		String res = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace + "nicknameChk", nickname);
			
			if(res != null) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
			
		return res;
	
	}
	
	public MemberDto findId(String member_name, String member_phone, String member_birth) {

		SqlSession session = null;
		MemberDto MemberDto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			MemberDto = session.selectOne(namespace + "findId", MemberDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return MemberDto;
	}
	
	public MemberDto findPw(String member_id, String member_phone) {
		
		SqlSession session = null;
		MemberDto MemberDto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			MemberDto = session.selectOne(namespace + "findPw", MemberDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return MemberDto;
		
	}
	
	public List<FreeBoardDto> selectWrite(FreeBoardDto FreeBoardDto) {
		
		SqlSession session = null;
		List<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectWrite", FreeBoardDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int pwUpdate(MemberDto MemberDto) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "pwUpdate", MemberDto);
			
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

	public List<MemberDto> selectList(MemberDto dto) {

		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();

		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public MemberDto selectOne(int member_no) {

		SqlSession session = null;
		MemberDto MemberDto = new MemberDto();

		try {
			session = getSqlSessionFactory().openSession(false);
			MemberDto = session.selectOne(namespace + "selectOne", member_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return MemberDto;
	}
	
	public int insert(MemberDto MemberDto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", MemberDto);
			
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
	
	public int update(MemberDto MemberDto) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "update", MemberDto);
			
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
	
	public int delete(int member_no) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "delete", member_no);
			
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

	public MemberDto snsLogin(String id) {
		SqlSession session = null;
		MemberDto dto = null;
		try {
		session = getSqlSessionFactory().openSession(false);
		dto = session.selectOne(namespace+"snslogin",id);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	
	public MemberDto selectMail(String mail_addr) {
		SqlSession session = null;
		MemberDto dto = null;
		
		try {
		session = getSqlSessionFactory().openSession(false);
		dto = session.selectOne(namespace+"selectmail",mail_addr);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	
	public int updateMail(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		System.out.println(dto);
		try {
		session = getSqlSessionFactory().openSession(false);
		res = session.update(namespace+"updatemail",dto);
		if(res>0) {
			session.commit();
		}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

}











