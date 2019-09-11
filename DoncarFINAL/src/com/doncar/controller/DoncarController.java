package com.doncar.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.SendFailedException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doncar.mail.MailSend;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import static common.Util.*;
import com.doncar.biz.*;
import com.doncar.dto.*;
import com.doncar.dao.RentBoardDao;

@WebServlet("/doncar.do")
public class DoncarController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoncarController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		String searchtype = request.getParameter("searchtype");
		String searchinput = request.getParameter("searchinput");
		String membersearch = request.getParameter("membersearch");
		String memberinput = request.getParameter("memberinput");
		if(searchinput != null) {
			searchinput = searchinput.trim();
		}
		
		if(memberinput != null) {
			memberinput = memberinput.trim();
		}
		System.out.println("<" + command + ">");
		if (command != null) {
			
			if (command.equals("login")) {
				MemberBiz biz = new MemberBiz();
				if (request.getSession().getAttribute("MemberDto") == null) {

					String member_id = request.getParameter("id");
					String member_pw = request.getParameter("pw");

					MemberDto dto = biz.login(member_id, member_pw);
					if (dto != null) {
						System.out.println(dto.getMember_regdate());
						request.getSession().setAttribute("MemberDto", dto);

						if (dto.getMember_roll().equals("ADMIN")) {
							dispatch(request, response, "adminmain.jsp");
						} else if (dto.getMember_roll().equals("USER")) {
							dispatch(request, response, "main.jsp");
						}

					} else {
						alert("아이디 혹은 비밀번호가 틀렸습니다.", "login.jsp", response);
					}
				} else {
					alert("이미 로그인이 되어있습니다.", "main.jsp", response);
				}

			} else if(command.equals("member_kakao_login")) {
				if (request.getSession().getAttribute("MemberDto") == null) {
					String member_id = request.getParameter("member_id");
					String member_nickname = request.getParameter("member_nickname");
					
					MemberBiz biz = new MemberBiz();
					MemberDto dto = biz.snsLogin(member_id);

					if (dto != null) {
						request.getSession().setAttribute("MemberDto", dto);

						if (dto.getMember_roll().equals("ADMIN")) {
							dispatch(request, response, "adminmain.jsp");
						} else if (dto.getMember_roll().equals("USER")) {
							dispatch(request, response, "main.jsp");
						}
					} else {
						request.setAttribute("member_id", member_id);
						request.setAttribute("member_nickname", member_nickname);
						dispatch(request, response, "snsregist.jsp");
					}

				} else {
					alert("이미 로그인이 되어있습니다.", "main.jsp", response);
				}				
				
			} else if (command.equals("logout")) {
				
				request.getSession().invalidate();
				response.sendRedirect("main.jsp");
				
			} else if (command.equals("usermain")) {
				MemberDto dto = (MemberDto)request.getSession().getAttribute("MemberDto");
				if(dto == null) {
					response.sendRedirect("login.jsp");
				}else {
					response.sendRedirect("usermain.jsp");
				}
			} else if (command.contains("comment")) {
				CommentBiz biz = new CommentBiz();
				String type = request.getParameter("type");
				String boardno = request.getParameter("no");
				int no = 0;
				if(boardno!=null) {
				 no = Integer.parseInt(boardno);
				}
				CommentDto dto = new CommentDto();
				if(type != null && type.contains("rent")) {
					dto.setRent_board_no(no);
					System.out.println("rent : "+no);
				}else if(type != null && type.contains("free")) {
					dto.setFree_board_no(no);
					System.out.println("freeboard: " + no);
				}else if(type != null && type.contains("car")){
					dto.setCar_board_no(no);
					System.out.println("carboard :"+no);
				}
				
				if (command.equals("comment_selectlist")) {

				} else if (command.equals("comment_selectone")) {

				} else if (command.equals("comment_insert")) {
					String comment_nickname = request.getParameter("comment_nickname");
					String comment_content = request.getParameter("comment_content");
					dto.setComment_nickname(comment_nickname);
					dto.setComment_content(comment_content);
					int res = biz.insert(dto);
					
					if(res>0) {
						System.out.println("삽입 성공");
						dto = biz.lastnum();
						System.out.println(dto);
						JSONObject obj = new JSONObject();
						obj.put("titletab",dto.getComment_titletab());
						obj.put("no",dto.getComment_no());
						obj.put("nickname", dto.getComment_nickname());
						obj.put("content", dto.getComment_content());
						obj.put("regdate",dto.getComment_regdate());
					
						System.out.println("servlet json object : " + obj.toJSONString());
						
						PrintWriter out = response.getWriter();
						out.println(obj.toJSONString());
					}else {
						System.out.println("삽입실패");
					}
				} else if (command.equals("comment_delete")) {
					int comment_no = Integer.parseInt(request.getParameter("comment_no"));
					int res = biz.delete(comment_no);
					
					PrintWriter out = response.getWriter();
					out.println(res);

				} else if (command.equals("comment_updateres")) {
					int comment_no = Integer.parseInt(request.getParameter("comment_no"));
					dto.setComment_no(comment_no);
					dto.setComment_content(request.getParameter("comment_content"));
					System.out.println(dto);
					int res = biz.update(dto);
					if(res>0) {
						System.out.println("댓글수정 성공");
						dto = biz.selectone(comment_no);
						JSONObject obj = new JSONObject();
						obj.put("titletab",dto.getComment_titletab());
						obj.put("no",dto.getComment_no());
						obj.put("nickname", dto.getComment_nickname());
						obj.put("content", dto.getComment_content());
						obj.put("regdate",dto.getComment_regdate());
						
						System.out.println("servlet json object : " + obj.toJSONString());
						
						PrintWriter out = response.getWriter();
						out.println(obj.toJSONString());
					}else {
						System.out.println("댓글수정 실패");
					}


				} else if (command.equals("comment_reply")) {
					String comment_nickname = request.getParameter("comment_nickname");
					String comment_content = request.getParameter("comment_content");
					int commnet_no = Integer.parseInt(request.getParameter("comment_no"));
					dto.setComment_nickname(comment_nickname);
					dto.setComment_content(comment_content);
					dto.setComment_no(commnet_no);
					int res = biz.commentProc(dto);
					if(res>0) {
						System.out.println("리플삽입 성공");
						dto = biz.lastnum();
						JSONObject obj = new JSONObject();
						obj.put("titletab",dto.getComment_titletab());
						obj.put("no",dto.getComment_no());
						obj.put("nickname", dto.getComment_nickname());
						obj.put("content", dto.getComment_content());
						obj.put("regdate",dto.getComment_regdate());
						
						System.out.println("servlet json object : " + obj.toJSONString());
						
						PrintWriter out = response.getWriter();
						out.println(obj.toJSONString());
					}else {
						System.out.println("리플삽입실패");
					}
					
				}
			} else if (command.contains("member")) {
				MemberBiz biz = new MemberBiz();
				if (command.equals("member_selectlist")) {
					MemberDto dto = new MemberDto();
					if(membersearch != null && memberinput != null) {
						String member[] = membersearch.split("A");
						
						for (int i = 0; i < member.length; i++) {
							if(member[i].equals("id")) {
								dto.setMember_id(memberinput);
							} else if(member[i].equals("nickname")) {
								dto.setMember_nickname(memberinput);
							} else if(member[i].equals("name")) {
								dto.setMember_name(memberinput);
							}
						}
					}
					
					List<MemberDto> list = biz.selectList(dto);
					
					request.setAttribute("member_selectlist", list);
					dispatch(request, response, "adminmemberlist.jsp");

				} else if (command.equals("member_main")) {
					dispatch(request, response, "main.jsp");
				} else if (command.equals("member_selectone")) {

					int member_no = Integer.parseInt(request.getParameter("member_no"));
					request.setAttribute("MemberDto", biz.selectOne(member_no));
					dispatch(request, response, "myinfo.jsp");

				} else if (command.equals("member_idchk")) {
					String member_id = request.getParameter("id");
					String res = biz.idChk(member_id);
					if(member_id == null) {
						member_id = "";
					}
					boolean idnotused = true;

					if (member_id == ""|| member_id==null || res != null) {
						idnotused = false;
					}
					
					JSONObject obj = new JSONObject();
					obj.put("res",idnotused);
					PrintWriter out = response.getWriter();
					System.out.println(obj.toJSONString());
					out.println(obj.toJSONString());

				} else if (command.equals("member_nicknamechk")) {
					String member_nickname = request.getParameter("nick");
					String res = biz.nicknameChk(member_nickname);

					boolean nicknamenotused = true;

					if (res != null) {
						nicknamenotused = false;
					}
					
					JSONObject obj = new JSONObject();
					obj.put("res", nicknamenotused);
					PrintWriter out = response.getWriter();
					System.out.println(obj.toJSONString());
					out.println(obj.toJSONString());

				} else if (command.equals("member_insert")) {
					response.sendRedirect("regist.jsp");

				} else if (command.equals("member_regist")) {
					
					
					String member_id = request.getParameter("member_id");
					String member_pw = request.getParameter("member_pw");
					String member_name = request.getParameter("member_name");
					String member_nickname = request.getParameter("member_nickname");
					String member_email = request.getParameter("member_email");
					Date member_regdate = new Date();
					MemberDto MemberDto = new MemberDto(member_id, member_nickname, member_name, member_pw, member_email);
					
					int res = biz.insert(MemberDto);
					MemberDto.setMember_regdate(member_regdate);
					if (res > 0) {
						
						
						
						alert("다시 로그인 해주세요","main.jsp", response);
					} else {
						alert("가입이 실패하셨습니다.", "index.jsp", response);
					}
				
				}  else if (command.equals("member_update")) {
						response.sendRedirect("memberupdate.jsp");
				} else if (command.equals("member_updateres")) {

					String member_nickname = request.getParameter("member_nickname");
					String member_gender = request.getParameter("member_gender");
					String member_birth = request.getParameter("member_birth");
					String member_addr = request.getParameter("member_addr");
					String member_email = request.getParameter("member_email");
					String member_phone = request.getParameter("member_phone");
					String member_driveacc = request.getParameter("member_driveacc");
					int member_no = Integer.parseInt(request.getParameter("member_no"));

					MemberDto MemberDto = new MemberDto(member_nickname, member_gender, member_birth, member_addr,
							member_email, member_phone, member_driveacc, member_no);
					int res = biz.update(MemberDto);
					if (res > 0) {
						response.sendRedirect("main.jsp");
					} else {
						alert("회원정보 변경에 실패하셨습니다.", "main.jsp", response);
					}
				
				} else if (command.equals("member_pwupdate")) {
					int member_no = Integer.parseInt(request.getParameter("member_no"));
					request.setAttribute("MemberDto", biz.selectOne(member_no));
					dispatch(request, response, "memberpwupdate.jsp");

				} else if (command.equals("member_pwupdateres")) {

					String member_pw = request.getParameter("member_pw");
					int member_no = Integer.parseInt(request.getParameter("member_no"));
					MemberDto MemberDto = new MemberDto(member_pw, member_no);
					int res = biz.pwUpdate(MemberDto);
					if (res > 0) {
						request.getSession().invalidate();
						alert("비밀번호 변경에 성공하셨습니다. 다시 로그인해 주세요.", "login.jsp", response);
					} else {
						alert("비밀번호 변경에 실패하셨습니다.", "main.jsp", response);
					}

				} else if (command.equals("member_delete")) {
					int member_no = Integer.parseInt(request.getParameter("member_no"));
					int res = biz.delete(member_no);
					if (res > 0) {
						request.getSession().invalidate();
						response.sendRedirect("main.jsp");
					} else {
						alert("회원탈퇴에 실패하셨습니다.", "main.jsp", response);
					}
				} else if (command.equals("member_findid")) {
					String member_name = request.getParameter("member_name");
					String member_phone = request.getParameter("member_phone");
					String member_birth = request.getParameter("member_birth");
					request.setAttribute("MemberDto", biz.findId(member_name, member_phone, member_birth));
					dispatch(request, response, "findid.jsp");
				} else if (command.equals("member_findpw")) {
					String member_id = request.getParameter("member_id");
					String member_phone = request.getParameter("member_phone");
					request.setAttribute("MemberDto", biz.findPw(member_id, member_phone));
					dispatch(request, response, "findpw.jsp");
				} else if(command.equals("member_myboard")) {
					

				}
			} else if (command.contains("rent")) {

				if (command.equals("rentboard_selectlist")) {

					String rent_company = request.getParameter("rent_company");
					String rent_size = request.getParameter("rent_size");
					String rent_fuel = request.getParameter("rent_fuel");
					String rent_location = request.getParameter("rent_location");
					int rent_price = 100000;
					try {
					rent_price = Integer.parseInt(request.getParameter("rent_price"));
					}catch(NumberFormatException e) {
						System.out.println("price 널포인트");
					}
					RentBoardDto dto = new RentBoardDto();
					dto.setRent_company(rent_company);
					dto.setRent_size(rent_size);
					dto.setRent_fuel(rent_fuel);
					dto.setRent_location(rent_location);
					dto.setRent_price(rent_price);

					RentBoardBiz rent_biz = new RentBoardBiz();
					if (searchtype != null && searchinput != null) {
						String search[] = searchtype.split("A");
						for (int i = 0; i < search.length; i++) {
							if(search[i].equals("writer")) {
								dto.setRent_writer(searchinput);
							}else if(search[i].equals("content")) {
								dto.setRent_content(searchinput);
							}else if(search[i].equals("title")) {
								dto.setRent_title(searchinput);
							}
						}
					}
					List<RentBoardDto> list = rent_biz.rentboard_selectlist(dto);
					request.setAttribute("list", list);
					dispatch(request, response, "rentlist.jsp");

				} else if (command.equals("rentboard_selectone")) {
					RentBoardBiz rent_biz = new RentBoardBiz();
					int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
					RentBoardDto rent_dto = rent_biz.rentboard_selectone(rent_board_no);
					request.setAttribute("dto", rent_dto);
					dispatch(request, response, "rentselectone.jsp");

				} else if (command.equals("rentboard_insert")) {
					if (request.getSession().getAttribute("MemberDto") == null) {
						response.sendRedirect("login.jsp");
					} else {
						response.sendRedirect("rentinsert.jsp");
					}

				} else if (command.equals("rentinsertres")) {
					String rent_process = request.getParameter("rent_process");
					String rent_title = request.getParameter("rent_title");
					String rent_writer = request.getParameter("rent_writer");
					String rent_company = request.getParameter("rent_company");
					String rent_size = request.getParameter("rent_size");
					String rent_fuel = request.getParameter("rent_fuel");
					int rent_price = Integer.parseInt(request.getParameter("rent_price"));
					String rent_location = request.getParameter("rent_location");
					String rent_img = request.getParameter("rent_img");
					String rent_x_point = request.getParameter("rent_x_point");
					String rent_y_point = request.getParameter("rent_y_point");
					String rent_carname = request.getParameter("rent_carname");
					String rent_content = request.getParameter("rent_content");
					String rent_carno = request.getParameter("rent_carno");

					RentBoardDto rent_dto = new RentBoardDto(rent_process, rent_title, rent_writer, rent_company,
							rent_size, rent_fuel, rent_price, rent_location, rent_img, rent_carname, rent_content);
					rent_dto.setRent_carno(rent_carno);
					rent_dto.setRent_x_point(rent_x_point);
					rent_dto.setRent_y_point(rent_y_point);

					RentBoardBiz rent_biz = new RentBoardBiz();
					int res = rent_biz.rentboard_insert(rent_dto);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=rentboard_selectlist");
					} else {
						alert("차량등록실패", "doncar.do?command=rentboard_selectlist", response);
					}

				} else if (command.equals("rentboard_update")) {
					RentBoardBiz rent_biz = new RentBoardBiz();
					int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
					RentBoardDto rent_dto = rent_biz.rentboard_selectone(rent_board_no);
					request.setAttribute("dto", rent_dto);
					dispatch(request, response, "rentupdate.jsp");

				} else if (command.equals("rentupdateres")) {
					int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
					String rent_title = request.getParameter("rent_title");
					String rent_company = request.getParameter("rent_company");
					String rent_size = request.getParameter("rent_size");
					String rent_fuel = request.getParameter("rent_fuel");
					int rent_price = Integer.parseInt(request.getParameter("rent_price"));
					String rent_location = request.getParameter("rent_location");
					String rent_img = request.getParameter("rent_img");
					String rent_carname = request.getParameter("rent_carname");
					String rent_content = request.getParameter("rent_content");

					RentBoardDto rent_dto = new RentBoardDto(rent_board_no, rent_title, rent_company, rent_size,
							rent_fuel, rent_price, rent_location, rent_img, rent_carname, rent_content);
					RentBoardBiz rent_biz = new RentBoardBiz();
					int res = rent_biz.rentboard_update(rent_dto);
					request.setAttribute("dto", rent_dto);
					dispatch(request, response,
							"doncar.do?command=rentboard_selectone&rent_board_no=<%=dto.getRent_board_no()%>");

				} else if (command.equals("rentboard_delete")) {
					int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
					RentBoardBiz rent_biz = new RentBoardBiz();
					int res = rent_biz.rentboard_delete(rent_board_no);
					response.sendRedirect("doncar.do?command=rentboard_selectlist");
					
				} else if (command.equals("rentacc_selectlist")) {
					RentAccBiz rentacc_biz = new RentAccBiz();
					List<RentAccDto> rentacc_list = rentacc_biz.rentacc_selectlist();
					request.setAttribute("list", rentacc_list);
					dispatch(request, response, "rentacclist.jsp");

				} else if (command.equals("rentacc_selectone")) {
					int rentacc_no = Integer.parseInt(request.getParameter("rentacc_no"));
					RentAccBiz rent_biz = new RentAccBiz();
					RentAccDto rent_dto = rent_biz.rentacc_selectone(rentacc_no);
					request.setAttribute("dto", rent_dto);
					dispatch(request, response, "rentaccselectone.jsp");

				} else if (command.equals("rentacc_insert")) {
					
					int rentacc_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
					System.out.println(rentacc_board_no);
					RentAccDto rentaccdto = new RentAccDto();
					
					rentaccdto.setRent_board_no(rentacc_board_no);
					request.setAttribute("rentaccdto", rentaccdto);
					dispatch(request, response, "rentaccinsert.jsp");

				} else if (command.equals("rentacc_insertres")) {
				int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
				String start_date = request.getParameter("rentacc_start_date");
				String end_date = request.getParameter("rentacc_end_date");
				Date rentacc_start_date = null;
				Date rentacc_end_date = null;
				try {
					rentacc_start_date = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
					rentacc_end_date = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
				} catch (ParseException e) {
					System.out.println("String to date Fail");
					e.printStackTrace();
					
				}
				
				String rentacc_comment = request.getParameter("rentacc_comment");
				String rentacc_nickname = request.getParameter("rentacc_nickname");
				
				RentAccDto rentacc_dto = new RentAccDto(rent_board_no,rentacc_start_date,rentacc_end_date,rentacc_comment);
				rentacc_dto.setRentacc_nickname(rentacc_nickname);
				RentAccBiz rentacc_biz = new RentAccBiz();
				int res = rentacc_biz.rentacc_insert(rentacc_dto);
				if(res>0) {
					response.sendRedirect("doncar.do?command=rentboard_selectone&rent_board_no="+rent_board_no);
				}else {
					alert("신청실패", "index.jsp", response);
				}
				
				
				}else if (command.equals("rentacc_delete")) {
					int rentacc_no = Integer.parseInt(request.getParameter("rentacc_no"));
					RentAccBiz biz = new RentAccBiz();
					int res = biz.rentacc_delete(rentacc_no);
					if(res>0) {
						response.sendRedirect("main.jsp");
					}else {
						alert("삭제실패", "main.jsp", response);
					}
				}else if(command.equals("rentacc_updateacc")) {
					RentAccBiz biz = new RentAccBiz();
					RentBoardBiz boardbiz = new RentBoardBiz();
					String acc = request.getParameter("acc");
					int rentacc_no = Integer.parseInt(request.getParameter("rentacc_no"));
					RentAccDto dto = new RentAccDto();
					dto.setRentacc_acc(acc);
					dto.setRentacc_no(rentacc_no);
					if (acc.equals("Y")) {
						dto.setRentacc_process("결제대기");
						RentAccDto accdto = biz.rentacc_selectone(rentacc_no);
						RentBoardDto boarddto = boardbiz.rentboard_selectone(accdto.getRent_board_no());
						
						ChatBiz chatbiz = new ChatBiz();
						ChatDto chatdto = new ChatDto();
						chatdto.setRent_board_no(boarddto.getRent_board_no());
						chatdto.setContent(boarddto.getRent_title());
						chatdto.setUser1(boarddto.getRent_writer());
						chatdto.setUser2(accdto.getRentacc_nickname());
						chatdto.setCar_board_no(0);;
						int res = chatbiz.insert(chatdto);
						if(res>0) {
							System.out.println(chatdto);
							System.out.println("CHATDTO 삽입 성공");
						}else {
							System.out.println("CHATDTO 삽입실패");
						}
					}else {
						dto.setRentacc_process("거절");
					}
					int res = biz.updateacc(dto);
					if(res>0) {
						response.sendRedirect("usermain.jsp");
					}else {
						alert("승인실패", "usermain.jsp", response);
					}
				}
			}else if (command.contains("car")) {

				CarBoardBiz carboardbiz = new CarBoardBiz();
				CarAccBiz caraccbiz = new CarAccBiz();

				if (command.equals("carboard_selectlist")) {
					
					Date car_board_startdate = setTodates(request.getParameter("car_board_startdate"));
					String car_board_startpoint = request.getParameter("car_board_startpoint");
					String car_board_endpoint = request.getParameter("car_board_endpoint");
					
					CarBoardDto dto = new CarBoardDto();
					dto.setCar_board_startdate(car_board_startdate);
					dto.setCar_board_startpoint(car_board_startpoint);
					dto.setCar_board_endpoint(car_board_endpoint);
					if (searchtype != null && searchinput != null) {
						String search[] = searchtype.split("A");
						for (int i = 0; i < search.length; i++) {
							if(search[i].equals("writer")) {
								dto.setCar_board_writer(searchinput);
							}else if(search[i].equals("content")) {
								dto.setCar_board_content(searchinput);
							}else if(search[i].equals("title")) {
								dto.setCar_board_title(searchinput);
							}
						}
					}
					List<CarBoardDto> list = carboardbiz.selectList(dto);

					request.setAttribute("list", list);
					dispatch(request, response, "carpoolboardlist.jsp");

				} else if (command.equals("carboard_selectone")) {

					int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
					
					CarBoardDto dto = carboardbiz.selectOne(car_board_no);
					
					request.setAttribute("dto", dto);
					dispatch(request, response, "carpoolone.jsp");

				} else if (command.equals("carboard_regist")) {
					if(request.getSession().getAttribute("MemberDto")==null) {
						alert("로그인을 먼저해주세요!", "login.jsp", response);
						return;
					}
					response.sendRedirect("carpoolinsert.jsp");

				} else if (command.equals("carboard_insert")) {

					String car_board_title = request.getParameter("car_board_title");
					String car_board_writer = request.getParameter("car_board_writer");
					int car_board_price = Integer.parseInt(request.getParameter("car_board_price"));
					Date car_board_startdate = setTodates(request.getParameter("car_board_startdate"));
					String car_board_startpoint = request.getParameter("car_board_startpoint");
					String car_board_endpoint = request.getParameter("car_board_endpoint");
					String car_board_x_point = request.getParameter("car_board_x_point");
					String car_board_y_point = request.getParameter("car_board_y_point");
					String car_board_content = request.getParameter("car_board_content");

					CarBoardDto dto = new CarBoardDto();
					dto.setCar_board_title(car_board_title);
					dto.setCar_board_writer(car_board_writer);
					dto.setCar_board_price(car_board_price);
					dto.setCar_board_startdate(car_board_startdate);
					dto.setCar_board_startpoint(car_board_startpoint);
					dto.setCar_board_endpoint(car_board_endpoint);
					dto.setCar_board_x_point(car_board_x_point);
					dto.setCar_board_y_point(car_board_y_point);
					dto.setCar_board_content(car_board_content);

					int res = carboardbiz.insert(dto);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=carboard_selectlist");
					} else {
						alert("작성 실패", "doncar.do?command=carboard_selectlist", response);
					}

				} else if (command.equals("carboard_delete")) {

					int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
					System.out.println(car_board_no);

					int res = carboardbiz.delete(car_board_no);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=carboard_selectlist");
					} else {
						alert("삭제 실패", "doncar.do?command=carboard_selectone&car_board_no=" + car_board_no, response);
					}

				} else if (command.equals("carboard_update")) {

					int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));

					CarBoardDto dto = carboardbiz.selectOne(car_board_no);

					request.setAttribute("dto", dto);
					dispatch(request, response, "carpoolupdate.jsp");

				} else if (command.equals("carboard_updateres")) {

					int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
					String car_board_title = request.getParameter("car_board_title");
					String car_board_writer = request.getParameter("car_board_writer");
					Date car_board_startdate = setTodates(request.getParameter("car_board_startdate"));
					int car_board_price = Integer.parseInt(request.getParameter("car_board_price"));
					String car_board_startpoint = request.getParameter("car_board_startpoint");
					String car_board_endpoint = request.getParameter("car_board_endpoint");
					String car_board_x_point = request.getParameter("car_board_x_point");
					String car_board_y_point = request.getParameter("car_board_y_point");
					String car_board_content = request.getParameter("car_board_content");

					CarBoardDto dto = new CarBoardDto();
					dto.setCar_board_no(car_board_no);
					dto.setCar_board_title(car_board_title);
					dto.setCar_board_writer(car_board_writer);
					dto.setCar_board_price(car_board_price);
					dto.setCar_board_startdate(car_board_startdate);
					dto.setCar_board_startpoint(car_board_startpoint);
					dto.setCar_board_endpoint(car_board_endpoint);
					dto.setCar_board_x_point(car_board_x_point);
					dto.setCar_board_y_point(car_board_y_point);
					dto.setCar_board_content(car_board_content);

					int res = carboardbiz.update(dto);

					System.out.println(res);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=carboard_selectone&car_board_no=" + car_board_no);
					} else {
						alert("수정 실패", "doncar.do?command=carboard_selectone&car_board_no=" + car_board_no, response);
					}

				} else if (command.equals("caracc_selectlist")) {

					List<CarAccDto> list = caraccbiz.selectList();

					request.setAttribute("list", list);
					dispatch(request, response, "caracclist.jsp");

				} else if (command.equals("caracc_selectone")) {

					int caracc_no = Integer.parseInt(request.getParameter("caracc_no"));

					CarAccDto dto = caraccbiz.selectOne(caracc_no);

					request.setAttribute("dto", dto);
					dispatch(request, response, "caraccone.jsp");

				} else if (command.equals("caracc_regist")) {

					response.sendRedirect("caraccinsert.jsp");

				} else if (command.equals("caracc_insert")) {
					int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
					String caracc_nickname = request.getParameter("caracc_nickname");
					String caracc_coment = request.getParameter("caracc_coment");
					String caracc_xpoint = request.getParameter(	"caracc_xpoint");
					String caracc_ypoint = request.getParameter("caracc_ypoint");
					String caracc_acc = "N";

					CarAccDto dto = new CarAccDto();
					dto.setCar_board_no(car_board_no);
					dto.setCaracc_xpoint(caracc_xpoint);
					dto.setCaracc_ypoint(caracc_ypoint);
					dto.setCaracc_coment(caracc_coment);
					dto.setCaracc_nickname(caracc_nickname);
					dto.setCaracc_acc(caracc_acc);

					int res = caraccbiz.insert(dto);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=carboard_selectone&car_board_no="+car_board_no);
					} else {
						alert("실패", "doncar.do?command=carboard_selectone&car_board_no="+car_board_no, response);
					}

				} else if (command.equals("caracc_delete")) {

					int caracc_no = Integer.parseInt(request.getParameter("caracc_no"));

					int res = caraccbiz.delete(caracc_no);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=caracc_selectlist");
					} else {
						alert("삭제 실패", "doncar.do?command=caracc_selectone&caracc_no=" + caracc_no, response);
					}

				} else if (command.equals("caracc_update")) {

					int caracc_no = Integer.parseInt(request.getParameter("caracc_no"));

					CarAccDto dto = caraccbiz.selectOne(caracc_no);
					request.setAttribute("dto", dto);
					dispatch(request, response, "caraccupdate.jsp");

				} else if (command.equals("caracc_updateres")) {

					int caracc_no = Integer.parseInt(request.getParameter("caracc_no"));
					String caracc_process = request.getParameter("caracc_process");
					String caracc_xpoint = request.getParameter("caracc_xpoint");
					String caracc_ypoint = request.getParameter("caracc_ypoint");
					String caracc_coment = request.getParameter("caracc_coment");
					String caracc_nickname = request.getParameter("caracc_nickname");
					String caracc_acc = request.getParameter("caracc_acc");

					CarAccDto dto = new CarAccDto();
					dto.setCaracc_no(caracc_no);
					dto.setCaracc_process(caracc_process);
					dto.setCaracc_xpoint(caracc_xpoint);
					dto.setCaracc_ypoint(caracc_ypoint);
					dto.setCaracc_coment(caracc_coment);
					dto.setCaracc_nickname(caracc_nickname);
					dto.setCaracc_acc(caracc_acc);

					int res = caraccbiz.update(dto);

					if (res > 0) {
						response.sendRedirect("doncar.do?command=caracc_selectone&caracc_no=" + caracc_no);
					} else {
						alert("수정 실패", "doncar.do?command=caracc_update&caracc_no" + caracc_no, response);
					}

				}else if (command.equals("caracc_updateacc")) {
					String acc = request.getParameter("acc");
					int caracc_no = Integer.parseInt(request.getParameter("caracc_no"));
					CarAccBiz biz = new CarAccBiz();
					CarAccDto dto = new CarAccDto();
					CarBoardBiz boardbiz = new CarBoardBiz();
					dto.setCaracc_acc(acc);
					dto.setCaracc_no(caracc_no);
					if(acc.equals("Y")) {
						dto.setCaracc_process("결제대기");
						
						CarAccDto accdto = biz.selectOne(caracc_no);
						CarBoardDto boarddto = boardbiz.selectOne(accdto.getCar_board_no());
						
						ChatBiz chatbiz = new ChatBiz();
						ChatDto chatdto = new ChatDto();
						chatdto.setCar_board_no(boarddto.getCar_board_no());
						chatdto.setContent(boarddto.getCar_board_title());
						chatdto.setUser1(boarddto.getCar_board_writer());
						chatdto.setUser2(accdto.getCaracc_nickname());
						chatdto.setRent_board_no(0);;
						int res = chatbiz.insert(chatdto);
						if(res>0) {
							System.out.println(chatdto);
							System.out.println("CHATDTO 삽입 성공");
						}else {
							System.out.println("CHATDTO 삽입실패");
						}
					}else {
						dto.setCaracc_process("거절");
					}
					int res = biz.updateacc(dto);
					if(res>0) {
						response.sendRedirect("usermain.jsp");
					}else {
						alert("승인실패","usermain.jsp",response);
					}
				}
			} else if (command.contains("chat")) {
				ChatBiz biz = new ChatBiz();
				if (command.equals("chat_selectlist")) {
					String nickname = request.getParameter("nickname");
					List<ChatDto> list = biz.selectlist(nickname);
					request.setAttribute("list", list);
					dispatch(request, response, "chatlist.jsp");
				} else if (command.equals("chat_selectone")) {

					
				} else if (command.equals("chat_insert")) {
					
				} else if (command.equals("chat_delete")) {

				} else if (command.equals("chat_update")) {
				}
			} else if (command.contains("free")) {
				if (command.equals("freeboard_selectlist")) {
					FreeBoardDto dto = new FreeBoardDto();
					if (searchtype != null && searchinput != null) {
						String search[] = searchtype.split("A");
						for (int i = 0; i < search.length; i++) {
							if(search[i].equals("writer")) {
								dto.setFree_writer(searchinput);
								System.out.println(dto.getFree_writer());
							}else if(search[i].equals("content")) {
								dto.setFree_content(searchinput);
								System.out.println(dto.getFree_content());
							}else if(search[i].equals("title")) {
								dto.setFree_title(searchinput);
								System.out.println(dto.getFree_title());
							}
						}
					}
					
					FreeBoardBiz biz = new FreeBoardBiz();
					List<FreeBoardDto> list = biz.selectlist(dto);
					request.setAttribute("list", list);
					dispatch(request, response, "freelist.jsp");

				} else if (command.equals("freeboard_selectone")) {
					int free_board_no = Integer.parseInt(request.getParameter("free_board_no"));
					FreeBoardBiz biz = new FreeBoardBiz();
					FreeBoardDto dto = biz.selectone(free_board_no);
					request.setAttribute("dto", dto);
					dispatch(request, response, "freeone.jsp");

				} else if (command.equals("freeboard_insert")) {
					if (request.getSession().getAttribute("MemberDto") == null) {
						alert("로그인을 해주세요", "login.jsp", response);
						return;
					}
					response.sendRedirect("freeinsert.jsp");

				} else if (command.equals("freeboard_insertres")) {
					if (request.getSession().getAttribute("MemberDto") == null) {
						alert("로그인을 해주세요", "login.jsp", response);
						return;
					}
					String free_title = request.getParameter("free_title");
					String free_writer = request.getParameter("free_writer");
					String free_content = request.getParameter("free_content");
					FreeBoardDto dto = new FreeBoardDto(free_title, free_writer, free_content);
					FreeBoardBiz biz = new FreeBoardBiz();
					int res = biz.insert(dto);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=freeboard_selectlist&nowPage=1");
					} else {
						alert("글 작성 실패", "doncar.do?command=freeboard_insert", response);
					}

				} else if (command.equals("freeboard_update")) {
					int free_board_no = Integer.parseInt(request.getParameter("free_board_no"));
					FreeBoardBiz biz = new FreeBoardBiz();
					FreeBoardDto dto = biz.selectone(free_board_no);
					request.setAttribute("dto", dto);
					dispatch(request, response, "freeupdate.jsp");

				} else if (command.equals("freeboard_updateres")) {
					int free_board_no = Integer.parseInt(request.getParameter("free_board_no"));
					String free_title = request.getParameter("free_title");
					String free_content = request.getParameter("free_content");
					FreeBoardDto dto = new FreeBoardDto(free_board_no, free_title, free_content);
					FreeBoardBiz biz = new FreeBoardBiz();
					int res = biz.update(dto);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=freeboard_selectlist");
					} else {
						alert("글 수정 실패", "doncar.do?command=freeboard_selectone", response);
					}
				} else if (command.equals("freeboard_delete")) {
					int free_board_no = Integer.parseInt(request.getParameter("free_board_no"));
					FreeBoardBiz biz = new FreeBoardBiz();
					int res = biz.delete(free_board_no);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=freeboard_selectlist");
					} else {
						alert("글 삭제 실패", "doncar.do?command=freeboard_selectone", response);
					}
				}
			} else if (command.contains("notice")) {
				if (command.equals("noticeboard_selectlist")) {
					NoticeBoardDto dto = new NoticeBoardDto();
					if (searchtype != null && searchinput != null) {
						String search[] = searchtype.split("A");
						for (int i = 0; i < search.length; i++) {
							if(search[i].equals("writer")) {
								dto.setNotice_writer(searchinput);
							}else if(search[i].equals("content")) {
								dto.setNotice_content(searchinput);
							}else if(search[i].equals("title")) {
								dto.setNotice_title(searchinput);
							}
						}
					}
					
					NoticeBoardBiz biz = new NoticeBoardBiz();
					List<NoticeBoardDto> list = biz.selectlist(dto);
					request.setAttribute("list", list);
					dispatch(request, response, "noticelist.jsp");
				} else if (command.equals("noticeboard_selectone")) {
					int notice_no = Integer.parseInt(request.getParameter("notice_no"));
					NoticeBoardBiz biz = new NoticeBoardBiz();
					NoticeBoardDto dto = biz.selectone(notice_no);
					request.setAttribute("dto", dto);
					dispatch(request, response, "noticeone.jsp");

				} else if (command.equals("noticeboard_insert")) {
					response.sendRedirect("noticeinsert.jsp");

				} else if (command.equals("noticeboard_insertres")) {
					String notice_title = request.getParameter("notice_title");
					String notice_writer = request.getParameter("notice_writer");
					String notice_content = request.getParameter("notice_content");
					NoticeBoardBiz biz = new NoticeBoardBiz();
					NoticeBoardDto dto = new NoticeBoardDto(notice_title, notice_writer, notice_content);
					int res = biz.insert(dto);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=noticeboard_selectlist");
					} else {
						alert("글 작성 실패", "doncar.do?command=noticeboard_insert", response);
					}
				} else if (command.equals("noticeboard_delete")) {
					int notice_no = Integer.parseInt(request.getParameter("notice_no"));
					NoticeBoardBiz biz = new NoticeBoardBiz();
					int res = biz.delete(notice_no);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=noticeboard_selectlist");
					} else {
						alert("글 삭제 실패", "doncar.do?command=noticeboard_selectone", response);
					}

				} else if (command.equals("noticeboard_update")) {
					int notice_no = Integer.parseInt(request.getParameter("notice_no"));
					NoticeBoardBiz biz = new NoticeBoardBiz();
					NoticeBoardDto dto = biz.selectone(notice_no);
					request.setAttribute("dto", dto);
					dispatch(request, response, "noticeupdate.jsp");
				} else if (command.equals("noticeboard_updateres")) {
					int notice_no = Integer.parseInt(request.getParameter("notice_no"));
					String notice_title = request.getParameter("notice_title");
					String notice_content = request.getParameter("notice_content");
					NoticeBoardDto dto = new NoticeBoardDto(notice_no, notice_title, notice_content);
					NoticeBoardBiz biz = new NoticeBoardBiz();
					int res = biz.update(dto);
					if (res > 0) {
						response.sendRedirect("doncar.do?command=noticeboard_selectlist");
					} else {
						alert("글 수정 실패", "doncar.do?command=noticeboard_update", response);
					}
				}
			}else if(command.equals("mailUpdate")){

				String mail_addr = request.getParameter("mail_addr");
				int member_no = Integer.parseInt(request.getParameter("member_no"));
				
				MemberBiz biz = new MemberBiz();
				MemberDto dto = new MemberDto();
				dto.setMember_email(mail_addr);
				dto.setMember_no(member_no);
				int res = biz.updateMail(dto);
					
				if(res>0) {
					close("이메일인증이 완료되었습니다",response);
				}else {
					close("인증이 실패했습니다.",response);
				}
			}else if(command.equals("sendmailUpdate")){
				String mail_addr = request.getParameter("mail_addr");
				String member_no = request.getParameter("member_no");
				System.out.println("member_no 는 "+ member_no);
				MailSend ms = new MailSend();
				MemberBiz biz = new MemberBiz();
				MemberDto dto = biz.selectMail(mail_addr);
				if(dto!=null) {
					close("이미 등록된 이메일 주소입니다. 다시 한번확인해주세요",response);
				}
				try{
				ms.MailInsert(mail_addr, member_no);
				}catch(SendFailedException e){
					close("잘못된 이메일주소입니다. 이메일주소를 확인해주세요",response);
				}
				close("메일 전송성공! 메일함을 확인해주세요",response);
			}else if(command.equals("email_findid")) {
				String mail_addr = request.getParameter("mail_addr");
				MemberBiz biz = new MemberBiz();
				MemberDto dto = biz.selectMail(mail_addr);
				if(dto==null) {
					close("등록되어있지않은 이메일 주소입니다. 다시 한번확인해주세요",response);
				}
				MailSend ms = new MailSend();
				try{
				ms.findID(mail_addr);
				}catch(SendFailedException e){
					close("잘못된 이메일주소입니다. 이메일주소를 확인해주세요",response);
				}
				close("메일 전송성공! 메일함을 확인해주세요",response);
			}else if(command.equals("email_findpw")) {
				String mail_addr = request.getParameter("mail_addr");
				MemberBiz biz = new MemberBiz();
				MemberDto dto = biz.selectMail(mail_addr);
				if(dto==null) {
					close("등록되어있지않은 이메일 주소입니다. 다시 한번확인해주세요",response);
				}
				MailSend ms = new MailSend();
				try{
					ms.findPW(mail_addr);
					}catch(SendFailedException e){
						close("잘못된 이메일주소입니다. 이메일주소를 확인해주세요",response);
					}
					close("메일 전송성공! 메일함을 확인해주세요",response);
			}else{
					response.sendRedirect("error.jsp?command=" + command);
			}
		}else {
			alert("command가 널값임", "main.jsp", response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void alert(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.print("<script> alert('" + msg + "'); location.href='" + url + "'; </script>");
	}
	
	public void close(String msg,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + msg + "'); window.close();</script>");
	}

}