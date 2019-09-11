package com.doncar.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chating")
public class WebChating {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static HashMap<Integer,Integer> user1 = new HashMap<Integer,Integer>();
	private static HashMap<Integer,Integer> user2 = new HashMap<Integer,Integer>();
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		if(message.contains("mynumis/")) {
			String[] temp = message.split("/");
			int num = Integer.parseInt(temp[1]);
			if(temp[2].equals("user1")) {
				user1.put(num, session.hashCode());
			}else {
				user2.put(num,session.hashCode());
			}
			return;
			
		}
		
		synchronized (clients) {
			int num1 = -1;
			int num2 = -1;
			
			for(Integer i : user1.keySet()) {
				if(user1.get(i)==session.hashCode()) {
					num1=i;
				}
			}
			for(Integer i : user2.keySet()) {
				if(user2.get(i)==session.hashCode()) {
					num2=i;
				}
			}
			int reciver;
				if(num1>0) {
					try {
						reciver= user2.get(num1);
					} catch (Exception  e) {
						System.out.println("상대방이 접속해있지 않습니다.");
						return;
					}
					for(Session client : clients) {
						if(client.hashCode() == reciver) {
							client.getBasicRemote().sendText(message);
						}
					}
				}else {
					try {
					reciver= user1.get(num2);
					} catch(Exception e) {
						System.out.println("상대방이 접속해있지 않습니다.");
						return;
					}
					for(Session client : clients) {
						if(client.hashCode() == reciver) {
							client.getBasicRemote().sendText(message);
						}
					}
				}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session.toString());
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}

}
