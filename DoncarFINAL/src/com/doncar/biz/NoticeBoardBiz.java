package com.doncar.biz;

import java.util.List;

import com.doncar.dao.NoticeBoardDao;
import com.doncar.dto.NoticeBoardDto;

public class NoticeBoardBiz {
	
	private NoticeBoardDao dao = new NoticeBoardDao();
	
	public List<NoticeBoardDto> selectlist(NoticeBoardDto dto) {
		return dao.selectlist(dto);
	}
	
	public NoticeBoardDto selectone(int notice_no) {
		return dao.selectone(notice_no);
	}
	
	public int insert(NoticeBoardDto dto) {
		return dao.insert(dto);
	}
	
	public int update(NoticeBoardDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int notice_no) {
		return dao.delete(notice_no);
	}
}
