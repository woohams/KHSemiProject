package com.doncar.biz;

import java.util.List;

import com.doncar.dao.CarBoardDao;
import com.doncar.dto.CarBoardDto;

public class CarBoardBiz {
	
	CarBoardDao dao = new CarBoardDao();
	
	public List<CarBoardDto> selectList(CarBoardDto dto){
		return dao.selectList(dto);
	}
	
	public CarBoardDto selectOne(int car_board_no) {
		return dao.selectOne(car_board_no);
	}
	
	public int insert(CarBoardDto dto) {
		return dao.insert(dto);
	}
	
	public int update(CarBoardDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int car_board_no) {
		return dao.delete(car_board_no);
	}
	
	public List<CarBoardDto> myboard(String writer){
		return dao.myboard(writer);
	}

}
