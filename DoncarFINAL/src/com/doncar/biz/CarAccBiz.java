package com.doncar.biz;

import java.util.List;

import com.doncar.dao.CarAccDao;
import com.doncar.dto.CarAccDto;

public class CarAccBiz {
	
	CarAccDao dao = new CarAccDao();
	
	public List<CarAccDto> selectList(){
		return dao.selectList();
	}
	public List<CarAccDto> myacclist(String writer){
		return dao.myacclist(writer);
	}	
	
	public List<CarAccDto> selectwriter(String writer){
		return dao.selectwriter(writer);
	}	
		
	public CarAccDto selectOne(int caracc_no) {
		return dao.selectOne(caracc_no);
	}
	
	public int insert(CarAccDto dto) {
		return dao.insert(dto);
	}
	
	public int update(CarAccDto dto) {
		return dao.update(dto);
	}
	public int updateacc(CarAccDto dto) {
		return dao.updateacc(dto);
	}
	
	public int delete(int caracc_no) {
		return dao.delete(caracc_no);
	}
	
}
