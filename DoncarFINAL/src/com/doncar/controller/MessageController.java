package com.doncar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.util.UrlUtil;
import org.json.simple.JSONObject;

import com.doncar.biz.ChatBiz;
import com.doncar.dao.ChatMessageDao;
import com.doncar.dto.ChatDto;
import com.doncar.dto.ChatMessageDto;

@WebServlet("/msg.do")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		ChatMessageDao dao = new ChatMessageDao();
		if (command.equals("insert_msg")) {
			int chat_no = Integer.parseInt(request.getParameter("chat_no"));
			String sender = request.getParameter("sender");
			String receiver = request.getParameter("receiver");
			String content = URLDecoder.decode(request.getParameter("content"),"utf-8");
			

			ChatMessageDto dto = new ChatMessageDto(chat_no, sender, receiver, content);
			System.out.println(dto);
			int res = dao.insertMsg(dto);
			
			if (res > 0) {
				System.out.println("MSG삽입 성공");

				JSONObject obj = new JSONObject();
				obj.put("sender", sender);
				content = URLEncoder.encode(content, "utf-8");
				obj.put("msg", content);
				obj.put("receiver", receiver);

				PrintWriter out = response.getWriter();
				out.println(obj.toJSONString());
			} else {
				System.out.println("MSG삽입 실패");
			}
		}else if(command.equals("selectlist_msg")) {
			int chat_no = Integer.parseInt(request.getParameter("chat_no"));
			ChatBiz biz = new ChatBiz();
			ChatDto dto = biz.selectone(chat_no);
			List<ChatMessageDto> list = dao.selectList(chat_no);
			request.setAttribute("list", list);
			request.setAttribute("dto", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("chating.jsp");
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
