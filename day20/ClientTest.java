package com.day20;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

//인터페이스는 다중상속 가능
public class ClientTest extends Frame implements ActionListener, Runnable {

	private TextArea ta = new TextArea();
	private TextField tf = new TextField();
	
	private Socket sc = null;
	private int port = 7777;
	private String host = "192.168.16.0"; //ip주소를 써도 되고 localhost 또는 127.0.0.1이라고 써도 된다. //서버의 아이피
	
	public ClientTest() {
		add(ta,BorderLayout.CENTER);
		add(tf,BorderLayout.SOUTH);
		
		tf.addActionListener(this);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setTitle("채팅 클라이언트");
		setSize(300, 400);
		setVisible(true);
		
	}
	

	@Override //Runnable
	public void run() {
		//메세지 받기
	
		String msg;
		
		try {
			
			if(sc==null) {
				return;
			}
			
			InputStream is = sc.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			
			
			while((msg = br.readLine())!=null) {
				ta.append("\r\n" + msg);
			}
			
		} catch (Exception e) {
			ta.append("\r\n" + "서버 연결 종료");
			sc = null;
		}
	}

	
	@Override //ActionListener
	public void actionPerformed(ActionEvent e) {
		//메세지 보내기
		
		String msg = tf.getText();
		
		if(msg.trim().equals("")) {
			return;
		}
		
		if(sc==null) {
			return;
		}
		
		try {
			
			//PrintWriter pw = new PrintWriter(sc.getOutputStream());
			
			OutputStream os = sc.getOutputStream();
			PrintWriter pw = new PrintWriter(os, true);
			//true: 마지막 문장이 버퍼를 채우지 않아도 나가라. flush같은 기능
			
			pw.println("dv] " + msg); //서버에 msg전송
			ta.append("\r\ndv] " + msg);//내 창에 msg 보임
			
			tf.setText("");
			tf.requestFocus();
			
	
		} catch (Exception e2) {
			ta.append("\r\n 서버와 연결이 끊겼습니다");
			sc = null;
		}
	}

	
	public void connect() {
		
		try {
			sc = new Socket(host, port); //ip와 포트번호
			
			Thread th = new Thread(this);
			th.start();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	
	
	public static void main(String[] args) {
		
		new ClientTest().connect();
		
	}
}
