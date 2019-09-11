package com.doncar.biz;

import java.util.List;

import com.doncar.dao.RentBoardDao;
import com.doncar.dto.RentBoardDto;

public class RentBoardBiz {
	private RentBoardDao dao = new RentBoardDao();
	
public List<RentBoardDto> rentboard_selectlist(RentBoardDto dto){
		return dao.rentboard_selectlist(dto);
	}
	public RentBoardDto rentboard_selectone(int rent_board_no){
		return dao.rentboard_selectone(rent_board_no);
	}
	public int rentboard_insert(RentBoardDto rent_dto) {
		return dao.rentboard_insert(rent_dto);
	}
	public int rentboard_update(RentBoardDto rent_dto) {
		return dao.rentboard_update(rent_dto);
	}
	public int rentboard_delete(int rent_dto) {
		// Y로update로 해줄 것
		return dao.rentboard_delete(rent_dto);
	}
	public List<RentBoardDto> rentboard_search(String writer){
		return dao.rentboard_search(writer);
	}
	public List<RentBoardDto> myboard(String writer){
		return dao.myboard(writer);

	}
}
