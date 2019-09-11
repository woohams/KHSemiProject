package com.doncar.biz;

import java.util.List;

import com.doncar.dao.RentAccDao;
import com.doncar.dto.RentAccDto;

public class RentAccBiz {
	RentAccDao rentacc_dao = new RentAccDao();
	
	public List<RentAccDto> rentacc_selectlist(){
		return rentacc_dao.rentacc_selectlist();
	}
	
	public List<RentAccDto> myacclist(String writer){
		return rentacc_dao.myacclist(writer);
	}
	
	public RentAccDto rentacc_selectone(int rentacc_no) {
		return rentacc_dao.rentacc_selectone(rentacc_no);
	}
	
	public int rentacc_insert(RentAccDto rentacc_dto) {
		return rentacc_dao.rentacc_insert(rentacc_dto);
	}
	
	public int updateacc(RentAccDto rentacc_dto) {
		return rentacc_dao.updateacc(rentacc_dto);
	}
	
	public int rentacc_delete(int rentacc_dto) {
		return rentacc_dao.rentacc_delete(rentacc_dto);
	}
	
	public List<RentAccDto> selectwriter(String writer){
		return rentacc_dao.selectwriter(writer);
	}
	
	
}
