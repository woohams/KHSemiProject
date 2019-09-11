package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class RentBoardDto {
	private int rent_board_no;
	private String rent_process;
	private String rent_title;
	private String rent_writer;
	private String rent_company;
	private String rent_size;
	private String rent_fuel;
	private int rent_price;
	private String rent_location;
	private String rent_x_point;
	private String rent_y_point;
	private Date rent_regdate;
	private String rent_img;
	private String rent_delflag;
	private String rent_carno;
	private String rent_carname;
	private String rent_content;

	public RentBoardDto() {
	}

	public RentBoardDto(int rent_board_no, String rent_title, String rent_writer, String rent_company, String rent_size,
			String rent_fuel, int rent_price, String rent_location, String rent_x_point, String rent_y_point,
			Date rent_regdate, String rent_img, String rent_delflag, String rent_carno, String rent_carname,
			String rent_content) {
		super();
		this.rent_board_no = rent_board_no;
		this.rent_title = rent_title;
		this.rent_writer = rent_writer;
		this.rent_company = rent_company;
		this.rent_size = rent_size;
		this.rent_fuel = rent_fuel;
		this.rent_price = rent_price;
		this.rent_location = rent_location;
		this.rent_x_point = rent_x_point;
		this.rent_y_point = rent_y_point;
		this.rent_regdate = rent_regdate;
		this.rent_img = rent_img;
		this.rent_delflag = rent_delflag;
		this.rent_carno = rent_carno;
		this.rent_carname = rent_carname;
		this.rent_content = rent_content;
	}

	public RentBoardDto(int rent_board_no, String rent_process, String rent_title, String rent_writer,
			String rent_company, String rent_size, String rent_fuel, int rent_price, String rent_location,
			Date rent_regdate, String rent_img, String rent_carname, String rent_content) {
		super();
		this.rent_board_no = rent_board_no;
		this.rent_process = rent_process;
		this.rent_title = rent_title;
		this.rent_writer = rent_writer;
		this.rent_company = rent_company;
		this.rent_size = rent_size;
		this.rent_fuel = rent_fuel;
		this.rent_price = rent_price;
		this.rent_location = rent_location;
		this.rent_regdate = rent_regdate;
		this.rent_img = rent_img;
		this.rent_carname = rent_carname;
		this.rent_content = rent_content;
	}

	// insert
	public RentBoardDto(String rent_process, String rent_title, String rent_writer, String rent_company,
			String rent_size, String rent_fuel, int rent_price, String rent_location, String rent_img,
			String rent_carname, String rent_content) {
		super();
		this.rent_process = rent_process;
		this.rent_title = rent_title;
		this.rent_writer = rent_writer;
		this.rent_company = rent_company;
		this.rent_size = rent_size;
		this.rent_fuel = rent_fuel;
		this.rent_price = rent_price;
		this.rent_location = rent_location;
		this.rent_img = rent_img;
		this.rent_carname = rent_carname;
		this.rent_content = rent_content;
	}

	public RentBoardDto(int rent_board_no, String rent_title, String rent_company, String rent_size, String rent_fuel,
			int rent_price, String rent_location, String rent_img, String rent_carname, String rent_content) {
		super();
		this.rent_board_no = rent_board_no;
		this.rent_title = rent_title;
		this.rent_company = rent_company;
		this.rent_size = rent_size;
		this.rent_fuel = rent_fuel;
		this.rent_price = rent_price;
		this.rent_location = rent_location;
		this.rent_img = rent_img;
		this.rent_carname = rent_carname;
		this.rent_content = rent_content;
	}

	public String getRent_content() {
		return rent_content;
	}

	public void setRent_content(String rent_content) {
		this.rent_content = rent_content;
	}

	public String getRent_process() {
		return rent_process;
	}

	public void setRent_process(String rent_process) {
		this.rent_process = rent_process;
	}

	public int getRent_board_no() {
		return rent_board_no;
	}

	public void setRent_board_no(int rent_board_no) {
		this.rent_board_no = rent_board_no;
	}

	public String getRent_title() {
		return rent_title;
	}

	public void setRent_title(String rent_title) {
		this.rent_title = rent_title;
	}

	public String getRent_writer() {
		return rent_writer;
	}

	public void setRent_writer(String rent_writer) {
		this.rent_writer = rent_writer;
	}

	public String getRent_company() {
		return rent_company;
	}

	public void setRent_company(String rent_company) {
		this.rent_company = rent_company;
	}

	public String getRent_size() {
		return rent_size;
	}

	public void setRent_size(String rent_size) {
		this.rent_size = rent_size;
	}

	public String getRent_fuel() {
		return rent_fuel;
	}

	public void setRent_fuel(String rent_fuel) {
		this.rent_fuel = rent_fuel;
	}

	public int getRent_price() {
		return rent_price;
	}

	public void setRent_price(int rent_price) {
		this.rent_price = rent_price;
	}

	public String getRent_location() {
		return rent_location;
	}

	public void setRent_location(String rent_location) {
		this.rent_location = rent_location;
	}

	public String getRent_x_point() {
		return rent_x_point;
	}

	public void setRent_x_point(String rent_x_point) {
		this.rent_x_point = rent_x_point;
	}

	public String getRent_y_point() {
		return rent_y_point;
	}

	public void setRent_y_point(String rent_y_point) {
		this.rent_y_point = rent_y_point;
	}

	public String getRent_regdate() {
		return dateformat(rent_regdate);
	}

	public void setRent_regdate(Date rent_regdate) {
		this.rent_regdate = rent_regdate;
	}

	public String getRent_img() {
		return rent_img;
	}

	public void setRent_img(String rent_img) {
		this.rent_img = rent_img;
	}

	public String getRent_delflag() {
		return rent_delflag;
	}

	public void setRent_delflag(String rent_delflag) {
		this.rent_delflag = rent_delflag;
	}

	public String getRent_carno() {
		return rent_carno;
	}

	public void setRent_carno(String rent_carno) {
		this.rent_carno = rent_carno;
	}

	public String getRent_carname() {
		return rent_carname;
	}

	public void setRent_carname(String rent_carname) {
		this.rent_carname = rent_carname;
	}

	@Override
	public String toString() {
		return "RentBoardDto [rent_board_no=" + rent_board_no + ", rent_process=" + rent_process + ", rent_title="
				+ rent_title + ", rent_writer=" + rent_writer + ", rent_company=" + rent_company + ", rent_size="
				+ rent_size + ", rent_fuel=" + rent_fuel + ", rent_price=" + rent_price + ", rent_location="
				+ rent_location + ", rent_x_point=" + rent_x_point + ", rent_y_point=" + rent_y_point
				+ ", rent_regdate=" + rent_regdate + ", rent_img=" + rent_img + ", rent_delflag=" + rent_delflag
				+ ", rent_carno=" + rent_carno + ", rent_carname=" + rent_carname + ", rent_content=" + rent_content
				+ "]";
	}

}