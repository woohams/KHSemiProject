package com.doncar.biz;

import java.util.List;

import com.doncar.dao.FreeBoardDao;
import com.doncar.dao.MemberDao;
import com.doncar.dto.FreeBoardDto;
import com.doncar.dto.MemberDto;

public class MemberBiz {
	
	MemberDao dao;
	private FreeBoardDao Freedao = new FreeBoardDao();
	
	public MemberBiz() {
		dao = new MemberDao();
		
	}
	
	public MemberDto login(String member_id, String member_pw) {
		
		return dao.login(member_id, member_pw);
	}
	

	public String idChk(String member_id) {
		
		return dao.idChk(member_id);
	}
	
	public String nicknameChk(String member_nickname) {
		
		return dao.nicknameChk(member_nickname);
	}
	
	public MemberDto findId(String member_name, String member_phone, String member_birth) {
		
		return dao.findId(member_name, member_phone, member_birth);
	}
	
	public MemberDto findPw(String member_id, String member_phone) {
		
		return dao.findPw(member_id, member_phone);
	}
	
	
	public List<FreeBoardDto> selectWriter(FreeBoardDto FreeBoardDto) {
		
		return Freedao.selectlist(FreeBoardDto);
	}
	
	public int pwUpdate(MemberDto MemberDto) {
		
		return dao.pwUpdate(MemberDto);
	}
	
	public List<MemberDto> selectList(MemberDto dto) {

		return dao.selectList(dto);
	}
	
	public MemberDto selectOne(int member_no) {

		return dao.selectOne(member_no);
	}

	
	public int insert(MemberDto MemberDto) {

		return dao.insert(MemberDto);
	}

	
	public int update(MemberDto MemberDto) {

		return dao.update(MemberDto);
	}

	public int delete(int member_no) {
		
		return dao.delete(member_no);
	}
	
	public MemberDto snsLogin(String member_id) {
		
		return dao.snsLogin(member_id);
	}
	
	public MemberDto selectMail(String mail_addr) {
		
		return dao.selectMail(mail_addr);
	
	}
	
	public int updateMail(MemberDto dto) {
		return dao.updateMail(dto);
	}
}




