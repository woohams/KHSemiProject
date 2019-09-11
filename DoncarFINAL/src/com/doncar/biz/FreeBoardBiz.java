package com.doncar.biz;

import java.util.List;

import com.doncar.dao.FreeBoardDao;
import com.doncar.dto.FreeBoardDto;

public class FreeBoardBiz {
	
	private FreeBoardDao dao = new FreeBoardDao();
	
	public List<FreeBoardDto> selectlist(FreeBoardDto dto) {
		return dao.selectlist(dto);
	}
	
	public List<FreeBoardDto> myboard(String writer) {
		return dao.myboard(writer);
	}
	
	public FreeBoardDto selectone(int free_board_no) {
		return dao.selectone(free_board_no);
	}
	
	public int insert(FreeBoardDto dto) {
		return dao.insert(dto);
	}
	
	public int update(FreeBoardDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int free_board_no) {
		return dao.delete(free_board_no);
	}
}
