package com.doncar.dto;

import java.util.Date;
import static common.Util.*;
public class CommentDto {

	private int comment_no;
	private int comment_group_no;
	private int comment_group_sq;
	private int comment_titletab;
	private String comment_nickname;
	private String comment_content;
	private int rent_board_no;
	private int free_board_no;
	private int car_board_no;
	private Date comment_regdate;

	public CommentDto() {
		super();
	}

	public CommentDto(int comment_no, int comment_group_no, int comment_group_sq, int comment_titletab,
			String comment_nickname, String comment_content, int rent_board_no, int free_board_no, int car_board_no,
			Date comment_regdate) {
		super();
		this.comment_no = comment_no;
		this.comment_group_no = comment_group_no;
		this.comment_group_sq = comment_group_sq;
		this.comment_titletab = comment_titletab;
		this.comment_nickname = comment_nickname;
		this.comment_content = comment_content;
		this.rent_board_no = rent_board_no;
		this.free_board_no = free_board_no;
		this.car_board_no = car_board_no;
		this.comment_regdate = comment_regdate;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getRent_board_no() {
		return rent_board_no;
	}

	public void setRent_board_no(int rent_board_no) {
		this.rent_board_no = rent_board_no;
	}

	public int getFree_board_no() {
		return free_board_no;
	}

	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
	}

	public int getCar_board_no() {
		return car_board_no;
	}

	public void setCar_board_no(int car_board_no) {
		this.car_board_no = car_board_no;
	}

	public int getComment_group_no() {
		return comment_group_no;
	}

	public void setComment_group_no(int comment_group_no) {
		this.comment_group_no = comment_group_no;
	}

	public int getComment_group_sq() {
		return comment_group_sq;
	}

	public void setComment_group_sq(int comment_group_sq) {
		this.comment_group_sq = comment_group_sq;
	}

	public int getComment_titletab() {
		return comment_titletab;
	}

	public void setComment_titletab(int comment_titletab) {
		this.comment_titletab = comment_titletab;
	}

	public String getComment_nickname() {
		return comment_nickname;
	}

	public void setComment_nickname(String comment_nickname) {
		this.comment_nickname = comment_nickname;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_regdate() {
		return dateformat(comment_regdate);
	}

	public void setComment_regdate(Date comment_redate) {
		this.comment_regdate = comment_redate;
	}

	@Override
	public String toString() {
		return "CommentDto [comment_no=" + comment_no + ", comment_group_no=" + comment_group_no + ", comment_group_sq="
				+ comment_group_sq + ", comment_titletab=" + comment_titletab + ", comment_nickname=" + comment_nickname
				+ ", comment_content=" + comment_content + ", rent_board_no=" + rent_board_no + ", free_board_no="
				+ free_board_no + ", car_board_no=" + car_board_no + ", comment_regdate=" + comment_regdate + "]";
	}

}
