package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class RentAccDto {
	private int rentacc_no;
	private int rent_board_no;
	private String rentacc_process;
	private Date rentacc_start_date;
	private Date rentacc_end_date;
	private String rentacc_acc;
	private String rentacc_comment;
	private String rentacc_nickname;
	public RentAccDto() {}
	
	public RentAccDto(int rentacc_no, int rent_board_no, Date rentacc_start_date, Date rentacc_end_date,
			String rentacc_acc, String rentacc_comment, String rentacc_nickname) {
		super();
		this.rentacc_no = rentacc_no;
		this.rent_board_no = rent_board_no;
		this.rentacc_start_date = rentacc_start_date;
		this.rentacc_end_date = rentacc_end_date;
		this.rentacc_acc = rentacc_acc;
		this.rentacc_comment = rentacc_comment;
		this.rentacc_nickname = rentacc_nickname;
	}
	
	
	public RentAccDto(int rent_board_no, Date rentacc_start_date, Date rentacc_end_date, String rentacc_comment) {
		super();
		this.rent_board_no = rent_board_no;
		this.rentacc_start_date = rentacc_start_date;
		this.rentacc_end_date = rentacc_end_date;
		this.rentacc_comment = rentacc_comment;
	}

	public RentAccDto(int rentacc_no, Date rentacc_start_date, Date rentacc_end_date, String rentacc_acc,
			String rentacc_comment) {
		super();
		this.rentacc_no = rentacc_no;
		this.rentacc_start_date = rentacc_start_date;
		this.rentacc_end_date = rentacc_end_date;
		this.rentacc_acc = rentacc_acc;
		this.rentacc_comment = rentacc_comment;
	}
	
	
	public String getRentacc_process() {
		return rentacc_process;
	}

	public void setRentacc_process(String rentacc_process) {
		this.rentacc_process = rentacc_process;
	}

	public RentAccDto(int rentacc_no, String rentacc_comment) {
		super();
		this.rentacc_no = rentacc_no;
		this.rentacc_comment = rentacc_comment;
	}
	public int getRentacc_no() {
		return rentacc_no;
	}
	public void setRentacc_no(int rentacc_no) {
		this.rentacc_no = rentacc_no;
	}
	public int getRent_board_no() {
		return rent_board_no;
	}
	public void setRent_board_no(int rent_board_no) {
		this.rent_board_no = rent_board_no;
	}
	public String getRentacc_start_date() {
		return dateformat(rentacc_start_date);
	}
	public void setRentacc_start_date(Date rentacc_start_date) {
		this.rentacc_start_date = rentacc_start_date;
	}
	public String getRentacc_end_date() {
		return dateformat(rentacc_end_date);
	}
	public void setRentacc_end_date(Date rentacc_end_date) {
		this.rentacc_end_date = rentacc_end_date;
	}
	public String getRentacc_acc() {
		return rentacc_acc;
	}
	public void setRentacc_acc(String rentacc_acc) {
		this.rentacc_acc = rentacc_acc;
	}
	public String getRentacc_comment() {
		return rentacc_comment;
	}
	public void setRentacc_comment(String rentacc_comment) {
		this.rentacc_comment = rentacc_comment;
	}
	public String getRentacc_nickname() {
		return rentacc_nickname;
	}
	public void setRentacc_nickname(String rentacc_nickname) {
		this.rentacc_nickname = rentacc_nickname;
	}

	@Override
	public String toString() {
		return "RentAccDto [rentacc_no=" + rentacc_no + ", rent_board_no=" + rent_board_no + ", rentacc_process="
				+ rentacc_process + ", rentacc_start_date=" + rentacc_start_date + ", rentacc_end_date="
				+ rentacc_end_date + ", rentacc_acc=" + rentacc_acc + ", rentacc_comment=" + rentacc_comment
				+ ", rentacc_nickname=" + rentacc_nickname + "]";
	}
	
	
}
