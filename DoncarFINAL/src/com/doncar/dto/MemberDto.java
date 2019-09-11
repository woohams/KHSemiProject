package com.doncar.dto;

import java.util.Date;
import static common.Util.*;

public class MemberDto {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickname;
	private String member_gender;
	private String member_addr;
	private int member_money;
	private String member_birth;
	private String member_email;
	private String member_phone;
	private String member_roll;
	private String member_driveacc;
	private String member_delflag;
	private Date member_regdate;
	
	public MemberDto() {

	}
	
	// 전체 선택 Dto
	public MemberDto(int member_no, String member_id, String member_pw, String member_name, String member_nickname,
			String member_gender, String member_addr, int member_money, String member_birth, String member_email,
			String member_phone, String member_roll, String member_driveacc, String member_delflag,
			Date member_regdate) {

		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_gender = member_gender;
		this.member_addr = member_addr;
		this.member_money = member_money;
		this.member_birth = member_birth;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_roll = member_roll;
		this.member_driveacc = member_driveacc;
		this.member_delflag = member_delflag;
		this.member_regdate = member_regdate;
	}

	
	// 기본 회원가입
	public MemberDto(String member_id, String member_nickname, String member_name, String member_pw, String member_email) {
		super();
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.member_name = member_name;
		this.member_pw = member_pw;
		this.member_email = member_email;
	}
	
	
	// ID 찾기
	public MemberDto(String member_name, String member_phone, String member_birth) {
		super();
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_birth = member_birth;
	}
	
	// PW 찾기
	public MemberDto(String member_id, String member_phone) {
		super();
		this.member_id = member_id;
		this.member_phone = member_phone;
	}
	

	// 비밀번호 변경
	public MemberDto(String member_pw, int member_no) {
		super();
		this.member_pw = member_pw;
		this.member_no = member_no;
	}


	// 마이페이지 정보수정
	public MemberDto(String member_nickname, String member_gender, String member_birth, 
			String member_addr,String member_email, String member_phone, String member_driveacc, int member_no) {
		super();
		this.member_nickname = member_nickname;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.member_addr = member_addr;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_driveacc = member_driveacc;
		this.member_no = member_no;
	}
	


	// getter & setter
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public int getMember_money() {
		return member_money;
	}

	public void setMember_money(int member_money) {
		this.member_money = member_money;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_roll() {
		return member_roll;
	}

	public void setMember_roll(String member_roll) {
		this.member_roll = member_roll;
	}

	public String getMember_driveacc() {
		return member_driveacc;
	}

	public void setMember_driveacc(String member_driveacc) {
		this.member_driveacc = member_driveacc;
	}

	public String getMember_delflag() {
		return member_delflag;
	}

	public void setMember_delflag(String member_delflag) {
		this.member_delflag = member_delflag;
	}

	public String getMember_regdate() {
		return dateformat(member_regdate);
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberDto [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_nickname=" + member_nickname + ", member_gender="
				+ member_gender + ", member_addr=" + member_addr + ", member_money=" + member_money + ", member_birth="
				+ member_birth + ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_roll="
				+ member_roll + ", member_driveacc=" + member_driveacc + ", member_delflag=" + member_delflag
				+ ", member_regdate=" + member_regdate + "]";
	}
	
	
	

}




