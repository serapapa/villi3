package com.lec.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver")
	public class chatserver {
		
		// ���� ä�� ������ ������ Ŭ���̾�Ʈ(WebSocket Session) ���
		// static �ٿ�����!!
		private static List<Session> list = new ArrayList<Session>();
		
		private void print(String msg) {
			System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
		}
		
		@OnOpen
		public void handleOpen(Session session) {
			print("Ŭ���̾�Ʈ ����");
			list.add(session); // ������ ����(****)
		}
		
		@OnMessage
		public void handleMessage(String msg, Session session) {
			
			// �α����� ��: 1#������
			// ��ȭ  �� ��: 2������#�޼���		
			int index = msg.indexOf("#", 2);
			String no = msg.substring(0, 1); 
			String user = msg.substring(2, index);
			String txt = msg.substring(index + 1);
			
			if (no.equals("1")) {
				// ������ ���� > 1#�ƹ���
				for (Session s : list) {
					if (s != session) { // ���� �����ڰ� �ƴ� ������ �����
						
						try {
							s.getBasicRemote().sendText("1#" + user + "#");
						} catch (IOException e) {
							e.printStackTrace();
						}
						
					}
				}
				
			} else if (no.equals("2")) {
				// ������ �޼����� ����
				for (Session s : list) {
					
					if (s != session) { // ���� �����ڰ� �ƴ� ������ �����
						try {
							s.getBasicRemote().sendText("2#" + user + ":" + txt);
						} catch (IOException e) {
							e.printStackTrace();
						}
						
					}
					
				} 
			} else if (no.equals("3")) {
				// ������ ���� > 3#�ƹ���
				for (Session s : list) {
					
					if (s != session) { // ���� �����ڰ� �ƴ� ������ �����
						try {
							s.getBasicRemote().sendText("3#" + user + "#");
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					
				}
				list.remove(session);
			}
			
		}
		
		@OnClose
		public void handleClose() {
			
		}
		
		@OnError
		public void handleError(Throwable t) {
			
		}

	}

