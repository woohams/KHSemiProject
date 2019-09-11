package com.doncar.dto;

public class CarAccDto {
	
	private int caracc_no;
	private int car_board_no;
	private String caracc_process;
	private String caracc_xpoint;
	private String caracc_ypoint;
	private String caracc_coment;
	private String caracc_nickname;
	private String caracc_acc;
	
	public CarAccDto() {
		
	}

	public CarAccDto(int caracc_no, int car_board_no, String caracc_process, String caracc_xpoint, String caracc_ypoint,
			String caracc_coment, String caracc_nickname, String caracc_acc) {
		super();
		this.caracc_no = caracc_no;
		this.car_board_no = car_board_no;
		this.caracc_process = caracc_process;
		this.caracc_xpoint = caracc_xpoint;
		this.caracc_ypoint = caracc_ypoint;
		this.caracc_coment = caracc_coment;
		this.caracc_nickname = caracc_nickname;
		this.caracc_acc = caracc_acc;
	}

	public int getCaracc_no() {
		return caracc_no;
	}

	public void setCaracc_no(int caracc_no) {
		this.caracc_no = caracc_no;
	}

	public int getCar_board_no() {
		return car_board_no;
	}

	public void setCar_board_no(int car_board_no) {
		this.car_board_no = car_board_no;
	}

	public String getCaracc_process() {
		return caracc_process;
	}

	public void setCaracc_process(String caracc_process) {
		this.caracc_process = caracc_process;
	}

	public String getCaracc_xpoint() {
		return caracc_xpoint;
	}

	public void setCaracc_xpoint(String caracc_xpoint) {
		this.caracc_xpoint = caracc_xpoint;
	}

	public String getCaracc_ypoint() {
		return caracc_ypoint;
	}

	public void setCaracc_ypoint(String caracc_ypoint) {
		this.caracc_ypoint = caracc_ypoint;
	}

	public String getCaracc_coment() {
		return caracc_coment;
	}

	public void setCaracc_coment(String caracc_coment) {
		this.caracc_coment = caracc_coment;
	}

	public String getCaracc_nickname() {
		return caracc_nickname;
	}

	public void setCaracc_nickname(String caracc_nickname) {
		this.caracc_nickname = caracc_nickname;
	}

	public String getCaracc_acc() {
		return caracc_acc;
	}

	public void setCaracc_acc(String caracc_acc) {
		this.caracc_acc = caracc_acc;
	}

	@Override
	public String toString() {
		return "CarAccDto [caracc_no=" + caracc_no + ", car_board_no=" + car_board_no + ", caracc_process="
				+ caracc_process + ", caracc_xpoint=" + caracc_xpoint + ", caracc_ypoint=" + caracc_ypoint
				+ ", caracc_coment=" + caracc_coment + ", caracc_nickname=" + caracc_nickname + ", caracc_acc="
				+ caracc_acc + "]";
	}
	
	
	
	
	
	
}
